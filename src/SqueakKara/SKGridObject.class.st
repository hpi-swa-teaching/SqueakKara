Class {
	#name : #SKGridObject,
	#superclass : #Morph,
	#instVars : [
		'grid'
	],
	#category : #SqueakKara
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 5/22/2024 16:58'
}
SKGridObject class >> newInGrid: aGrid [

	^ self newInGrid: aGrid at: 0@0
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 5/22/2024 16:59'
}
SKGridObject class >> newInGrid: aGrid at: aPoint [

	^ self basicNew initializeInGrid: aGrid at: aPoint
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 5/22/2024 16:56'
}
SKGridObject >> addToGrid [

	self grid addMorph: self
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 5/22/2024 16:54'
}
SKGridObject >> alignToGrid [

	self coordinateX: self coordinateX;
		coordinateY: self coordinateY
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 5/22/2024 16:46'
}
SKGridObject >> coordinateX [

	^ 1 + (self relativePosition x / self grid pixelPerBlock) rounded
		clampLow: 1
		high: self grid gridWidth
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 5/22/2024 16:59'
}
SKGridObject >> coordinateX: aNumber [
	
	| anotherNumber aPoint |
	
	anotherNumber := (aNumber clampLow: 1 high: self grid gridWidth) - 1.
	aPoint := anotherNumber * self grid pixelPerBlock @ self relativePosition y.
	
	super position: self grid position + aPoint.
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 5/22/2024 16:45'
}
SKGridObject >> coordinateY [

	^ 1 + (self relativePosition y / self grid pixelPerBlock) rounded
		clampLow: 1
		high: self grid gridHeight
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 5/22/2024 16:59'
}
SKGridObject >> coordinateY: aNumber [
	
	| anotherNumber aPoint |
	
	anotherNumber := (aNumber clampLow: 1 high: self grid gridHeight) - 1.
	aPoint := self relativePosition x @ (anotherNumber * self grid pixelPerBlock).
	
	super position: self grid position + aPoint
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 5/22/2024 16:50'
}
SKGridObject >> coordinates [

	^ self coordinateX @ self coordinateY
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 5/22/2024 16:51'
}
SKGridObject >> coordinates: aPoint [

	self coordinateX: aPoint x;
		coordinateY: aPoint y
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 5/22/2024 16:57'
}
SKGridObject >> grid [

	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 5/22/2024 16:56'
}
SKGridObject >> grid: aGrid [

	grid := aGrid
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 5/22/2024 17:03'
}
SKGridObject >> initializeInGrid: aGrid at: aPoint [

	self grid: aGrid. 
	super initialize.
	
	self coordinates: aPoint;
		addToGrid;
		height: self grid pixelPerBlock;
		width: self grid pixelPerBlock
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 5/22/2024 17:00'
}
SKGridObject >> position: aPoint [
	"overwritten position method forces blocks to stay aligned when moving
	them with the halo"
	
	super position: aPoint.
	self alignToGrid
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 5/22/2024 16:53'
}
SKGridObject >> relativePosition [

	^ self position - self grid position
]
