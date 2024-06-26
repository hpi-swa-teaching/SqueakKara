"
SKGridObject is the common superclass shared by all objects that may appear within the SKGrid (namely SKKara, SKTrunk and SKCloverleaf). It mainly ensures that the objects remain aligned to the grid at all times and offers methods for interacting with the grid, such as detecting neighbours. Additionally, it provides an interface for setting the texture in the inheriting subclasses.
"
Class {
	#name : #SKGridObject,
	#superclass : #ImageMorph,
	#instVars : [
		'grid'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:54'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 5/22/2024 17:24'
}
SKGridObject class >> newInGrid: aGrid [

	^ self newInGrid: aGrid at: 1 @ 1
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 5/22/2024 16:59'
}
SKGridObject class >> newInGrid: aGrid at: aPoint [

	^ self basicNew initializeInGrid: aGrid at: aPoint
]

{
	#category : #texture,
	#'squeak_changestamp' : 'JJG 6/5/2024 16:41'
}
SKGridObject class >> textureDimension [

	^ 32
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
	#'squeak_changestamp' : 'LK 5/24/2024 11:11'
}
SKGridObject >> coordinateX: aNumber [
	
	| anotherNumber aPoint |
	
	anotherNumber := (aNumber clampLow: 1 high: self grid gridWidth) - 1.
	aPoint := anotherNumber * self grid pixelPerBlock @ self relativePosition y.
	
	super position: self grid position + aPoint.
	
	self notifyGridCoordinator
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
	#'squeak_changestamp' : 'LK 5/24/2024 11:11'
}
SKGridObject >> coordinateY: aNumber [
	
	| anotherNumber aPoint |
	
	anotherNumber := (aNumber clampLow: 1 high: self grid gridHeight) - 1.
	aPoint := self relativePosition x @ (anotherNumber * self grid pixelPerBlock).
	
	super position: self grid position + aPoint.
	
	self notifyGridCoordinator
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
	#'squeak_changestamp' : 'KD 6/11/2024 11:31'
}
SKGridObject >> coordinates: aPoint [

	self coordinateX: aPoint x;
		coordinateY: aPoint y.
		
]

{
	#category : #deletion,
	#'squeak_changestamp' : 'LK 5/24/2024 11:14'
}
SKGridObject >> delete [

	self gridCoordinator removeObject: self.
	super delete
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
	#category : #accessing,
	#'squeak_changestamp' : 'LK 5/24/2024 11:14'
}
SKGridObject >> gridCoordinator [

	^ self grid gridCoordinator
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JJG 6/5/2024 17:23'
}
SKGridObject >> initializeInGrid: aGrid at: aPoint [

	self grid: aGrid. 
	super initialize.
	
	self coordinates: aPoint;
		addToGrid;
		height: self grid pixelPerBlock;
		width: self grid pixelPerBlock;
		setTexture
]

{
	#category : #type,
	#'squeak_changestamp' : 'jt 6/11/2024 13:18'
}
SKGridObject >> isCloverleaf [

	^ false
]

{
	#category : #type,
	#'squeak_changestamp' : 'jt 6/11/2024 13:18'
}
SKGridObject >> isTrunk [
	
	^ false
]

{
	#category : #'neighbour detection',
	#'squeak_changestamp' : 'LK 5/24/2024 11:29'
}
SKGridObject >> neighboursAbove [

	^ self neighboursAt: SKDirection above
]

{
	#category : #'neighbour detection',
	#'squeak_changestamp' : 'LK 5/24/2024 11:29'
}
SKGridObject >> neighboursAt: aDirection [

	^ self gridCoordinator getTileAtCoordinates: aDirection + self coordinates
]

{
	#category : #'neighbour detection',
	#'squeak_changestamp' : 'LK 5/24/2024 11:30'
}
SKGridObject >> neighboursBelow [

	^ self neighboursAt: SKDirection below
]

{
	#category : #'neighbour detection',
	#'squeak_changestamp' : 'LK 5/24/2024 11:30'
}
SKGridObject >> neighboursHere [

	^ self neighboursAt: SKDirection here
]

{
	#category : #'neighbour detection',
	#'squeak_changestamp' : 'LK 5/24/2024 11:30'
}
SKGridObject >> neighboursLeft [

	^ self neighboursAt: SKDirection left
]

{
	#category : #'neighbour detection',
	#'squeak_changestamp' : 'LK 5/24/2024 11:30'
}
SKGridObject >> neighboursRight [

	^ self neighboursAt: SKDirection right
]

{
	#category : #positioning,
	#'squeak_changestamp' : 'LK 5/24/2024 11:10'
}
SKGridObject >> notifyGridCoordinator [

	self gridCoordinator storeObject: self at: self coordinates
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

{
	#category : #appearance,
	#'squeak_changestamp' : 'JJG 6/5/2024 17:25'
}
SKGridObject >> setTexture [

	| aTextureLoader aForm |
	
	aTextureLoader := SKTextureLoader new.
	
	aForm := aTextureLoader
		getTexture: self textureFilename
		scaledToWidth: self grid pixelPerBlock.
		
	self image: aForm
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'JJG 6/5/2024 17:21'
}
SKGridObject >> textureFilename [

	^ SubclassResponsibility
]
