Class {
	#name : #SKBlock,
	#superclass : #Morph,
	#instVars : [
		'text',
		'leftSource'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/6/2026 12:15'
}
SKBlock >> action [

	^ SubclassResponsibility.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/6/2026 00:54'
}
SKBlock >> command [
	^'kara ', text contents
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 23:04'
}
SKBlock >> contents: aString [
	self text contents: aString.
	self extent: self text extent+(10@10)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 21:15'
}
SKBlock >> handlesKeyboard: anEvent [
	^false
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 23:08'
}
SKBlock >> handlesMouseDown: anEvent [
	^self leftSource.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 20:45'
}
SKBlock >> handlesMouseOver: anEvent [
	^true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 23:03'
}
SKBlock >> initialize [
	super initialize.
	self text: (StringMorph new contents:'Placeholder').
	self extent: text extent+(10@10).
	self text center: self center.
	self addMorph: self text;
		borderColor: Color red;
		color: Color white;
		borderWidth: 2.
		

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 23:07'
}
SKBlock >> leftSource [
	^ leftSource ifNil: [^false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 23:07'
}
SKBlock >> leftSource: anObject [
	leftSource := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 23:09'
}
SKBlock >> mouseDown: anEvent [
	anEvent hand
				waitForClicksOrDrag: self
				event: anEvent
				selectors: {nil. nil. nil. #startDrag:}
				threshold: HandMorph dragThreshold
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 20:49'
}
SKBlock >> rejectDropMorphEvent: anEvent [
| h |
	h := anEvent hand.
	WorldState addDeferredUIMessage: [h grabMorph: self].
	anEvent wasHandled: true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 23:10'
}
SKBlock >> startDrag: anEvent [
	anEvent hand grabMorph: self
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/6/2026 12:27'
}
SKBlock >> subBlocks [

	^ nil.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 23:00'
}
SKBlock >> text [
	^ text
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 23:00'
}
SKBlock >> text: anObject [
	text := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 21:15'
}
SKBlock >> wantsKeyboardFocus [
	^false
]
