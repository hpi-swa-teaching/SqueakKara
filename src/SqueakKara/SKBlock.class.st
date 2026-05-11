Class {
	#name : #SKBlock,
	#superclass : #Morph,
	#instVars : [
		'text',
		'leftSource',
		'blockParts',
		'label'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/11/2026 18:41'
}
SKBlock >> addBlockPart: aBlockPart [

	self blockParts add: aBlockPart.
	
	self addMorph: aBlockPart;
		addMorph: aBlockPart label.
	
	"self addMorph: self label;
		gap: (TextMorph new contents: '3');
		addMorph: self gap;
		addMorph: (StringMorph new contents: ' steps');
		hResizing: #shrinkWrap."
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/11/2026 18:40'
}
SKBlock >> addBlockPart: aBlockPart withId: anId [

	self blockParts add: aBlockPart.
	
	self addMorph: (self blockParts at: anId);
		addMorph: ((self blockParts at: anId) label).
	
	"self addMorph: self label;
		gap: (TextMorph new contents: '3');
		addMorph: self gap;
		addMorph: (StringMorph new contents: ' steps');
		hResizing: #shrinkWrap."
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/11/2026 18:40'
}
SKBlock >> blockParts [

	^ blockParts ifNil: [blockParts := OrderedCollection new].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/11/2026 18:40'
}
SKBlock >> blockParts: anOrderedCollection [

	blockParts := anOrderedCollection.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/11/2026 09:50'
}
SKBlock >> command [

	^ SubclassResponsibility.
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
	#'squeak_changestamp' : 'SLH 5/11/2026 17:27'
}
SKBlock >> initialize [
	super initialize.
	
	self borderColor: Color red;
		color: Color white;
		borderWidth: 2.
	
	self layoutPolicy: TableLayout new;
		addMorph: self label;
		listDirection: #rightToLeft;
		hResizing: #shrinkWrap.
		
	"self blockParts do: [:each |
		self addMorph: each;
			addMorph: (each label)]."
	
	"self addMorph: self label;
		gap: (TextMorph new contents: '3');
		addMorph: self gap;
		addMorph: (StringMorph new contents: ' steps')."

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 16:33'
}
SKBlock >> label [

	^ label ifNil: [label := StringMorph new contents: 'Placeholder'].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 16:32'
}
SKBlock >> label: aLabel [
	
	self label contents: aLabel.
	self extent: self label extent+(10@10).
	self label center: self center.
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
	#'squeak_changestamp' : 'SLH 5/11/2026 09:55'
}
SKBlock >> type [

	^ SubclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 21:15'
}
SKBlock >> wantsKeyboardFocus [
	^false
]
