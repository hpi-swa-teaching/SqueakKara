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
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/22/2026 11:58'
}
SKCloverleaf >> defaultColor [

	^   (Color r: 0.027 g: 0.478 b: 0.156) 
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'ND 5/25/2026 20:54'
}
SKCloverleaf >> delete [
	
	super delete.
	self grid decrementLeafCount
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'ND 5/25/2026 20:49'
}
SKCloverleaf >> initializeInGrid: aGrid at: aPoint [

	super initializeInGrid: aGrid at: aPoint.
	aGrid incrementLeafCount
]

{
	#category : #type,
	#'squeak_changestamp' : 'jt 6/11/2024 13:02'
}
SKCloverleaf >> isCloverleaf [

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
	#category : #type,
	#'squeak_changestamp' : 'LD 5/22/2026 11:50'
}
SKCloverleaf >> scaleToFactor [
	super scaleToFactor.
	self updateColor.
]

{
	#category : #type,
	#'squeak_changestamp' : 'LD 5/22/2026 11:50'
}
SKCloverleaf >> setColorToKaraColor: aColor [
	self color: aColor.
	self scaleToFactor.
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/22/2026 11:56'
}
SKCloverleaf >> textureFilename [

	^ 'Cloverleaf.png'
]
