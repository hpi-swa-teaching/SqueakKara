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
	#'squeak_changestamp' : 'FR 5/26/2026 21:41'
}
SKBlock >> addActionPart: aLabel withDefault: aDefaultValue [

	self addBlockPart: (SKBlockPart new type: #Action; label: aLabel; value: aDefaultValue; yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 01:48'
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
	#category : #colors,
	#'squeak_changestamp' : 'JS 6/9/2026 00:11'
}
SKBlock >> blockDefaultBorderColor [

	^ SKStylesheet colorOrange
]

{
	#category : #colors,
	#'squeak_changestamp' : 'JS 6/9/2026 00:11'
}
SKBlock >> blockDefaultColor [

	^ SKStylesheet colorBeige
]

{
	#category : #colors,
	#'squeak_changestamp' : 'JS 6/9/2026 00:11'
}
SKBlock >> blockMovementBorderColor [

	^ SKStylesheet colorBlue
]

{
	#category : #colors,
	#'squeak_changestamp' : 'JS 6/9/2026 00:12'
}
SKBlock >> blockMovementColor [

	^ SKStylesheet colorLightBlue
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
	#category : #colors,
	#'squeak_changestamp' : 'JS 6/9/2026 00:12'
}
SKBlock >> blockSensingBorderColor [

	^ SKStylesheet colorGreen

]

{
	#category : #colors,
	#'squeak_changestamp' : 'JS 6/9/2026 00:12'
}
SKBlock >> blockSensingColor [

	^ SKStylesheet colorLightGreen
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
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:44'
}
SKBlock >> borderColorFromCategory [

	^((Dictionary new at: #default put: self blockDefaultBorderColor;
		at: #movement put: self blockMovementBorderColor;
		at: #sensing put: self blockSensingBorderColor; yourself) at: self category).
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
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:44'
}
SKBlock >> colorFromCategory [

	^ (Dictionary new at: #default put: self blockDefaultColor;
		at: #movement put: self blockMovementColor;
		at: #sensing put: self blockSensingColor; yourself) at: self category.
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/27/2026 10:50'
}
SKBlock >> initialize [
	
	super initialize.	
	
	self borderColor: self borderColorFromCategory;
		color: self colorFromCategory;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		borderWidth: 2;
		layoutPolicy: TableLayout new;
		listDirection: #rightToLeft;
		wrapCentering: #center;
    		cellPositioning: #center;
		cellInset: 2@0;
		layoutInset: 5@ 0;
		addMorph: (Morph new color: Color transparent; height: 24; width: 0);
		addMorph: self label.
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'FR 5/20/2026 01:43'
}
SKBlock >> justDroppedInto: anObject event: anEvent [
	super justDroppedInto: anObject event: anEvent.
	anObject == World ifTrue:[self delete].

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/27/2026 02:08'
}
SKBlock >> label [

	^ label ifNil: [label := StringMorph new contents: 'Placeholder'].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/27/2026 00:09'
}
SKBlock >> label: aString [
	
	self label contents: aString.
	"self extent: self label extent+(10@10).
	self label center: self center."
	"self label top: self center y."
	
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/20/2026 00:22'
}
SKBlock >> minHeight [

	^ 35
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
	#'squeak_changestamp' : 'FR 5/20/2026 01:33'
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
	#category : #'event handling',
	#'squeak_changestamp' : 'FR 5/5/2026 21:15'
}
SKBlock >> wantsKeyboardFocus [
	^false
]
