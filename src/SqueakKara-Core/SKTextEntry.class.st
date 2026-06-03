Class {
	#name : #SKTextEntry,
	#superclass : #TextMorph,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/26/2026 22:01'
}
SKTextEntry >> acceptOnCR [
	^ true
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/26/2026 22:11'
}
SKTextEntry >> initialize [
	super initialize.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/3/2026 02:21'
}
SKTextEntry >> keyStroke: anEvent [
	anEvent keyCharacter = Character cr ifTrue: [
		anEvent hand releaseKeyboardFocus: self.
		self changed.
		^ self
	].

	super keyStroke: anEvent.
]
