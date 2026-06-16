Class {
	#name : #SKButtonStop,
	#superclass : #SKButton,
	#category : #SqueakKara
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 23:57'
}
SKButtonStop >> action [

	self environment stop.
	self updateTextures
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 23:19'
}
SKButtonStop >> textureFileName [

	^  'stop.png'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/17/2026 00:12'
}
SKButtonStop >> updateTextures [

	| buttonRun |
	buttonRun := self executeControls buttonRun.
	buttonRun labelGraphic: buttonRun currentRunButtonTexture.
	self setTexture.
	(Delay forMilliseconds: 1) wait.
	self resizeByFactor: self scaleFactor.
]
