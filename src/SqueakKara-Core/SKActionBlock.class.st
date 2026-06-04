Class {
	#name : #SKActionBlock,
	#superclass : #SKBlock,
	#instVars : [
		'action',
		'isStart',
		'connectionPoint'
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
	#'squeak_changestamp' : 'SLH 6/4/2026 20:14'
}
SKActionBlock >> addBlockGap [

	self addBlockRow: (SKBlockRow new isGap: true; yourself).
	self addInputSlotPart: SKActionSlotPart new.
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
	#'squeak_changestamp' : 'SLH 6/4/2026 20:59'
}
SKActionBlock >> connectionPoint [

	^ connectionPoint ifNil: [connectionPoint := SKBlockConnectionPoint new 
		uiDelegate: self;
		type: #Action].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 20:44'
}
SKActionBlock >> connectionPointPositionForType: aConnectionPointType [

	(aConnectionPointType = #Action) ifTrue: [
		^ self bottomLeft + ((self tabOffsetOuter + self slantWidth + (self tabWidth / 2)) @ 0)].
	
	^ self topLeft + ((self tabOffsetOuter + self slantWidth + (self tabWidth / 2)) @ (self tabHeight)).
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
	#'squeak_changestamp' : 'SLH 6/4/2026 22:40'
}
SKActionBlock >> embedVisualBlock: anActionBlock [
	
	anActionBlock align: (anActionBlock anchorPoint position) with: (self connectionPoint position).
	self addMorph: anActionBlock.
	self vResizing: #rigid; hResizing: #rigid.
	
	self recalculateParentsRecursively.
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
	#'squeak_changestamp' : 'SLH 6/4/2026 21:59'
}
SKActionBlock >> initialize [

	super initialize.
	
	self addConnectionPoint: self connectionPoint.
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 23:37'
}
SKActionBlock >> resolveConflictingBlockEmbeddingFor: anActionBlock [
	
	| oldEmbeddedBlock |
	
	self connectionPoint isConnected ifFalse: [^ self].
	
	oldEmbeddedBlock := self connectionPoint connectedPoint uiDelegate.
	oldEmbeddedBlock snapToTarget: anActionBlock connectionPoint.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 5/26/2026 17:00'
}
SKActionBlock >> slantWidth [

	^ 8.
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
	#'squeak_changestamp' : 'SLH 6/4/2026 22:01'
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
						((connection dist: self anchorPoint) < 20)]), String cr.
					validConnections addAll: (each actionConnectionPoints select: [:connection |
						((connection dist: self anchorPoint) < 20)])]].

	Transcript show: 'own connection points: ', (self actionConnectionPoints collect: [:x | '',x position,' - ', x type]), String cr.
	Transcript show: 'own anchor point: ', self anchorPoint position, ' - ', self anchorPoint type, String cr.
	Transcript show: 'valid connections: ', validConnections, String cr.
	
	^ validConnections
]
