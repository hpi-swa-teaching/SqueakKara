"
SKSpeechBubble is a non-editable speech bubble shown above an SKKara. It has its own close button. When multiple bubbles are visible, closing one asks whether all bubbles should be closed.
"
Class {
	#name : #SKSpeechBubble,
	#superclass : #BorderedMorph,
	#instVars : [
		'target',
		'textLabel',
		'closeButton'
	],
	#classVars : [
		'OpenBubbles'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:30'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:30'
}
SKSpeechBubble class >> closeAll [

	OpenBubbles ifNil: [^ self].
	OpenBubbles copy do: [:each | each privateClose]
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:30'
}
SKSpeechBubble class >> openFor: aMorph text: aString [

	| bubble |
	OpenBubbles ifNil: [OpenBubbles := OrderedCollection new].
	bubble := self new buildFor: aMorph text: aString.
	OpenBubbles add: bubble.
	bubble openInWorld.
	^ bubble
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:30'
}
SKSpeechBubble >> buildFor: aMorph text: aString [

	| padding |
	padding := 8.
	target := aMorph.
	self
		color: SKStylesheet colorYellow;
		borderColor: Color gray;
		borderWidth: 2;
		useRoundedCorners.
	textLabel := StringMorph new
		contents: aString;
		font: ((TextStyle named: #BitstreamVeraSans) addNewFontSize: 12);
		yourself.
	closeButton := SimpleButtonMorph new
		label: 'x';
		target: self;
		actionSelector: #requestClose;
		color: SKStylesheet colorRed;
		extent: 18 @ 18;
		yourself.
	self
		addMorph: textLabel;
		addMorph: closeButton.
	self extent: (textLabel width + closeButton width + (padding * 3)) @ (textLabel height + (padding * 2) max: closeButton height + (padding * 2)).
	self positionRelativeToTarget.
	textLabel position: self position + (padding @ padding).
	closeButton position: self position + ((self width - closeButton width - padding) @ padding).
	^ self
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:30'
}
SKSpeechBubble >> positionRelativeToTarget [

	| desiredTop |
	desiredTop := target top - self height - 6.
	self position: (target left - 6) @ desiredTop
]

{
	#category : #actions,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:30'
}
SKSpeechBubble >> privateClose [

	OpenBubbles ifNotNil: [OpenBubbles remove: self ifAbsent: []].
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:30'
}
SKSpeechBubble >> requestClose [

	(OpenBubbles notNil and: [OpenBubbles size > 1]) ifTrue: [
		(self confirm: 'Close all ', OpenBubbles size printString, ' speech bubbles?')
			ifTrue: [^ SKSpeechBubble closeAll]].
	self privateClose
]
