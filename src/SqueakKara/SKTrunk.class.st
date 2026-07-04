"
SKTrunk adds the proper texture and a way to identify it as a trunk to the functionality provided by SKGridObject.
"
Class {
	#name : #SKTrunk,
	#superclass : #SKGridObject,
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:56'
}

{
	#category : #appearance,
	#'squeak_changestamp' : 'jawi 5/28/2026 19:06'
}
SKTrunk >> defaultColor [

	^ Color red
]

{
	#category : #type,
	#'squeak_changestamp' : 'jt 6/11/2024 13:01'
}
SKTrunk >> isTrunk [
	
	^ true
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'LM 7/4/2026 11:31'
}
SKTrunk >> position: aPoint [

	| newCoordinates tile |
	newCoordinates := self coordinatesFromPosition: aPoint.
	tile := self gridCoordinator getTileAtCoordinates: newCoordinates.
	
	(tile anySatisfy: [ :each | each isBlocking ]) ifTrue: [ ^ self ].

	super position: aPoint
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'jt 6/11/2024 19:54'
}
SKTrunk >> textureFilename [

	^ 'Trunk.png'
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'mr 6/12/2026 19:00'
}
SKTrunk >> zLayer [

	^ 3
]
