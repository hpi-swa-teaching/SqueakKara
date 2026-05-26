Class {
	#name : #SKWinScreen,
	#superclass : #SKGridObject,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 5/26/2026 11:54'
}
SKWinScreen >> scaleToFactor [

	| size |
	size := self grid pixelPerBlock * self grid gridWidth.

	self image: (self originalImage scaledToSize: size @ size).
	self extent: size @ size.
	super position: self positionFromCoordinates.
	self changed
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 5/26/2026 11:51'
}
SKWinScreen >> setTexture [

	| aTextureLoader aForm |
	
	aTextureLoader := SKTextureLoader new.
	
	aForm := aTextureLoader
		getTexture: self textureFilename.

	self image: aForm; originalImage: aForm
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 5/26/2026 11:40'
}
SKWinScreen >> textureFilename [

	^ 'winscreen.png'
]
