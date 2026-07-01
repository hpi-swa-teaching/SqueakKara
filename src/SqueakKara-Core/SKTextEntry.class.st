"
A SKTextEntry is a TextMorph accepting one line of input with the option to only allow integer inputs.

Instance Variables
	numericOnly:		<Object>

numericOnly
	- boolean wether only numeric characters are allowed as input

"
Class {
	#name : #SKTextEntry,
	#superclass : #TextMorph,
	#instVars : [
		'numericOnly'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'FR 6/30/2026 21:49'
}

{
	#category : #'event handling',
	#'squeak_changestamp' : 'SSP 6/14/2026 16:10'
}
SKTextEntry >> handlesMouseDown: anEvent [

	self isInBlockSource ifTrue: [^ false].
	^ super handlesMouseDown: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FR 6/17/2026 16:08'
}
SKTextEntry >> isControlKey: aCharacter [
	
	aCharacter asInteger
		caseOf: {
			[ 8 "backspace" ] -> [ ^ true ].
			[ 28 "arrow left" ] -> [ ^ true ].
			[ 29 "arrow right"] -> [ ^ true ].
			[ 127 "delete" ] -> [ ^ true ].
			[ 4 "end"] -> [ ^ true ].
			[ 5 "insert"] -> [ ^ true ] }
		otherwise: [ ^ false  ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/16/2026 20:37'
}
SKTextEntry >> isInBlockSource [

	| block |
	
	block := self ownerThatIsA: SKBlock.
	^ block notNil and: [block leftSource not]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'SLH 7/1/2026 10:52'
}
SKTextEntry >> keyStroke: anEvent [
	
	| char |

	self isInBlockSource ifTrue: [^ self].
	char := anEvent keyCharacter.
	(char = Character cr or:[char = Character end] or:[char = Character escape]) ifTrue: [
		anEvent hand releaseKeyboardFocus: self.
		self changed.
		^ self
	].
	(self isControlKey: char) ifTrue: [^ super keyStroke: anEvent].
	char isDigit ifTrue: [^ super keyStroke: anEvent].
	(char = $-) ifTrue: [^ super keyStroke: anEvent]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'SSP 6/14/2026 16:10'
}
SKTextEntry >> mouseDown: anEvent [
	
	self isInBlockSource ifTrue: [
		anEvent hand releaseKeyboardFocus: self.
		^ self].
	^ super mouseDown: anEvent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/16/2026 20:36'
}
SKTextEntry >> numericOnly [

	^ numericOnly ifNil: [numericOnly := false. ^ false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/16/2026 20:36'
}
SKTextEntry >> numericOnly: aBoolean [

	numericOnly := aBoolean
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'SSP 6/14/2026 16:10'
}
SKTextEntry >> wantsKeyboardFocus [
	
	self isInBlockSource ifTrue: [^ false].
	^ super wantsKeyboardFocus
]
