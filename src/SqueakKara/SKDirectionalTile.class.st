"
A SKDirectionalTile is a grid object that can hinder karas movement depending on its direction.

Instance Variables
	direction:		<Point>

direction
	- direction of possible movement
"
Class {
	#name : #SKDirectionalTile,
	#superclass : #SKGridObject,
	#instVars : [
		'direction'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'LD 6/26/2026 11:05'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LD 6/26/2026 10:50'
}
SKDirectionalTile class >> newInGrid: aGrid at: aPoint enterFrom: aDirection [

	| directionalTile directionalTileDirection |
	
	directionalTileDirection := SKDirection mirror: aDirection.

	directionalTile := SKDirectionalTile basicNew.
	directionalTile direction: directionalTileDirection.

	^ directionalTile initializeInGrid: aGrid at: aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 6/26/2026 10:50'
}
SKDirectionalTile >> direction [

	^ direction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 6/26/2026 10:50'
}
SKDirectionalTile >> direction: aDirection [

	direction := aDirection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 6/26/2026 10:50'
}
SKDirectionalTile >> isDirectionalTile [

	^ true
]

{
	#category : #direction,
	#'squeak_changestamp' : 'LD 6/26/2026 10:50'
}
SKDirectionalTile >> matchesDirection: aDirection [

	^ aDirection = self direction
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 6/26/2026 10:51'
}
SKDirectionalTile >> scaleToFactor [

	super scaleToFactor.
	self image: (self rotateTowards: self direction)
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 6/26/2026 10:51'
}
SKDirectionalTile >> textureFilename [
	
	^ 'directional-tile.png'
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 6/26/2026 10:51'
}
SKDirectionalTile >> zLayer [

	^ 1
]
