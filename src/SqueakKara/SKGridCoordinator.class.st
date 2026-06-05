"
SKGridCoordinator stores all objects within the SKGrid. All SKGridObjects within the grid must register with the SKGridCoordinator, which stores their position in its gridMatrix, which is made up of SKGridTiles.
"
Class {
	#name : #SKGridCoordinator,
	#superclass : #Object,
	#instVars : [
		'grid',
		'gridMatrix'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:57'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 5/24/2024 11:18'
}
SKGridCoordinator class >> newForGrid: aGrid [
	
	^ self basicNew initializeForGrid: aGrid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 5/24/2024 10:50'
}
SKGridCoordinator >> createGridMatrix [

	| aMatrix |

	aMatrix := Matrix rows: self grid gridWidth columns: self grid gridHeight.
	
	1 to: self grid gridWidth
		do: [:x | 1 to: self grid gridHeight
			do: [:y | aMatrix at: x at: y put: SKGridTile new]].
	
	^ aMatrix
]

{
	#category : #'object storing',
	#'squeak_changestamp' : 'jawi 5/28/2026 16:48'
}
SKGridCoordinator >> findFreeFields [

	| aSet |

	aSet := Set new.
	self gridMatrix indicesDo: [ :x :y | ((self getTileAtCoordinates: x @ y) isEmpty) 
		ifTrue: [ aSet add: x @ y ]].
	
	^ aSet
]

{
	#category : #'object storing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:07'
}
SKGridCoordinator >> getTileAtCoordinates: aPoint [

	(self grid isPointInGridDimensions: aPoint)
		ifTrue: [^ self gridMatrix at: aPoint x at: aPoint y]
		ifFalse: [^ SKGridNullTile new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 5/24/2024 10:48'
}
SKGridCoordinator >> grid [

	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 5/24/2024 10:48'
}
SKGridCoordinator >> grid: aGrid [

	grid := aGrid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/29/2026 18:53'
}
SKGridCoordinator >> gridMatrix [

	^ gridMatrix
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:57'
}
SKGridCoordinator >> gridMatrix: aMatrix [

	^ gridMatrix := aMatrix
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 6/5/2026 12:44'
}
SKGridCoordinator >> initializeForGrid: aGrid [

	self grid: aGrid;
		gridMatrix: self createGridMatrix.

	super initialize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AB 5/21/2026 20:01'
}
SKGridCoordinator >> isLocked: aPoint for: anActor [
	
	(self grid isPointInGridDimensions: aPoint) ifFalse: [ ^ false ].
	
	^ (self gridMatrix at: aPoint x at: aPoint y) lockedFor: anActor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/28/2026 11:16'
}
SKGridCoordinator >> isPointInGridDimensions: aPoint [

	^ self grid isPointInGridDimensions: aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 6/5/2026 13:19'
}
SKGridCoordinator >> lockAt: aPoint for: anActor [
	
	(self grid isPointInGridDimensions: aPoint)
		ifTrue: [
			| tile criticalSection |
			
			(self gridMatrix at: aPoint x at: aPoint y) lockBy: anActor.
			tile := self getTileAtCoordinates: aPoint.
			criticalSection := tile detect: [ :gameObject | gameObject isCriticalSection ].
			
			^ true ].
	
	^ false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 6/5/2026 13:22'
}
SKGridCoordinator >> lockGroup: aSymbol [

	self gridMatrix indicesDo: [ :x :y |
		| tile |
		
		tile := self getTileAtCoordinates: x @ y.
		]
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 5/24/2024 10:52'
}
SKGridCoordinator >> privateAdd: aGridObject to: aPoint [
	
	(self gridMatrix at: aPoint x at: aPoint y) 
		add: aGridObject
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 5/24/2024 10:59'
}
SKGridCoordinator >> privateFind: aGridObject [ 
	
	^ self gridMatrix
		detect: [:each | each includes: aGridObject]
		ifNone: [SKGridNullTile new]
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 5/24/2024 10:53'
}
SKGridCoordinator >> privateMove: aGridObject fromTile: aGridTile to: aPoint [

	self privateRemove: aGridObject fromTile: aGridTile;
		privateAdd: aGridObject to: aPoint
]

{
	#category : #private,
	#'squeak_changestamp' : 'LK 5/24/2024 10:54'
}
SKGridCoordinator >> privateRemove: aGridObject fromTile: aGridTile [
	
	aGridTile remove: aGridObject
]

{
	#category : #'object storing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:04'
}
SKGridCoordinator >> removeObject: aGridObject [

	| currentGridTile |
	
	currentGridTile := self privateFind: aGridObject.
	
	self privateRemove: aGridObject fromTile: currentGridTile

]

{
	#category : #'object storing',
	#'squeak_changestamp' : 'LK 5/24/2024 11:03'
}
SKGridCoordinator >> storeObject: aGridObject at: aPoint [

	| currentGridTile |
	
	currentGridTile := self privateFind: aGridObject.
	
	self privateMove: aGridObject fromTile: currentGridTile to: aPoint
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AB 5/21/2026 20:30'
}
SKGridCoordinator >> unlockAt: aPoint [
	
	(self grid isPointInGridDimensions: aPoint)
		ifTrue: [(self gridMatrix at: aPoint x at: aPoint y) unlock ]
]
