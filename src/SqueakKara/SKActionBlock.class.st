Class {
	#name : #SKActionBlock,
	#superclass : #SKBlock,
	#instVars : [
		'action',
		'isStart',
		'tabOffsetBottom',
		'tabOffsetTop',
		'previousBlock',
		'nextBlock',
		'blockGaps',
		'connectionPointTop',
		'connectionPointBottom'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 14:12'
}
SKActionBlock class >> newWithLabel: aLabel andAction: anAction [

	SKActionBlock basicNew initializeWithLabel: aLabel andAction: anAction.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/11/2026 18:07'
}
SKActionBlock >> action [

	^ action.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 01:54'
}
SKActionBlock >> action: aBlock [

	action := aBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 11:37'
}
SKActionBlock >> addBlockGap [

	| actionSlotPart |
	
	actionSlotPart := SKActionSlotPart new.

	self addBlockRow: (SKBlockRow new isGap: true; yourself).
	self addBlockPart: actionSlotPart.
	self addConnectionPoint: actionSlotPart connectionPoint.
	self addBlockRow: SKBlockRow new.
]

{
	#category : #type,
	#'squeak_changestamp' : 'SLH 5/13/2026 16:03'
}
SKActionBlock >> blockType [

	^ #Action.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 10:35'
}
SKActionBlock >> connectionPointBottom [

	^ connectionPointBottom ifNil: [connectionPointBottom := SKBlockConnectionPoint new 
		block: self;
		type: #Action;
		positionCalculation: [self bottomLeft + ((self tabOffsetOuter + self slantWidth + (self tabWidth / 2)) @ 0)]].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 10:35'
}
SKActionBlock >> connectionPointTop [

	^ connectionPointTop ifNil: [connectionPointTop := SKBlockConnectionPoint new 
		block: self;
		type: #Action;
		positionCalculation: [self topLeft + ((self tabOffsetOuter + self slantWidth + (self tabWidth / 2)) @ (self tabHeight))]].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 00:35'
}
SKActionBlock >> detachFromControllingBlock [

	self previousBlock ifNotNil: [
		Transcript show: 'Detaching ', self, ' from ', self previousBlock, String cr.
		self previousBlock nextBlock: nil.
		self previousBlock: nil].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 17:14'
}
SKActionBlock >> drawOn: aCanvas [
	| bounds pts top bottom left right y |
	
	"innerBounds := self blockRows first bounds expandBy: (self blockRows first layoutInset insetBy: self borderWidth)."
	bounds := self bounds insetBy: (self borderWidth/2).

	top := bounds top.
	bottom := bounds bottom - self tabHeight.
	left := bounds left.
	right := bounds right.

	pts := OrderedCollection new.

	y := top.
	
	self blockRows doWithIndex: [:row :index |
		| leftTop leftBot tabOffsetTop tabOffsetBot yNew |
		
		yNew := y+row height.
		tabOffsetTop := self tabOffsetOuter.
		tabOffsetBot := self tabOffsetOuter.
		leftTop := left+20.
		leftBot := left+20.
		(index = 1) ifTrue: [
			tabOffsetTop := self tabOffsetOuter.
			leftTop := left].
		 (index = self blockRows size) ifTrue: [
			tabOffsetBot := self tabOffsetOuter.
			leftBot := left.
			yNew := bottom].
		
		pts add: leftTop@y.
		
		row isGap ifFalse: [
			self isStart ifFalse: [pts addAll: {
				(leftTop+tabOffsetTop)@y.
				(leftTop+tabOffsetTop+self slantWidth)@(y+self tabHeight).
				(leftTop+tabOffsetTop+self tabWidth - self slantWidth)@(y+self tabHeight).
				(leftTop+tabOffsetTop+self tabWidth)@y.}].
			pts addAll: {
				right@y.
				right@yNew.
				(leftBot+tabOffsetBot+self tabWidth)@yNew.
				(leftBot+tabOffsetBot+self tabWidth-self slantWidth)@(yNew+self tabHeight).
				(leftBot+tabOffsetBot+self slantWidth)@(yNew+self tabHeight).
				(leftBot+tabOffsetBot)@yNew}].
			
		y := yNew].
	
	pts add: left@bottom.

	aCanvas 
		drawPolygon: pts 
		color: self color 
		borderWidth: self borderWidth
		borderColor: self borderColor.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/2/2026 17:48'
}
SKActionBlock >> getCode [

	| args |
	
	args := self blockParts collect: [:each | each value contents asString].
	
	^ self action valueWithArguments: args asArray.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 09:49'
}
SKActionBlock >> initialize [

	super initialize.
	
	self addConnectionPoint: self connectionPointBottom.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/26/2026 21:41'
}
SKActionBlock >> isStart [

	^ isStart ifNil: [isStart := false].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/26/2026 21:40'
}
SKActionBlock >> isStart: aBoolean [

	isStart := aBoolean.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'SLH 6/3/2026 13:23'
}
SKActionBlock >> layoutInset [
	
	^(Rectangle left: 0 right: 0 top: 0 bottom: 8).
]

