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
	#category : #appearance,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 17:07'
}
SKMushroom >> isWalkable [

	^ false
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 17:02'
}
SKMushroom >> move: aDirection [
	
	(self walkableIn: aDirection) ifFalse: [
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
