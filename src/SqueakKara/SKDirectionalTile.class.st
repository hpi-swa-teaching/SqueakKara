Class {
	#name : #SKDirectionalTile,
	#superclass : #SKGridObject,
	#instVars : [
		'direction',
		'isEntrance'
	],
	#category : #SqueakKara
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mr 6/12/2026 20:25'
}
SKDirectionalTile class >> newInGrid: aGrid at: aPoint direction: aDirection isEntrance: aBoolean [

	| directionalTile directionalTileDirection |
	
	directionalTileDirection := aBoolean
		ifTrue: [ SKDirection mirror: aDirection ]
		ifFalse: [ aDirection ].

	directionalTile := SKDirectionalTile basicNew.
	directionalTile
		direction: directionalTileDirection;
		isEntrance: aBoolean.

	^ directionalTile initializeInGrid: aGrid at: aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 6/12/2026 18:54'
}
SKDirectionalTile >> direction [

	^ direction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 6/12/2026 18:54'
}
SKDirectionalTile >> direction: aDirection [

	direction := aDirection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 6/12/2026 19:09'
}
SKDirectionalTile >> isDirectionalTile [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 6/12/2026 18:54'
}
SKDirectionalTile >> isEntrance [

	^ isEntrance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 6/12/2026 18:54'
}
SKDirectionalTile >> isEntrance: aBoolean [

	isEntrance := aBoolean
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mr 6/12/2026 19:01'
}
SKDirectionalTile >> matchesDirection: aDirection [

	^ aDirection = self direction
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mr 6/12/2026 20:24'
}
SKDirectionalTile >> scaleToFactor [

	super scaleToFactor.
	self image: (self rotateTowards: self direction)
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'mr 6/12/2026 20:27'
}
SKDirectionalTile >> textureFilename [
	
	^	self isEntrance 
			ifTrue: [ 'entrance-up.png' ]
			ifFalse: [ 'exit-up.png' ]
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'mr 6/12/2026 19:00'
}
SKDirectionalTile >> zLayer [

	^ 1
]
