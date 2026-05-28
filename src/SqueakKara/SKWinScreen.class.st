Class {
	#name : #SKWinScreen,
	#superclass : #SKGridObject,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 5/28/2026 09:46'
}
SKWinScreen >> scaleToFactor [
	
	self scaleToFactorWithSize: self grid pixelPerBlock * self grid gridWidth.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 5/28/2026 09:52'
}
SKWinScreen >> setTexture [

	self setTextureWithScale: (self grid pixelPerBlock * self grid gridWidth)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 5/26/2026 11:40'
}
SKWinScreen >> textureFilename [

	^ 'winscreen.png'
]
