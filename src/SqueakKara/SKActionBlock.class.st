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
	#'squeak_changestamp' : 'SLH 6/6/2026 02:16'
}
SKActionBlock >> connectionPointPositionForType: aConnectionPointType [

	(aConnectionPointType = #Action) ifTrue: [
		^ self bottomLeft + ((self tabOffsetOuter + self slantWidth + (self tabWidth / 2)) @ 0)].
	
	^ self topLeft + ((self tabOffsetOuter + self slantWidth + (self tabWidth / 2)) @ (self tabHeight + (self borderWidth/2))).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/6/2026 02:53'
}
SKActionBlock >> drawOn: aCanvas [
	| bounds pts top bottom left right y halfBW |
	
	"innerBounds := self blockRows first bounds expandBy: (self blockRows first layoutInset insetBy: self borderWidth)."
	halfBW := self borderWidth/2.
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
		leftTop := left+self tabOffsetInner-self tabOffsetOuter.
		leftBot := left+self tabOffsetInner-self tabOffsetOuter.
		(index = 1) ifTrue: [
			"tabOffsetTop := self tabOffsetOuter."
			leftTop := left].
		 (index = self blockRows size) ifTrue: [
			"tabOffsetBot := self tabOffsetOuter."
			leftBot := left.
			yNew := bottom].
		
		pts add: leftTop@y.
		
		row isGap ifFalse: [
			self isStart ifFalse: [pts addAll: {
				(leftTop+tabOffset-halfBW)@y.
				(leftTop+tabOffset-halfBW+self slantWidth)@(y+self tabHeight).
				(leftTop+tabOffset+halfBW+self tabWidth - self slantWidth)@(y+self tabHeight).
				(leftTop+tabOffset+halfBW+self tabWidth)@y.}].
			pts addAll: {
				right@y.
				right@yNew.
				(leftBot+tabOffset+self tabWidth)@yNew.
				(leftBot+tabOffset+self tabWidth-self slantWidth)@(yNew+self tabHeight).
				(leftBot+tabOffset+self slantWidth)@(yNew+self tabHeight).
				(leftBot+tabOffset)@yNew}].
			
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
	#'squeak_changestamp' : 'SLH 6/6/2026 01:09'
}
SKActionBlock >> embedVisualBlock: anActionBlock [
	
	anActionBlock align: (anActionBlock anchorPoint position) with: (self connectionPoint position).
	self addMorph: anActionBlock.
	self updateLayout.
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/6/2026 02:06'
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
	
	Transcript show: 'Stack extent of ', self, ' is: ', (maxWidth@totalHeight), String cr.

	^ maxWidth @ totalHeight
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
	#'squeak_changestamp' : 'SLH 6/6/2026 01:28'
}
SKActionBlock >> tabOffsetInner [

	^ 24.
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
	#'squeak_changestamp' : 'SLH 6/6/2026 01:23'
}
SKActionBlock >> updateLayout [

	super updateLayout.
	
	self connectionPoint isConnected ifTrue: [
		self connectionPoint connectedPoint uiDelegate
			align: (self connectionPoint connectedPoint uiDelegate anchorPoint position)
			with: (self connectionPoint position)].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/6/2026 02:01'
}
SKActionBlock >> validSnapConnectionsIn: anObject [

	| validConnections snapRadius |

	validConnections := OrderedCollection new.
	snapRadius := 20.

	anObject allMorphsDo: [:each |
		((each isKindOf: SKActionBlock) and: [
			((each hasOwner: self) not) and: [
				each ~= self]]) ifTrue: [
					validConnections addAll: (each actionConnectionPoints select: [:connection |
						((connection dist: self anchorPoint) < 20)])]].
	
	^ validConnections
]
