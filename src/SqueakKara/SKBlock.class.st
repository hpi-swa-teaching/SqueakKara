Class {
	#name : #SKBlock,
	#superclass : #Morph,
	#instVars : [
		'leftSource',
		'blockParts',
		'blockRows',
		'category',
		'anchorPoint',
		'actionConnectionPoints',
		'valueConnectionPoints'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'SLH 6/4/2026 23:37'
}
SKBlock >> aboutToBeGrabbedBy: aHand [

	super aboutToBeGrabbedBy: aHand.
	
	self anchorPoint disconnect.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 21:14'
}
SKBlock >> actionConnectionPoints [

	^ actionConnectionPoints ifNil: [actionConnectionPoints := OrderedCollection new].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/5/2026 23:57'
}
SKBlock >> addBlockPart: aBlockPart [

	aBlockPart block: self.
	self blockRows ifEmpty: [self addBlockRow: SKBlockRow new].
	self lastBlockRow addBlockPart: aBlockPart.
	self blockParts add: aBlockPart.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 12:33'
}
SKBlock >> addBlockRow: aBlockRow [

	aBlockRow block: self.
	self blockRows add: aBlockRow.
	self addMorphBack: aBlockRow
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 10:19'
}
SKBlock >> addBooleanPart [
	
	self addInputSlotPart: (SKBooleanSlotPart new).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 21:29'
}
SKBlock >> addConnectionPoint: aConnectionPoint [

	(aConnectionPoint type = #Action) ifTrue: [
		self actionConnectionPoints add: aConnectionPoint] ifFalse: [
			self valueConnectionPoints add: aConnectionPoint].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 10:19'
}
SKBlock >> addInputSlotPart: anInputSlotPart [

	self addBlockPart: anInputSlotPart.
	self addConnectionPoint: anInputSlotPart connectionPoint.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 10:19'
}
SKBlock >> addIntegerPart [
	
	self addInputSlotPart: (SKIntegerSlotPart new).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 03:15'
}
SKBlock >> addLabel: aString [
	
	self addBlockPart: (SKLabelPart new label: aString).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 20:57'
}
SKBlock >> anchorPoint [

	^ anchorPoint ifNil: [anchorPoint := SKBlockConnectionPoint new
		uiDelegate: self;
		type: #Anchor].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:14'
}
SKBlock >> blockParts [

	^ blockParts ifNil: [blockParts := OrderedCollection new].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 12:33'
}
SKBlock >> blockRows [

	^ blockRows ifNil: [blockRows := OrderedCollection new].
]

{
	#category : #accessing,
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
	#'squeak_changestamp' : 'SLH 6/4/2026 20:47'
}
SKBlock >> connectionPointPositionForType: aConnectionPointType [

	^ SubclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 18:55'
}
SKBlock >> findClosestSnapTargetIn: anObject [

	| closestConnectionPoint shortestDistance currentDistance |

	shortestDistance := 20.
	closestConnectionPoint := nil.
	
	(self validSnapConnectionsIn: anObject) do: [:each |
		currentDistance := self anchorPoint dist: each.
		currentDistance < shortestDistance ifTrue: [
			shortestDistance := currentDistance.
			closestConnectionPoint := each]].

	^ closestConnectionPoint.
]

{
	#category : #accessing,
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
	#'squeak_changestamp' : 'SLH 6/6/2026 01:25'
}
SKBlock >> initialize [
	
	super initialize.
	
	self borderColor: self borderColorFromCategory;
		color: self colorFromCategory;
		borderWidth: 2;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		wrapCentering: #center;
    		cellPositioning: #topLeft.
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'SLH 6/6/2026 11:26'
}
SKBlock >> justDroppedInto: anObject event: anEvent [

	| snapTarget |

	super justDroppedInto: anObject event: anEvent.
	
	anObject == World ifTrue: [self delete. ^ self].
	
	snapTarget := self findClosestSnapTargetIn: anObject.
	
	Transcript show: 'action connection points: ', (self actionConnectionPoints collect: [:x | x position]), String cr.
	
	snapTarget ifNotNil: [self snapToTarget: snapTarget].
	
	self updateLayout.
	Transcript show: 'Code:', String cr, '<---------->', String cr, self getCode, String cr, '</---------->', String cr.
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
	#'squeak_changestamp' : 'SLH 6/4/2026 22:05'
}
SKBlock >> leftSource [

	^ leftSource ifNil: [leftSource := false].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/6/2026 01:14'
}
SKBlock >> leftSource: aBoolean [

	leftSource := aBoolean.
	aBoolean ifTrue: [self disableTableLayout: true].
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 18:59'
}
SKBlock >> recalculateParentsRecursively [

self withAllOwnersDo: [ :each | 
	(each isKindOf: Morph) ifTrue: [
		each layoutChanged.
		each changed]].
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/6/2026 00:24'
}
SKBlock >> removedMorph: aMorph [
	super removedMorph: aMorph.

	self updateLayout.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/6/2026 01:12'
}
SKBlock >> snapToTarget: aConnectionPoint [
	
	((self blockType = #Action) and: [self isStart]) ifTrue: [Transcript show: 'Snapping disabled for start blocks', String cr. ^ self].
	
	aConnectionPoint isConnected ifTrue: [
		(aConnectionPoint uiDelegate resolveConflictingBlockEmbeddingFor: self) ifNil: [^ self]].
	
	Transcript show: 'Snapping to ', aConnectionPoint, String cr.
	
	self anchorPoint connectTo: aConnectionPoint.
	
	aConnectionPoint uiDelegate embedVisualBlock: self.
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'SLH 6/4/2026 18:43'
}
SKBlock >> startDrag: anEvent [
	anEvent hand grabMorph: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/6/2026 01:35'
}
SKBlock >> tabHeight [

	^ 0.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/6/2026 09:53'
}
SKBlock >> updateLayout [

	| width height |
	
	self fullBounds.

	Transcript show: 'Update layout for ', self, String cr.
	
	width := (self blockRows collect: #width) max+(self borderWidth*2).
	height := (self blockRows collect: #height) sum+self tabHeight+(self borderWidth*2).
	
	self extent: width@height.
	
	self anchorPoint isConnected ifTrue: [
		self anchorPoint connectedPoint uiDelegate layoutChanged.
		self anchorPoint connectedPoint uiDelegate changed.
		self anchorPoint connectedPoint uiDelegate updateLayout].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 17:24'
}
SKBlock >> validSnapConnectionsIn: anObject [

	^ SubclassResponsibility.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 21:15'
}
SKBlock >> valueConnectionPoints [

	^ valueConnectionPoints ifNil: [valueConnectionPoints := OrderedCollection new].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FR 5/5/2026 21:15'
}
SKBlock >> wantsKeyboardFocus [
	^false
]
