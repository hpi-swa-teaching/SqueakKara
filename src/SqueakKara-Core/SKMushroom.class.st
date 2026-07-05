"
A SKMushroom is a SkGridObject, that is not walkable, but moveable by SKKara when using push 

"
Class {
	#name : #SKMushroom,
	#superclass : #SKGridObject,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 22:52'
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
	#'squeak_changestamp' : 'JS 6/16/2026 16:07'
}
SKMushroom >> textureFilename [

	^ 'Mushrooms.png'
]
