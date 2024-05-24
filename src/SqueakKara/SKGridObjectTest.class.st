Class {
	#name : #SKGridObjectTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #SqueakKara
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 5/24/2024 11:42'
}
SKGridObjectTest >> grid [

	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 5/22/2024 17:37'
}
SKGridObjectTest >> gridSize [

	^ 20 @ 20
]

{
	#category : #setup,
	#'squeak_changestamp' : 'LK 5/22/2024 17:37'
}
SKGridObjectTest >> setUp [

	grid := SKGrid newWithExtent: self gridSize
]

{
	#category : #setup,
	#'squeak_changestamp' : 'LK 5/22/2024 17:21'
}
SKGridObjectTest >> tearDown [

	grid abandon
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:43'
}
SKGridObjectTest >> testAbsolutePositionAfterInitialize [

	| object |
	
	object := SKGridObject newInGrid: self grid.
	self assert: object position = self grid position
	
	
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:43'
}
SKGridObjectTest >> testAbsolutePositionAfterInitializeAt22 [

	| object |
	
	object := SKGridObject newInGrid: self grid at: 2 @ 2.
	self assert: object position = (self grid position + (self grid pixelPerBlock @ self grid pixelPerBlock))
	
	
]

{
	#category : #'movement testing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:43'
}
SKGridObjectTest >> testAlignment [

	| object |
	
	object := SKGridObject newInGrid: self grid.
	object position: object position + ((1/4 * self grid pixelPerBlock) @ (1/4 * self grid pixelPerBlock)).
	
	self assert: object coordinates = (1 @ 1)
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:44'
}
SKGridObjectTest >> testCoordinatesAfterInitialize [

	| object |
	
	object := SKGridObject newInGrid: self grid.
	self assert: object coordinates = (1 @ 1)
	
	
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:44'
}
SKGridObjectTest >> testCoordinatesAfterInitializeAt22 [

	| object |
	
	object := SKGridObject newInGrid: self grid at: 2 @ 2.
	self assert: object coordinates = (2 @ 2)
	
	
]

{
	#category : #'movement testing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:43'
}
SKGridObjectTest >> testGridOutOfBounds1 [

	| object |
	
	object := SKGridObject newInGrid: self grid.
	object position: self grid position - (30 @ 30).
	
	self assert: object coordinates = (1 @ 1)
]

{
	#category : #'movement testing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:43'
}
SKGridObjectTest >> testGridOutOfBounds2 [

	| object |
	
	object := SKGridObject newInGrid: self grid at: self gridSize.
	object position: object position + (30 @ 30).
	
	self assert: object coordinates = self gridSize
]

{
	#category : #'movement testing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:43'
}
SKGridObjectTest >> testMovement [

	| object |
	
	object := SKGridObject newInGrid: self grid.
	object position: object position + (self grid pixelPerBlock @ self grid pixelPerBlock).
	
	self assert: object coordinates = (2 @ 2)
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:44'
}
SKGridObjectTest >> testRelativePositionAfterInitialize [

	| object |
	
	object := SKGridObject newInGrid: self grid.
	self assert: object relativePosition = (0 @ 0)
	
	
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:44'
}
SKGridObjectTest >> testRelativePositionAfterInitializeAt22 [

	| object |
	
	object := SKGridObject newInGrid: self grid at: 2 @ 2.
	self assert: object relativePosition = (self grid pixelPerBlock @ self grid pixelPerBlock)
	
	
]
