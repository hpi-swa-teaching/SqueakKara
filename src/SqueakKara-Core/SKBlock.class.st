Class {
	#name : #SKBlock,
	#superclass : #Morph,
	#instVars : [
		'text',
		'leftSource',
		'blockRows',
		'category',
		'snapConnectionPoints'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'SLH 6/3/2026 00:09'
}
SKBlock >> aboutToBeGrabbedBy: aHand [

	super aboutToBeGrabbedBy: aHand.
	
	self detachFromControllingBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 02:56'
}
SKBlock >> addActionPart: aLabel withDefault: aDefaultValue [

	self addBlockPart: (SKBlockPartOld new type: #Action; label: aLabel; value: aDefaultValue; yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 12:46'
}
SKBlock >> addBlockPart: aBlockPart [

	aBlockPart block: self.
	self blockRows ifEmpty: [self addBlockRow: SKBlockRow new].
	self lastBlockRow addBlockPart: aBlockPart.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 12:33'
}
SKBlock >> addBlockRow: aBlockRow [

	aBlockRow block: self.
	self blockRows add: aBlockRow.
	self addMorphBack: aBlockRow
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:31'
}
SKBlock >> addBooleanPart [
	
	self addBlockPart: (SKBooleanSlotPart new).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 04:06'
}
SKBlock >> addIntegerPart [
	
	self addBlockPart: (SKIntegerSlotPart new).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:15'
}
SKBlock >> addLabel: aString [
	
	self addBlockPart: (SKLabelPart new label: aString).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 22:39'
}
SKBlock >> addSnapConnectionPoint: aPoint [

	self snapConnectionPoints add: aPoint.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 12:33'
}
SKBlock >> blockRows [

	^ blockRows ifNil: [blockRows := OrderedCollection new].
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
	#'squeak_changestamp' : 'SLH 6/3/2026 00:09'
}
SKBlock >> detachFromControllingBlock [

	^ SubclassResponsibility.
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'SLH 6/2/2026 23:05'
}
SKBlock >> findClosestSnapTargetIn: anObject [

	^ SubclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/2/2026 17:48'
}
SKBlock >> getCode [

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
	#'squeak_changestamp' : 'SLH 6/3/2026 00:30'
}
SKBlock >> handlesMouseDown: anEvent [
	^ self leftSource.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 20:03'
}
SKBlock >> initialize [
	
	super initialize.	
	
	self borderColor: self borderColorFromCategory;
		color: self colorFromCategory;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		borderWidth: 2;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		wrapCentering: #center;
    		cellPositioning: #topLeft;
		cellInset: 2@0;
		layoutInset: 5@ 0.
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'SLH 6/2/2026 23:26'
}
SKBlock >> justDroppedInto: anObject event: anEvent [

	| snapTarget |

	super justDroppedInto: anObject event: anEvent.
	
	anObject == World ifTrue: [self delete. ^ self].
	
	Transcript show: '',self,' was just dropped into ', anObject, String cr.
	
	snapTarget := self findClosestSnapTargetIn: anObject.
	
	Transcript show: 'Snap target: ', snapTarget, String cr.
	
	snapTarget ifNotNil: [self snapToTarget: snapTarget].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 12:04'
}
SKBlock >> lastBlockRow [

	^ self blockRows ifEmpty: [nil] ifNotEmpty: [self blockRows last].
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
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 22:38'
}
SKBlock >> snapConnectionPoints [

	^ snapConnectionPoints ifNil: [snapConnectionPoints := OrderedCollection new].
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'SLH 6/2/2026 23:17'
}
SKBlock >> snapToTarget: aBlock [

	^ SubclassResponsibility.
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
