Class {
	#name : #SKGridCoordinator,
	#superclass : #Object,
	#instVars : [
		'grid',
		'gridMatrix'
	],
	#category : #SqueakKara
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
	#'squeak_changestamp' : 'LK 5/24/2024 10:49'
}
SKGridCoordinator >> gridMatrix [

	^ gridMatrix ifNil: [gridMatrix := self createGridMatrix]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 5/24/2024 11:17'
}
SKGridCoordinator >> initializeForGrid: aGrid [

	super initialize.
	self grid: aGrid
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
