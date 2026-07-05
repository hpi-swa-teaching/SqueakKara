"
A SKBlock is the (visual) representation of a segment of code used to program the behaviour of a SqueakKara Kara object. It mainly handles the connection-process to other SKBlocks.

Instance Variables
	actionConnectionPoints:		<Object>
	anchorPoint:		<Object>
	blockParts:		<Object>
	blockRows:		<Object>
	category:		<Object>
	leftSource:		<Object>
	valueConnectionPoints:		<Object>

actionConnectionPoints
	- Points where ActionBlocks (see SKActionBlock) can be connected to this block

anchorPoint
	- Point where this instance wants to be connected to another SKBlock

blockParts
	- Parts making up rows of this block (e.g. see SKBlockPart)

blockRows
	- Rows making up this block (see SKBlockRow)

category
	- used for consistent coloring + possibility for meta-programming

leftSource
	- boolean wether this Block is still in the BlockSource -> affects wether the block is draggable and editable

valueConnectionPoints
	- Points where ValueBlocks (see SKValueBlock) can be connected to this block

"
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
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:02'
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
	#'squeak_changestamp' : 'FR 6/30/2026 20:39'
}
SKBlock >> addEmptyIntegerPart [
	
	| textSlotPart |
	
	textSlotPart := SKTextSlotPart new type: #Integer.
	textSlotPart defaultUI: (textSlotPart defaultUI addMorphBack: (Morph new color: Color transparent; extent: textSlotPart defaultUIEntry extent); removeMorph: textSlotPart defaultUIEntry).
	textSlotPart restoreDefault.
	
	^ self addInputSlotPart: (textSlotPart)
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
	#'squeak_changestamp' : 'SLH 7/5/2026 18:50'
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
	#category : #'submorphs - callbacks',
	#'squeak_changestamp' : 'FR 6/24/2026 20:18'
}
SKBlock >> blockCount [
	
	| result |
	
	result := 1.
	self actionConnectionPoints ifEmpty: [^0] ifNotEmpty: [self actionConnectionPoints do:[:each | each connectedPoint ifNotNil: [result := result + each connectedPoint uiDelegate blockCount]]].
	^ result
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
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:09'
}
SKBlock >> blockType [

	self subclassResponsibility
]

{
	#category : #colors,
	#'squeak_changestamp' : 'FR 6/23/2026 19:19'
}
SKBlock >> borderColorFromCategory [

	^ SKBlockStyle borderColorByCategory at: self category
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
	#'squeak_changestamp' : 'FR 6/23/2026 19:18'
}
SKBlock >> colorFromCategory [

	^ SKBlockStyle colorByCategory at: self category
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
	#'squeak_changestamp' : 'FR 6/24/2026 17:16'
}
SKBlock >> findClosestSnapTargetIn: anObject [

	| closestConnectionPoint shortestDistance currentDistance |

	shortestDistance := self snapRadius.
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
	#'squeak_changestamp' : 'FR 6/23/2026 18:57'
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
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'FR 6/24/2026 01:12'
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
	#'squeak_changestamp' : 'FR 6/24/2026 17:18'
}
SKBlock >> snapRadius [

	^ SKBlockStyle blockPartHeight
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
	#'squeak_changestamp' : 'FR 6/24/2026 20:08'
}
SKBlock >> updateLayout [

	| width height |
	
	self fullBounds.

	width := (self blockRows collect: #width) max + (self borderWidth * 2).
	height := (self blockRows collect: #height) sum + self tabHeight + (self borderWidth * 2).
	
	self extent: width@height.
	self changed.
	
	self anchorPoint isConnected ifTrue: [
		self anchorPoint connectedPoint uiDelegate 
			layoutChanged;
			changed;
			updateLayout]
	ifFalse: [(self ownerThatIsA: SKBlockEditor) ifNotNil: [(self ownerThatIsA: SKBlockEditor) expandIfNeededToInclude: self fullBounds]]
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
