Class {
	#name : #SKMushroom,
	#superclass : #SKGridObject,
	#category : #'SqueakKara-Core'
}

{
	#category : #type,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/6/2026 20:13'
}
SKMushroom >> isMushroom [

	^ true
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/8/2026 01:33'
}
SKMushroom >> move: aDirection [
	
	[self walkable: aDirection] ifFalse: [
		self say: 'I got pushed into something :('.
		^ self].
	self  moveToCoordinates: self coordinates + aDirection
	
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/7/2026 20:47'
}
SKMushroom >> textureFilename [

	^ 'Cloverleaf.png'
]