{
	#category : #layout,
	#'squeak_changestamp' : 'SLH 5/20/2026 00:20'
}
SKActionBlock >> minHeight [

	^ super minHeight + self tabHeight.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 17:20'
}
SKActionBlock >> nextBlock [

	^ connectionPointBottom connectedBlock.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 17:21'
}
SKActionBlock >> nextBlock: aBlock [

	connectionPointBottom connectedBlock: aBlock.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/2/2026 23:52'
}
SKActionBlock >> previousBlock [

	^ previousBlock.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 01:54'
}
SKActionBlock >> previousBlock: aBlock [

	previousBlock := aBlock.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 5/26/2026 17:00'
}
SKActionBlock >> slantWidth [

	^ 8.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 10:46'
}
SKActionBlock >> snapAnchor [

	^ self connectionPointTop.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 17:21'
}
SKActionBlock >> snapToTarget: aConnectionPoint [

	| block |
	
	block := aConnectionPoint block.
	
	self isStart ifTrue: [Transcript show: 'Snapping disabled for start blocks', String cr. ^ self].
	Transcript show: 'Snapping to ', block, ' at ', aConnectionPoint, String cr.
	self align: (self snapAnchor position) with: (aConnectionPoint position).
	
	self previousBlock: block.
	aConnectionPoint connectedBlock: self.
	
	self disableTableLayout: true.
	block vResizing: #rigid; hResizing: #rigid.
	block addMorph: self.
	
	"Recursively tell all parent blocks to recalculate their fullBounds and redraw"
	self withAllOwnersDo: [ :each | 
		(each isKindOf: Morph) ifTrue: [
			each layoutChanged.
			each changed.
		].
	].
]

{
	#category : #layout,
	#'squeak_changestamp' : 'SLH 5/19/2026 23:13'
}
SKActionBlock >> tabHeight [

	^ 8.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'SLH 6/3/2026 12:12'
}
SKActionBlock >> tabOffset [

	^ self tabOffsetOuter.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 12:13'
}
SKActionBlock >> tabOffsetInner [

	^ 26.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 12:11'
}
SKActionBlock >> tabOffsetOuter [

	^ 8.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 5/26/2026 17:00'
}
SKActionBlock >> tabWidth [

	^ 32.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 17:27'
}
SKActionBlock >> validSnapConnectionsIn: anObject [

	| validConnections snapRadius |

	validConnections := OrderedCollection new.
	snapRadius := 20.

	anObject allMorphsDo: [:each |
		((each isKindOf: SKActionBlock) and: [
			((each hasOwner: self) not) and: [
				each ~= self]]) ifTrue: [
					Transcript show: 'connection points for ', each, ': ', (each actionConnectionPoints select: [:connection |
						((connection dist: self snapAnchor) < 20)]), String cr.
					validConnections addAll: (each actionConnectionPoints select: [:connection |
						((connection dist: self snapAnchor) < 20) and: [
							connection connectedBlock isNil]])]].

	Transcript show: 'own connection points: ', (self actionConnectionPoints collect: [:x | x position]), String cr.

	Transcript show: 'valid connections: ', validConnections, String cr.
	^ validConnections
]
