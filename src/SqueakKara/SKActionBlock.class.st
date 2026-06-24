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
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:42'
}
SKActionBlock class >> newWithLabel: aLabel andAction: anAction [

	SKActionBlock basicNew initializeWithLabel: aLabel andAction: anAction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:12'
}
SKActionBlock >> action [

	^ action
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:12'
}
SKActionBlock >> action: aBlockClosure [

	action := aBlockClosure
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:12'
}
SKActionBlock >> addBlockGap [

	self addBlockRow: (SKBlockRow new isGap: true; yourself).
	self addInputSlotPart: SKActionSlotPart new.
	self addBlockRow: SKBlockRow new
]

{
	#category : #type,
	#'squeak_changestamp' : 'FR 6/9/2026 00:12'
}
SKActionBlock >> blockType [

	^ #Action
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:12'
}
SKActionBlock >> connectionPoint [

	^ connectionPoint ifNil: [connectionPoint := SKBlockConnectionPoint new 
		uiDelegate: self;
		type: #Action]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:33'
}
SKActionBlock >> connectionPointPositionForType: aConnectionPointType [

	(aConnectionPointType = #Action) ifTrue: [
		^ self bottomLeft + ((self tabOffsetOuter + self slantWidth + (self tabWidth // 2)) @ 0)].
	
	^ self topLeft + ((self tabOffsetOuter + self slantWidth + (self tabWidth // 2)) @ (self tabHeight))
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'FR 6/23/2026 17:33'
}
SKActionBlock >> drawOn: aCanvas [

	| bounds pts top bottom left right y halfBW |
	
	halfBW := self borderWidth // 2.
	bounds := self bounds insetBy: halfBW.
	top := bounds top.
	bottom := bounds bottom - self tabHeight.
	left := bounds left.
	right := bounds right.
	pts := OrderedCollection new.
	y := top.
	
	self blockRows doWithIndex: [:row :index |
		| leftTop leftBot tabOffset yNew |
		
		yNew := y+row height.
		tabOffset := self tabOffsetOuter.
		leftTop := left + self tabOffsetInner - self tabOffsetOuter.
		leftBot := left + self tabOffsetInner - self tabOffsetOuter.
		(index = 1) ifTrue: [
			leftTop := left].
		 (index = self blockRows size) ifTrue: [
			leftBot := left.
			yNew := bottom].
		pts add: leftTop@y.
		row isGap ifFalse: [
			self isStart ifFalse: [pts addAll: (self getTopTabPointsFromLeft: leftTop atY: y).].
			pts add: right @ y.
			pts addAll: (self getBottomTabPointsFromLeft: leftBot toRight: right atY: yNew).].
		y := yNew].
	pts add: left@bottom.

	aCanvas 
		drawPolygon: pts 
		color: self color 
		borderWidth: self borderWidth
		borderColor: self borderColor
]

{
	#category : #snapping,
	#'squeak_changestamp' : 'FR 6/9/2026 00:13'
}
SKActionBlock >> embedVisualBlock: anActionBlock [
	
	anActionBlock align: (anActionBlock anchorPoint position) with: (self connectionPoint position).
	self addMorph: anActionBlock.
	self updateLayout
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'FR 6/23/2026 17:33'
}
SKActionBlock >> getBottomTabPointsFromLeft: left toRight: right atY: y [

	| halfBW leftBot |
	
	halfBW := SKBlockStyle borderWidth // 2.
	leftBot := left.
	
	^ {	right @ y.
		(left + self tabOffset + self tabWidth) @ y.
		(left + self tabOffset + self tabWidth - self slantWidth) @ (y + self tabHeight).
		(left + self tabOffset + self slantWidth) @ (y + self tabHeight).
		(left + self tabOffset) @ y}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:13'
}
SKActionBlock >> getCode [

	| nextBlockCode args code |
	
	nextBlockCode := self connectionPoint isConnected ifTrue: [
		self connectionPoint connectedPoint uiDelegate getCode] ifFalse: [nil].
	
	args := (self blockParts select: [:each | each type ~~ #Label]) collect: [:each | each value asString].
	
	code := (self action valueWithArguments: args asArray) asString.
	nextBlockCode isNil not ifTrue: [code := code, '.', String cr, nextBlockCode].
	
	^ code
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'FR 6/23/2026 17:33'
}
SKActionBlock >> getTopTabPointsFromLeft: left atY: y [

	| halfBW |
	
	halfBW := SKBlockStyle borderWidth // 2.
	
	^ {(left + self tabOffset - halfBW) @ y.
		(left + self tabOffset - halfBW + self slantWidth) @ (y + self tabHeight).
		(left + self tabOffset + halfBW + self tabWidth - self slantWidth) @ (y + self tabHeight).
		(left + self tabOffset + halfBW + self tabWidth) @ y}
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 00:13'
}
SKActionBlock >> initialize [

	super initialize.
	
	self addConnectionPoint: self connectionPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:13'
}
SKActionBlock >> isStart [

	^ isStart ifNil: [isStart := false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:13'
}
SKActionBlock >> isStart: aBoolean [

	isStart := aBoolean
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/9/2026 00:13'
}
SKActionBlock >> minHeight [

	^ super minHeight + self tabHeight
]

{
	#category : #snapping,
	#'squeak_changestamp' : 'FR 6/9/2026 00:13'
}
SKActionBlock >> resolveConflictingBlockEmbeddingFor: anActionBlock [
	
	| oldEmbeddedBlock |
	
	self connectionPoint isConnected ifFalse: [^ self].
	
	oldEmbeddedBlock := self connectionPoint connectedPoint uiDelegate.
	oldEmbeddedBlock snapToTarget: anActionBlock connectionPoint
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:34'
}
SKActionBlock >> slantWidth [

	^ self tabWidth // 4
]

{
	#category : #snapping,
	#'squeak_changestamp' : 'FR 6/9/2026 00:13'
}
SKActionBlock >> snapToTarget: aConnectionPoint [
	
	self isStart ifTrue: [^ self].
	
	super snapToTarget: aConnectionPoint
]

{
	#category : #layout,
	#'squeak_changestamp' : 'SLH 6/6/2026 15:31'
}
SKActionBlock >> stackExtent [

	| currentBlock maxWidth totalHeight notchOverlap |
	
	currentBlock := self.
	maxWidth := 0.
	totalHeight := 0.
	notchOverlap := self tabHeight.
	
	[currentBlock notNil] whileTrue: [
		maxWidth := maxWidth max: currentBlock width.
		totalHeight := totalHeight + currentBlock height - notchOverlap.
		
		currentBlock connectionPoint isConnected ifTrue: [
			currentBlock := currentBlock connectionPoint connectedPoint uiDelegate.
			(currentBlock class inheritsFrom: SKBlock) ifFalse: [currentBlock := nil]] ifFalse: [
			currentBlock := nil]].

	^ maxWidth @ totalHeight
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/9/2026 00:13'
}
SKActionBlock >> tabHeight [

	^ SKBlockStyle tabHeight
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/9/2026 00:13'
}
SKActionBlock >> tabOffset [

	^ self tabOffsetOuter
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/9/2026 00:13'
}
SKActionBlock >> tabOffsetInner [

	^ 4 * self tabOffsetOuter
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/9/2026 00:13'
}
SKActionBlock >> tabOffsetOuter [

	^ SKBlockStyle tabOffset
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/9/2026 00:14'
}
SKActionBlock >> tabWidth [

	^ self tabHeight * 4
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/9/2026 00:14'
}
SKActionBlock >> updateLayout [

	super updateLayout.
	
	self connectionPoint isConnected ifTrue: [
		self connectionPoint connectedPoint uiDelegate
			align: (self connectionPoint connectedPoint uiDelegate anchorPoint position)
			with: (self connectionPoint position)]
]

{
	#category : #snapping,
	#'squeak_changestamp' : 'FR 6/9/2026 00:15'
}
SKActionBlock >> validSnapConnectionsIn: anObject [

	| validConnections |

	validConnections := OrderedCollection new.

	anObject allMorphsDo: [:each |
		((each isKindOf: SKActionBlock) and: [
			((each hasOwner: self) not) and: [
				each ~= self]]) ifTrue: [
					validConnections addAll: (each actionConnectionPoints select: [:connection |
						((connection dist: self anchorPoint) < self snapRadius)])]].
	
	^ validConnections
]
