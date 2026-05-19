Class {
	#name : #SKBlock,
	#superclass : #Morph,
	#instVars : [
		'text',
		'leftSource',
		'blockParts',
		'label',
		'category'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 20:50'
}
SKBlock >> addBlockPart: aBlockPart [

	self blockParts add: aBlockPart.
	
	self addMorph: aBlockPart;
		addMorph: aBlockPart label.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 15:59'
}
SKBlock >> addBooleanPart: aLabel withDefault: aDefaultValue [

	self addBlockPart: (SKBlockPart new type: #Boolean; label: aLabel; value: aDefaultValue; yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 15:59'
}
SKBlock >> addIntegerPart: aLabel withDefault: aDefaultValue [

	self addBlockPart: (SKBlockPart new type: #Integer; label: aLabel; value: aDefaultValue; yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 16:00'
}
SKBlock >> addStringPart: aLabel withDefault: aDefaultValue [

	self addBlockPart: (SKBlockPart new type: #String; label: aLabel; value: aDefaultValue; yourself)
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 16:02'
}
SKBlock >> blockType [

	^ SubclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 12:46'
}
SKBlock >> borderColorFromCategory [

	^ Color fromString: ((Dictionary new at: #default put: '#df8e1d';
		at: #movement put: '#1e66f5';
		at: #sensing put: '#40a02b'; yourself) at: self category).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/13/2026 12:31'
}
SKBlock >> category [

	^ category ifNil: [category := #default].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/13/2026 12:34'
}
SKBlock >> category: aCategory [

	category := aCategory.
	
	self color: self colorFromCategory;
		borderColor: self borderColorFromCategory.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 12:46'
}
SKBlock >> colorFromCategory [

	^ Color fromString: ((Dictionary new at: #default put: '#e5c890';
		at: #movement put: '#8caaee';
		at: #sensing put: '#a6d189'; yourself) at: self category).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 09:50'
}
SKBlock >> command [

	^ SubclassResponsibility.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FR 5/5/2026 21:15'
}
SKBlock >> handlesKeyboard: anEvent [
	^false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FR 5/5/2026 23:08'
}
SKBlock >> handlesMouseDown: anEvent [
	^self leftSource.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FR 5/5/2026 20:45'
}
SKBlock >> handlesMouseOver: anEvent [
	^true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 12:39'
}
SKBlock >> initialize [
	super initialize.
	
	self borderColor: self borderColorFromCategory;
		cornerStyle: #rounded;
		cornerRadius: 5;
		color: self colorFromCategory;
		borderWidth: 2.
	
	self layoutPolicy: TableLayout new;
		addMorph: self label;
		listDirection: #rightToLeft;
		hResizing: #shrinkWrap;
		cellInset: 5@0;
		layoutInset: 5@0.
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'FR 5/19/2026 14:31'
}
SKBlock >> justDroppedInto: anObject event: anEvent [
	super justDroppedInto: anObject event: anEvent.
	anObject == World ifTrue:[self delete].

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/11/2026 16:33'
}
SKBlock >> label [

	^ label ifNil: [label := StringMorph new contents: 'Placeholder'].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/19/2026 14:43'
}
SKBlock >> label: aString [
	
	self label contents: aString.
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
	#'squeak_changestamp' : 'FR 5/19/2026 13:57'
}
SKBlock >> leftSource: aBoolean [
	leftSource := aBoolean
]

{
	#category : #'event handling',
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
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'FR 5/5/2026 20:49'
}
SKBlock >> rejectDropMorphEvent: anEvent [
| h |
	h := anEvent hand.
	WorldState addDeferredUIMessage: [h grabMorph: self].
	anEvent wasHandled: true.
]

{
	#category : #'dropping/grabbing',
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
	#category : #'event handling',
	#'squeak_changestamp' : 'FR 5/5/2026 21:15'
}
SKBlock >> wantsKeyboardFocus [
	^false
]
