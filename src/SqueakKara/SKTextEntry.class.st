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
	#'squeak_changestamp' : 'SSP 6/14/2026 16:10'
}
SKTextEntry >> handlesMouseDown: anEvent [

	self isInBlockSource ifTrue: [^ false].
	^ super handlesMouseDown: anEvent
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
	#'squeak_changestamp' : 'SLH 6/16/2026 20:36'
}
SKTextEntry >> keyStroke: anEvent [
	
	| char |

	self isInBlockSource ifTrue: [^ self].

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
