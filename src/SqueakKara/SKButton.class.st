"
SKButton is the shared superclass by all SKButtons. It ensures texture loading, as well as the basic button functions.

Instance Variables
	executeControls:	<Morph>
	texture:			<>
	scaleFactor:		<>

executeControls
	- 

texture
	- 

scaleFactor
	- 
"
Class {
	#name : #SKButton,
	#superclass : #IconicButton,
	#instVars : [
		'executeControls',
		'texture',
		'scaleFactor'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JanWein 7/5/2026 10:30'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:07'
}
SKButton >> action [

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 22:42'
}
SKButton >> defaultIconicButtonSize [

	^ 34 @ 34
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 22:02'
}
SKButton >> defaultSliderSize [
	
	^ 100 @ 20
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:08'
}
SKButton >> environment [ 

	^ self executeControls environment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:08'
}
SKButton >> executeControls [

	^ executeControls
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:09'
}
SKButton >> executeControls: anExecuteControls [

	executeControls := anExecuteControls
]

{
	#category : #texture,
	#'squeak_changestamp' : 'ND 6/16/2026 21:58'
}
SKButton >> getTexture [

	^ SKTextureLoader new getTexture: self textureFileName
]

{
	#category : #texture,
	#'squeak_changestamp' : 'ND 6/16/2026 23:10'
}
SKButton >> getTexture: aFileName [

	^ SKTextureLoader new getTexture: aFileName
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ND 6/25/2026 21:10'
}
SKButton >> initialize [

	super initialize.
	self loadTexture;
		target: self;
		color: SKStylesheet secondaryColor;
		actionSelector: #action;
		setTexture
]

{
	#category : #texture,
	#'squeak_changestamp' : 'ND 6/16/2026 22:00'
}
SKButton >> loadTexture [
	
	self texture: self getTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:11'
}
SKButton >> resizeByFactor: aNumber [
	
	| buttonSize iconSize |
	
	buttonSize := self defaultIconicButtonSize * aNumber.
	iconSize := (self defaultIconicButtonSize - (10 @ 10)) * aNumber.
	
	self extent: buttonSize.
	self labelGraphic: (self texture scaledToSize: iconSize)
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
	#category : #texture,
	#'squeak_changestamp' : 'ND 6/16/2026 22:25'
}
SKButton >> setTexture [
	
	^ self labelGraphic: self texture
]

{
	#category : #texture,
	#'squeak_changestamp' : 'ND 6/16/2026 22:15'
}
SKButton >> texture [

	^ texture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:12'
}
SKButton >> texture: aTexture [

	texture := aTexture
]

{
	#category : #texture,
	#'squeak_changestamp' : 'ND 6/25/2026 21:07'
}
SKButton >> textureFileName [
	
	^ self subclassResponsibility
]
