"
A SKGridObjectTest is a Test to check the functionality of the SKGridObjects.

Instance Variables
	grid:		<SKGrid>

grid
	- The grid on which the Test run.

"
Class {
	#name : #SKGridObjectTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #SqueakKaraTests,
	#'squeak_changestamp' : 'LD 7/5/2026 15:50'
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
	#'squeak_changestamp' : 'JJG 6/12/2024 16:08'
}
SKGridObjectTest >> testAbsolutePositionAfterInitialize [

	| object |
	
	object := SKKara newInGrid: self grid.
	self assert: object position = self grid position
	
	
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'JJG 6/12/2024 16:08'
}
SKGridObjectTest >> testAbsolutePositionAfterInitializeAt22 [

	| object |
	
	object := SKKara newInGrid: self grid at: 2 @ 2.
	self assert: object position = (self grid position + (self grid pixelPerBlock @ self grid pixelPerBlock))
	
	
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'JJG 6/12/2024 16:09'
}
SKGridObjectTest >> testCoordinatesAfterInitialize [

	| object |
	
	object := SKKara newInGrid: self grid.
	self assert: object coordinates = (1 @ 1)
	
	
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'JJG 6/12/2024 16:09'
}
SKGridObjectTest >> testCoordinatesAfterInitializeAt22 [

	| object |
	
	object := SKKara newInGrid: self grid at: 2 @ 2.
	self assert: object coordinates = (2 @ 2)
	
	
]

{
	#category : #'movement testing',
	#'squeak_changestamp' : 'LM 4/28/2026 22:56'
}
SKGridObjectTest >> testGridOutOfBounds1 [

	| object |

	object := SKKara newInGrid: self grid at: 1@1.
	object moveToCoordinates: 0@0.

	self assert: object coordinates equals: 1@1
]

{
	#category : #'movement testing',
	#'squeak_changestamp' : 'LM 4/28/2026 22:56'
}
SKGridObjectTest >> testGridOutOfBounds2 [

	| object |

	object := SKKara newInGrid: self grid at: self gridSize.
	object moveToCoordinates: (self gridSize + (1@1)).

	self assert: object coordinates equals: self gridSize
]

{
	#category : #'movement testing',
	#'squeak_changestamp' : 'LM 4/29/2026 13:16'
}
SKGridObjectTest >> testHaloMovement [

	| object |

	object := SKKara newInGrid: self grid at: 1@1.

	object position: object position + (self grid pixelPerBlock @ self grid pixelPerBlock).
	self assert: object coordinates = (2@2)
]

{
	#category : #'movement testing',
	#'squeak_changestamp' : 'LM 4/28/2026 22:52'
}
SKGridObjectTest >> testMovement [

	| object |

	object := SKKara newInGrid: self grid at: 1@1.
	object moveToCoordinates: 2@2.
	
	self assert: object coordinates equals: 2@2.
	self deny: ((self grid gridCoordinator getTileAtCoordinates: 1@1) includes: object)
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'JJG 6/12/2024 16:09'
}
SKGridObjectTest >> testRelativePositionAfterInitialize [

	| object |
	
	object := SKKara newInGrid: self grid.
	self assert: object relativePosition = (0 @ 0)
	
	
]

{
	#category : #'initialization testing',
	#'squeak_changestamp' : 'JJG 6/12/2024 16:09'
}
SKGridObjectTest >> testRelativePositionAfterInitializeAt22 [

	| object |
	
	object := SKKara newInGrid: self grid at: 2 @ 2.
	self assert: object relativePosition = (self grid pixelPerBlock @ self grid pixelPerBlock)
	
	
]

{
	#category : #'layout testing',
	#'squeak_changestamp' : 'jawi 5/28/2026 15:15'
}
SKGridObjectTest >> testResizeUpdatesPositionFromCoordinates [

	| object expectedPosition |
	object := SKKara new initializeInGrid: grid at: 3 @ 4 with: 1 @ 1.

	self grid scaleFactor: 1.
	object scaleToFactor.

	expectedPosition := grid position
		+ (((3 - 1) * self grid pixelPerBlock)
		@ ((4 - 1) * self grid pixelPerBlock)).

	self assert: object position equals: expectedPosition
]

{
	#category : #'layout testing',
	#'squeak_changestamp' : 'jawi 5/28/2026 15:15'
}
SKGridObjectTest >> testVisualConsistencyOnResize [

	| object |
	object := SKKara new initializeInGrid: grid at: 3 @ 4 with: 1 @ 1.

	object scaleToFactor.

	self assert: object coordinates equals: 3 @ 4
]
