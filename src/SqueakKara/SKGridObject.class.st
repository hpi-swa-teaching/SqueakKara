"
SKGridObject is the common superclass shared by all objects that may appear within the SKGrid (namely SKKara, SKTrunk and SKCloverleaf). It mainly ensures that the objects remain aligned to the grid at all times and offers methods for interacting with the grid, such as detecting neighbours. Additionally, it provides an interface for setting the texture in the inheriting subclasses.
"
Class {
	#name : #SKGridObject,
	#superclass : #ImageMorph,
	#instVars : [
		'grid',
		'originalImage',
		'coordinates'
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
	#'squeak_changestamp' : 'LM 4/28/2026 19:08'
}
SKGridObject >> addToGrid [

	self grid addMorph: self.
	self notifyGridCoordinator
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'LM 4/28/2026 18:49'
}
SKGridObject >> coordinates [

	^ coordinates
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'LM 4/28/2026 19:34'
}
SKGridObject >> coordinates: aPoint [

	coordinates := (aPoint x clampLow: 1 high: self grid gridWidth) @(aPoint y clampLow: 1 high: self grid gridHeight).
	super position: self positionFromCoordinates
]

{
	#category : #'submorphs - add/remove',
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
	#'squeak_changestamp' : 'LM 4/28/2026 18:51'
}
SKGridObject >> initializeInGrid: aGrid at: aPoint [

	self grid: aGrid.
	super initialize.

	self coordinates: aPoint.
	self addToGrid.
	self setTexture.
	self scaleFactor: self scaleFactor
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
	#category : #geometry,
	#'squeak_changestamp' : 'LM 4/28/2026 20:55'
}
SKGridObject >> moveToCoordinates: aPoint [

	self gridCoordinator removeObject: self.
	self coordinates: aPoint.
	self notifyGridCoordinator.
	self changed
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
	#category : #geometry,
	#'squeak_changestamp' : 'LM 4/28/2026 19:15'
}
SKGridObject >> notifyGridCoordinator [

	self gridCoordinator storeObject: self at: self coordinates
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/27/2026 20:15'
}
SKGridObject >> originalImage [
	^ originalImage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/27/2026 20:15'
}
SKGridObject >> originalImage: aForm [
	originalImage := aForm
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 19:22'
}
SKGridObject >> positionFromCoordinates [

	^ self grid position
		+ (((self coordinates x - 1) * self grid pixelPerBlock)
		@ ((self coordinates y - 1) * self grid pixelPerBlock))
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'LK 5/22/2024 16:53'
}
SKGridObject >> relativePosition [

	^ self position - self grid position
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:03'
}
SKGridObject >> scaleFactor: aNumber [

	| size |
	size := self grid pixelPerBlock.

	self image: (self originalImage scaledToSize: size @ size).
	self extent: size @ size.
	super position: self positionFromCoordinates.
	self changed
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LM 4/27/2026 20:16'
}
SKGridObject >> setTexture [

	| aTextureLoader aForm |
	
	aTextureLoader := SKTextureLoader new.
	
	aForm := aTextureLoader
		getTexture: self textureFilename
		scaledToWidth: self grid pixelPerBlock * self scaleFactor.
		
	self image: aForm; originalImage: aForm
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'JJG 6/5/2024 17:21'
}
SKGridObject >> textureFilename [

	^ SubclassResponsibility
]
