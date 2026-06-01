"
A SKWinScreen is an image that is used for indicating if the user has completed the level.

Instance Variables

"
Class {
	#name : #SKWinScreen,
	#superclass : #SKGridObject,
	#category : #SqueakKara,
	#'squeak_changestamp' : 'LM 5/29/2026 12:51'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 5/29/2026 08:31'
}
SKWinScreen >> scaleToFactor [

	self scaleToFactorWithSize: self grid pixelPerBlock * self grid gridWidth.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 5/29/2026 08:32'
}
SKWinScreen >> setTexture [

	self setTextureWithScale: (self grid pixelPerBlock * self grid gridWidth)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 5/29/2026 08:40'
}
SKWinScreen >> textureFilename [

	^ 'WIN-Screen.png'
]
