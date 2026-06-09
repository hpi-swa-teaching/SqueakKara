Class {
	#name : #SKTextEntry,
	#superclass : #TextMorph,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/9/2026 00:28'
}
SKTextEntry >> keyStroke: anEvent [
	anEvent keyCharacter = Character cr ifTrue: [
		anEvent hand releaseKeyboardFocus: self.
		self changed.
		^ self
	].

	super keyStroke: anEvent
]
