Class {
	#name : #SKButton,
	#superclass : #IconicButton,
	#instVars : [
		'executeControls',
		'texture',
		'scaleFactor'
	],
	#category : #SqueakKara
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 21:49'
}
SKButton >> action [

	^ SubclassResponsibility
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 22:42'
}
SKButton >> defaultIconicButtonSize [

	^ 34 @ 34
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 22:02'
}
SKButton >> defaultSliderSize [
	
	^ 100 @ 20
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 22:21'
}
SKButton >> environment [

	^ self executeControls environment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 21:49'
}
SKButton >> executeControls [
	^ executeControls
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 21:49'
}
SKButton >> executeControls: anObject [
	executeControls := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 21:58'
}
SKButton >> getTexture [

	^ SKTextureLoader new getTexture: self textureFileName
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 23:10'
}
SKButton >> getTexture: aFileName [

	^ SKTextureLoader new getTexture: aFileName
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 22:41'
}
SKButton >> initialize [
	super initialize.
	self loadTexture.
	self target: self.
	self color: SKStylesheet secondaryColor.
	self actionSelector: #action.
	self setTexture
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 22:00'
}
SKButton >> loadTexture [
	
	self texture: self getTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:50'
}
SKButton >> resizeByFactor: aNumber [
	
	| buttonSize iconSize |
	
	buttonSize := self defaultIconicButtonSize * aNumber.
	iconSize := (self defaultIconicButtonSize - (10@10)) * aNumber.
	
	self extent: buttonSize.
	self labelGraphic: (self texture scaledToSize: iconSize).
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:50'
}
SKButton >> scaleFactor [

	^ scaleFactor ifNil: [ 1 ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:50'
}
SKButton >> scaleFactor: aNumber [

	self resizeByFactor: aNumber.
	
	scaleFactor := aNumber
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 22:25'
}
SKButton >> setTexture [
	
	^ self labelGraphic: self texture
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 22:15'
}
SKButton >> texture [

	^ texture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 22:14'
}
SKButton >> texture: anObject [
	texture := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 23:04'
}
SKButton >> textureFileName [
	
	^ self SubclassResponsibility
]
