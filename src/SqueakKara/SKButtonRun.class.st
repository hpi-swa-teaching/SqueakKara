"
The SKButtonRun activitates the execution of the workspace codes.
"
Class {
	#name : #SKButtonRun,
	#superclass : #SKButton,
	#instVars : [
		'pauseTexture'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'ND 6/18/2026 22:05'
}

{
	#category : #execution,
	#'squeak_changestamp' : 'ND 6/16/2026 21:54'
}
SKButtonRun >> action [
	
	self toggleExecutionState.
	self updateTextures
]

{
	#category : #texture,
	#'squeak_changestamp' : 'ND 6/25/2026 21:13'
}
SKButtonRun >> currentRunButtonTexture [

	| iconSize |
	
	iconSize := (self defaultIconicButtonSize - (10 @ 10)) * self scaleFactor.

	self environment executerState = #running
		ifTrue: [ ^ self pauseTexture scaledToSize: iconSize ].

	^ self texture scaledToSize: iconSize
]

{
	#category : #texture,
	#'squeak_changestamp' : 'ND 6/25/2026 21:13'
}
SKButtonRun >> loadTexture [
	
	self pauseTexture: (self getTexture: self pauseTextureFilename).
	super loadTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 22:59'
}
SKButtonRun >> pauseTexture [
	^ pauseTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:12'
}
SKButtonRun >> pauseTexture: aTexture [

	pauseTexture := aTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:01'
}
SKButtonRun >> pauseTextureFilename [

	^ 'pause.png'
]

{
	#category : #texture,
	#'squeak_changestamp' : 'ND 6/25/2026 21:24'
}
SKButtonRun >> textureFileName [

	^ 'play.png'
]

{
	#category : #execution,
	#'squeak_changestamp' : 'ND 6/16/2026 22:59'
}
SKButtonRun >> toggleExecutionState [

	| state |
	
	state := self environment executerState.

	state = #terminated ifTrue: [ self environment run. ^ self ].
	state = #suspended ifTrue: [ self environment resume. ^ self ].
	state = #running ifTrue: [ self environment pause. ^ self ].
]

{
	#category : #texture,
	#'squeak_changestamp' : 'ND 6/25/2026 21:12'
}
SKButtonRun >> updateTextures [

	| buttonStop |
	
	buttonStop := self executeControls buttonStop.
	self labelGraphic: self currentRunButtonTexture.
	buttonStop setTexture.
	buttonStop resizeByFactor: buttonStop scaleFactor
]
