"
SKCloverleaf adds the proper texture and a way to identify it as a cloverleaf to the functionality provided by SKGridObject.
"
Class {
	#name : #SKCloverleaf,
	#superclass : #SKGridObject,
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:55'
}

{
	#category : #type,
	#'squeak_changestamp' : 'jawi 5/28/2026 15:10'
}
SKCloverleaf >> color: aColor [
	
	super color: aColor.
	self scaleToFactor
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'jawi 5/25/2026 17:11'
}
SKCloverleaf >> defaultColor [

	^ (Color r: 0.027 g: 0.478 b: 0.156)
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/29/2026 08:26'
}
SKCloverleaf >> delete [

	super delete.
	self grid decrementLeafCount
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/29/2026 08:26'
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
	#'squeak_changestamp' : 'jawi 5/28/2026 15:41'
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
	#'squeak_changestamp' : 'jawi 5/25/2026 17:11'
}
SKCloverleaf >> scaleToFactor [
	
	super scaleToFactor.
	self updateColor
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/29/2026 08:27'
}
SKCloverleaf >> setColorToKaraColor: aColor [

	self color: aColor.
	self scaleToFactor
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/22/2026 11:56'
}
SKCloverleaf >> textureFilename [

	^ 'Cloverleaf.png'
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LM 6/9/2026 18:55'
}
SKCloverleaf >> zLayer [

	^ 1
]
