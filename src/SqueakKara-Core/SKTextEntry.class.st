Class {
	#name : #SKTextEntry,
	#superclass : #TextMorph,
	#instVars : [
		'numericOnly'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FR 6/9/2026 18:58'
}
SKTextEntry >> keyStroke: anEvent [

	| char | 
	char := anEvent keyCharacter.
	char = Character cr ifTrue: [
		anEvent hand releaseKeyboardFocus: self.
		self changed.
		^ self
	].
	self numericOnly ifFalse: [^ super keyStroke: anEvent].
	((char isDigit) or: [char = Character backspace]) ifTrue: [^ super keyStroke: anEvent]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 18:52'
}
SKTextEntry >> numericOnly [
	^ numericOnly ifNil: [numericOnly := false. ^ false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 18:49'
}
SKTextEntry >> numericOnly: aBoolean [
	numericOnly := aBoolean
]
