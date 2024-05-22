Class {
	#name : #SKGridObjectTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #SqueakKara
}

{
	#category : #setup,
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
	#'squeak_changestamp' : 'LK 5/22/2024 17:35'
}
SKGridObjectTest >> testAbsolutePositionAfterInitialize [

	| object |
	
	object := SKGridObject newInGrid: grid.
	self assert: object position = grid position
	
	
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'LK 5/22/2024 17:35'
}
SKGridObjectTest >> testAbsolutePositionAfterInitializeAt22 [

	| object |
	
	object := SKGridObject newInGrid: grid at: 2 @ 2.
	self assert: object position = (grid position + (grid pixelPerBlock @ grid pixelPerBlock))
	
	
]

{
	#category : #'movement testing',
	#'squeak_changestamp' : 'LK 5/22/2024 17:39'
}
SKGridObjectTest >> testAlignment [

	| object |
	
	object := SKGridObject newInGrid: grid.
	object position: object position + ((1/4 * grid pixelPerBlock) @ (1/4 * grid pixelPerBlock)).
	
	self assert: object coordinates = (1 @ 1)
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'LK 5/22/2024 17:35'
}
SKGridObjectTest >> testCoordinatesAfterInitialize [

	| object |
	
	object := SKGridObject newInGrid: grid.
	self assert: object coordinates = (1 @ 1)
	
	
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'LK 5/22/2024 17:35'
}
SKGridObjectTest >> testCoordinatesAfterInitializeAt22 [

	| object |
	
	object := SKGridObject newInGrid: grid at: 2 @ 2.
	self assert: object coordinates = (2 @ 2)
	
	
]

{
	#category : #'movement testing',
	#'squeak_changestamp' : 'LK 5/22/2024 17:36'
}
SKGridObjectTest >> testGridOutOfBounds1 [

	| object |
	
	object := SKGridObject newInGrid: grid.
	object position: grid position - (30 @ 30).
	
	self assert: object coordinates = (1 @ 1)
]

{
	#category : #'movement testing',
	#'squeak_changestamp' : 'LK 5/22/2024 17:37'
}
SKGridObjectTest >> testGridOutOfBounds2 [

	| object |
	
	object := SKGridObject newInGrid: grid at: self gridSize.
	object position: object position + (30 @ 30).
	
	self assert: object coordinates = self gridSize
]

{
	#category : #'movement testing',
	#'squeak_changestamp' : 'LK 5/22/2024 17:40'
}
SKGridObjectTest >> testMovement [

	| object |
	
	object := SKGridObject newInGrid: grid.
	object position: object position + (grid pixelPerBlock @ grid pixelPerBlock).
	
	self assert: object coordinates = (2 @ 2)
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'LK 5/22/2024 17:35'
}
SKGridObjectTest >> testRelativePositionAfterInitialize [

	| object |
	
	object := SKGridObject newInGrid: grid.
	self assert: object relativePosition = (0 @ 0)
	
	
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'LK 5/22/2024 17:27'
}
SKGridObjectTest >> testRelativePositionAfterInitializeAt22 [

	| object |
	
	object := SKGridObject newInGrid: grid at: 2 @ 2.
	self assert: object relativePosition = (grid pixelPerBlock @ grid pixelPerBlock)
	
	
]
