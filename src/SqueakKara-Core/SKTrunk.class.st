"
SKTrunk adds the proper texture and a way to identify it as a trunk to the functionality provided by SKGridObject.
"
Class {
	#name : #SKTrunk,
	#superclass : #SKGridObject,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:56'
}

{
	#category : #type,
	#'squeak_changestamp' : 'jt 6/11/2024 13:01'
}
SKTrunk >> isTrunk [
	
	^ true
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 17:07'
}
SKTrunk >> isWalkable [

	^ false
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'LM 4/29/2026 13:13'
}
SKTrunk >> position: aPoint [

	| coordinates tile |
	coordinates := self coordinatesFromPosition: aPoint.
	tile := self gridCoordinator getTileAtCoordinates: coordinates.
	
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
