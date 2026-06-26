"
A SKDirectionalTile is a tile that can only be entered from defined directions.

Instance Variables
	direction:		<Object>

direction
	- which direction kara is able to enter from

"
Class {
	#name : #SKDirectionalTile,
	#superclass : #SKGridObject,
	#instVars : [
		'direction'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'LD 6/26/2026 11:02'
}

{
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 6/26/2026 10:50'
}
SKDirectionalTile >> direction [

	^ direction
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 6/26/2026 10:50'
}
SKDirectionalTile >> direction: aDirection [

	direction := aDirection
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 6/26/2026 10:50'
}
SKDirectionalTile >> isDirectionalTile [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 6/26/2026 10:50'
}
SKDirectionalTile >> matchesDirection: aDirection [

	^ aDirection = self direction
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 6/26/2026 10:51'
}
SKDirectionalTile >> scaleToFactor [

	super scaleToFactor.
	self image: (self rotateTowards: self direction)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 6/26/2026 10:51'
}
SKDirectionalTile >> textureFilename [
	
	^ 'directional-tile.png'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 6/26/2026 10:51'
}
SKDirectionalTile >> zLayer [

	^ 1
]
