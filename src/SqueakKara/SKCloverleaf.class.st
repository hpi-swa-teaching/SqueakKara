"
SKCloverleaf adds the proper texture and a way to identify it as a cloverleaf to the functionality provided by SKGridObject.
"
Class {
	#name : #SKCloverleaf,
	#superclass : #SKGridObject,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:55'
}

{
	#category : #type,
	#'squeak_changestamp' : 'jt 6/11/2024 13:02'
}
SKCloverleaf >> isCloverleaf [

	^ true
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 17:06'
}
SKCloverleaf >> isWalkable [

	^ true
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'LM 4/29/2026 12:59'
}
SKCloverleaf >> position: aPoint [

	| coordinates tile |
	coordinates := self coordinatesFromPosition: aPoint.
	tile := self gridCoordinator getTileAtCoordinates: coordinates.
	
	(tile anySatisfy: [ :each | each isTrunk ]) ifTrue: [^ self ].

	super position: aPoint
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'jt 6/11/2024 19:55'
}
SKCloverleaf >> textureFilename [

	^ 'Cloverleaf.png'
]
