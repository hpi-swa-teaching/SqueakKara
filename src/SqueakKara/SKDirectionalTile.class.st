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
	#'squeak_changestamp' : 'mr 6/12/2026 20:56'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mr 6/16/2026 12:33'
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
	#'squeak_changestamp' : 'mr 6/12/2026 18:54'
}
SKDirectionalTile >> direction [

	^ direction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 6/12/2026 18:54'
}
SKDirectionalTile >> direction: aDirection [

	direction := aDirection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 6/12/2026 19:09'
}
SKDirectionalTile >> isDirectionalTile [

	^ true
]

{
	#category : #direction,
	#'squeak_changestamp' : 'mr 6/12/2026 19:01'
}
SKDirectionalTile >> matchesDirection: aDirection [

	^ aDirection = self direction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 6/12/2026 20:24'
}
SKDirectionalTile >> scaleToFactor [

	super scaleToFactor.
	self image: (self rotateTowards: self direction)
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'mr 6/12/2026 20:46'
}
SKDirectionalTile >> textureFilename [
	
	^ 'directional-tile.png'
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'mr 6/12/2026 19:00'
}
SKDirectionalTile >> zLayer [

	^ 1
]
