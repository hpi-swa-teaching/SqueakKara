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
		'valueConnectionPoints',
		'isPreview',
		'previewBlock'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'SSP 6/13/2026 13:51'
}
SKBlock >> aboutToBeGrabbedBy: aHand [

	super aboutToBeGrabbedBy: aHand.
	
	self anchorPoint disconnect
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:09'
}
SKBlock >> actionConnectionPoints [

	^ actionConnectionPoints ifNil: [actionConnectionPoints := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:09'
}
SKBlock >> addBlockPart: aBlockPart [

	aBlockPart block: self.
	self blockRows ifEmpty: [self addBlockRow: SKBlockRow new].
	self lastBlockRow addBlockPart: aBlockPart.
	self blockParts add: aBlockPart
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
	#'squeak_changestamp' : 'FR 6/9/2026 19:39'
}
SKBlock >> addBooleanPart [
	
	^ self addInputSlotPart: (SKBooleanSlotPart new)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:09'
}
SKBlock >> addConnectionPoint: aConnectionPoint [

	(aConnectionPoint type = #Action) ifTrue: [
		self actionConnectionPoints add: aConnectionPoint] ifFalse: [
			self valueConnectionPoints add: aConnectionPoint]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 19:39'
}
SKBlock >> addInputSlotPart: anInputSlotPart [

	self addBlockPart: anInputSlotPart.
	self addConnectionPoint: anInputSlotPart connectionPoint.
	^ anInputSlotPart
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 19:39'
}
SKBlock >> addIntegerPart [
	
	^ self addInputSlotPart: (SKTextSlotPart new type: #Integer)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:09'
}
SKBlock >> addLabel: aString [
	
	self addBlockPart: (SKLabelPart new label: aString)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 19:48'
}
SKBlock >> addStringPart [
	
	^ self addInputSlotPart: (SKTextSlotPart new setDefaultUIText: 'Placeholder')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 22:45'
}
SKBlock >> addStringPartWithText: aString [
	
	^ self addInputSlotPart: (SKTextSlotPart new setDefaultUIText: aString)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:09'
}
SKBlock >> anchorPoint [

	^ anchorPoint ifNil: [anchorPoint := SKBlockConnectionPoint new
		uiDelegate: self;
		type: #Anchor]
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
	#'squeak_changestamp' : 'FR 6/9/2026 00:09'
}
SKBlock >> blockParts [

	^ blockParts ifNil: [blockParts := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:09'
}
SKBlock >> blockRows [

	^ blockRows ifNil: [blockRows := OrderedCollection new]
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
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:09'
}
SKBlock >> blockType [

	self subclassResponsibility
]

{
	#category : #colors,
	#'squeak_changestamp' : 'FR 6/9/2026 18:16'
}
SKBlock >> borderColorFromCategory [

	^((Dictionary new at: #default put: self blockDefaultBorderColor;
		at: #movement put: self blockMovementBorderColor;
		at: #sensing put: self blockSensingBorderColor; yourself) at: self category)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:09'
}
SKBlock >> category [

	^ category ifNil: [category := #default]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:09'
}
SKBlock >> category: aCategory [

	category := aCategory.
	
	self color: self colorFromCategory;
		borderColor: self borderColorFromCategory
]

{
	#category : #colors,
	#'squeak_changestamp' : 'FR 6/9/2026 18:16'
}
SKBlock >> colorFromCategory [

	^ (Dictionary new at: #default put: self blockDefaultColor;
		at: #movement put: self blockMovementColor;
		at: #sensing put: self blockSensingColor; yourself) at: self category
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:10'
}
SKBlock >> connectionPointPositionForType: aConnectionPointType [

	self subclassResponsibility
]

{
	#category : #snapping,
	#'squeak_changestamp' : 'FR 6/9/2026 00:10'
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

	^ closestConnectionPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:10'
}
SKBlock >> getCode [

	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/24/2026 11:59'
}
SKBlock >> getPreview [

	^ previewBlock ifNil: [
		previewBlock := self copy
			isPreview: true;
			color: Color gray;
			borderColor: Color gray]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FR 6/9/2026 00:10'
}
SKBlock >> handlesKeyboard: anEvent [

	^ false
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FR 6/9/2026 00:10'
}
SKBlock >> handlesMouseDown: anEvent [

	^ self leftSource
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 00:58'
}
SKBlock >> initialize [
	
	super initialize.
	
	self borderColor: self borderColorFromCategory;
		color: self colorFromCategory;
		borderWidth: SKBlockStyle borderWidth;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		wrapCentering: #center;
    		cellPositioning: #topLeft
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/24/2026 11:54'
}
SKBlock >> isPreview [

	^ isPreview ifNil: [isPreview := false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/24/2026 11:54'
}
SKBlock >> isPreview: aBoolean [

	isPreview := aBoolean
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'FR 6/8/2026 16:54'
}
SKBlock >> justDroppedInto: anObject event: anEvent [

	| snapTarget |

	super justDroppedInto: anObject event: anEvent.
	anObject == World ifTrue: [self delete. ^ self].
	snapTarget := self findClosestSnapTargetIn: anObject.
	snapTarget ifNotNil: [self snapToTarget: snapTarget].
	self updateLayout
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:10'
}
SKBlock >> lastBlockRow [

	^ self blockRows ifEmpty: [nil] ifNotEmpty: [self blockRows last]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:10'
}
SKBlock >> leftSource [

	^ leftSource ifNil: [leftSource := false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:10'
}
SKBlock >> leftSource: aBoolean [

	leftSource := aBoolean.
	aBoolean ifTrue: [self disableTableLayout: true]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/9/2026 00:10'
}
SKBlock >> minHeight [

	^ SKBlockStyle blockPartHeight
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:30'
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
	#'squeak_changestamp' : 'FR 6/9/2026 00:11'
}
SKBlock >> rejectDropMorphEvent: anEvent [

	| h |
	
	h := anEvent hand.
	WorldState addDeferredUIMessage: [h grabMorph: self].
	anEvent wasHandled: true
]

{
	#category : #'submorphs - callbacks',
	#'squeak_changestamp' : 'FR 6/9/2026 00:11'
}
SKBlock >> removedMorph: aMorph [

	super removedMorph: aMorph.

	self updateLayout
]

{
	#category : #snapping,
	#'squeak_changestamp' : 'FR 6/9/2026 18:17'
}
SKBlock >> snapRadius [

	^SKBlockStyle unit * 20.
]

{
	#category : #snapping,
	#'squeak_changestamp' : 'FR 6/9/2026 00:11'
}
SKBlock >> snapToTarget: aConnectionPoint [
	
	aConnectionPoint isConnected ifTrue: [
		(aConnectionPoint uiDelegate resolveConflictingBlockEmbeddingFor: self) ifNil: [^ self]].
	
	self anchorPoint connectTo: aConnectionPoint.
	
	aConnectionPoint uiDelegate embedVisualBlock: self
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'FR 6/9/2026 00:11'
}
SKBlock >> startDrag: anEvent [

	anEvent hand grabMorph: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:11'
}
SKBlock >> tabHeight [

	^ 0
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:32'
}
SKBlock >> updateLayout [

	| width height |
	
	self fullBounds.

	width := (self blockRows collect: #width) max + (self borderWidth * 2).
	height := (self blockRows collect: #height) sum + self tabHeight + (self borderWidth * 2).
	
	self extent: width@height.
	
	self anchorPoint isConnected ifTrue: [
		self anchorPoint connectedPoint uiDelegate 
			layoutChanged;
			changed;
			updateLayout]
]

{
	#category : #snapping,
	#'squeak_changestamp' : 'FR 6/9/2026 00:11'
}
SKBlock >> validSnapConnectionsIn: anObject [

	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:12'
}
SKBlock >> valueConnectionPoints [

	^ valueConnectionPoints ifNil: [valueConnectionPoints := OrderedCollection new]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'FR 6/9/2026 00:12'
}
SKBlock >> wantsKeyboardFocus [

	^ false
]
