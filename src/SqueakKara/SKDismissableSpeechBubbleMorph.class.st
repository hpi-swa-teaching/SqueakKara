"
A SKDismissableSpeechBubbleMorph is a speech bubble which also has a close button that closes the entire morph.

Instance Variables
	closeButton:		<SimpleButtonMorph>

closeButton
	- The close button that closes the speech bubble.

"
Class {
	#name : #SKDismissableSpeechBubbleMorph,
	#superclass : #SpeechBubbleMorph,
	#instVars : [
		'closeButton'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'mr 6/25/2026 21:09'
}

{
	#category : #widgets,
	#'squeak_changestamp' : 'mr 7/4/2026 11:32'
}
SKDismissableSpeechBubbleMorph >> buildCloseButton [
	
	| buttonLabel buttonExtent |
	
	buttonLabel := 'x'.
	buttonExtent := 20 @ 20.
	
	^ SimpleButtonMorph new
		label: buttonLabel;
		target: self;
		actionSelector: #delete;
		extent: buttonExtent;
		color: Color red;
		position: self closeButtonPosition;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 6/25/2026 20:52'
}
SKDismissableSpeechBubbleMorph >> closeButton [

	^ closeButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 6/25/2026 20:50'
}
SKDismissableSpeechBubbleMorph >> closeButton: aSimpleButtonMorph [

	closeButton := aSimpleButtonMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 6/25/2026 20:57'
}
SKDismissableSpeechBubbleMorph >> closeButtonPosition [
	
	^  8 @ 8
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:23'
}
SKDismissableSpeechBubbleMorph >> hasCloseButton [

	^ self closeButton isNil not
]

{
	#category : #refreshing,
	#'squeak_changestamp' : 'mr 6/25/2026 20:25'
}
SKDismissableSpeechBubbleMorph >> refresh [

	super refresh.
	self refreshButton
]

{
	#category : #refreshing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:23'
}
SKDismissableSpeechBubbleMorph >> refreshButton [

	self hasCloseButton ifTrue: [ self closeButton delete ].
	self closeButton: self buildCloseButton.
	self addMorphFront: self closeButton.
	self closeButton position: (self position + self closeButtonPosition)
]
