Class {
	#name : #SKActionBlock,
	#superclass : #SKBlock,
	#instVars : [
		'action',
		'isStart',
		'tabOffsetBottom',
		'tabOffsetTop',
		'nextBlock',
		'previousBlock',
		'blockGaps'
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 11:27'
}
SKActionBlock >> acceptActionBlock: anActionBlock atConnectionPoint: aConnectionPointName [

	| snapConnectionPoint |
	
	snapConnectionPoint := (self availableSnapConnectionPoints detect: [:assoc | 
		assoc key = aConnectionPointName value]) value.
	
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
	#'squeak_changestamp' : 'SLH 6/3/2026 22:41'
}
SKActionBlock >> addBlockGap [

	| actionSlotPart |
	
	actionSlotPart := SKActionSlotPart new.

	self addBlockRow: (SKBlockRow new gap: true; yourself).
	self addBlockPart: actionSlotPart.
	self addSnapConnectionPoint: actionSlotPart connectionPoint.
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
	#'squeak_changestamp' : 'SLH 6/3/2026 13:21'
}
SKActionBlock >> connectionPointBottom [

	^ self bottomLeft + ((self tabOffsetOuter + self slantWidth + (self tabWidth / 2)) @ 0).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 13:21'
}
SKActionBlock >> connectionPointTop [

	^ self topLeft + ((self tabOffsetOuter + self slantWidth + (self tabWidth / 2)) @ (self tabHeight)).
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
	#'squeak_changestamp' : 'SLH 6/3/2026 13:41'
}
SKActionBlock >> drawOn: aCanvas [
	| innerBounds topEdge bottomEdge pts |
	
	"innerBounds := self blockRows first bounds expandBy: (self blockRows first layoutInset insetBy: self borderWidth)."
	innerBounds := self bounds insetBy: (self borderWidth / 2).

	topEdge := innerBounds top.
	bottomEdge := innerBounds bottom - self tabHeight.

	pts := OrderedCollection new.
	pts add: innerBounds left @ topEdge.
	
	self isStart ifFalse: [pts addAll: {
		(innerBounds left + self tabOffsetOuter) @ topEdge. 
		(innerBounds left + self tabOffsetOuter + self slantWidth) @ (topEdge + self tabHeight).
		(innerBounds left + self tabOffsetOuter + self tabWidth - self slantWidth) @ (topEdge + self tabHeight).
		(innerBounds left + self tabOffsetOuter + self tabWidth) @ topEdge.}].
		
		
	pts add: innerBounds right @ topEdge.
	
	"for each blockrow: ..."
    
	pts addAll: ({
		innerBounds right @ bottomEdge.
		(innerBounds left + self tabOffsetOuter + self tabWidth) @ bottomEdge.
		(innerBounds left + self tabOffsetOuter + self tabWidth - self slantWidth) @ (bottomEdge + self tabHeight).
		(innerBounds left + self tabOffsetOuter + self slantWidth) @ (bottomEdge + self tabHeight).
		(innerBounds left + self tabOffsetOuter) @ bottomEdge.
		innerBounds left @ bottomEdge.
	}).

		
	
	"ifTrue: {
		innerBounds left @ topEdge.
		innerBounds right @ topEdge.
		innerBounds right @ bottomEdge.

		(innerBounds left + self tabOffsetTop + self tabWidth) @ bottomEdge.
		(innerBounds left + self tabOffsetTop + self tabWidth - self slantWidth) @ (bottomEdge + self tabHeight).
		(innerBounds left + self tabOffsetBottom + self slantWidth) @ (bottomEdge + self tabHeight).
		(innerBounds left + self tabOffsetBottom) @ bottomEdge.
		innerBounds left @ bottomEdge.
	}."

	aCanvas 
		drawPolygon: pts 
		color: self color 
		borderWidth: self borderWidth
		borderColor: self borderColor.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 20:08'
}
SKActionBlock >> findClosestSnapTargetIn: anObject [

	| closestBlock closestType shortestDistance currentDistance |

	shortestDistance := 20.
	closestBlock := nil.
	closestType := nil.

	anObject allMorphsDo: [:each |
		((each isKindOf: SKActionBlock) 
			and: [each ~= self 
				and: [(each hasOwner: self) not
					and: [each nextBlock isNil]]]) ifTrue: [
						currentDistance := self connectionPointTop dist: each connectionPointBottom.
						currentDistance < shortestDistance ifTrue: [
							shortestDistance := currentDistance.
							closestBlock := each]]].

	^ closestBlock
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
	#'squeak_changestamp' : 'SLH 6/3/2026 22:43'
}
SKActionBlock >> initialize [

	super initialize.
	
	self addSnapConnectionPoint: self connectionPointBottom.
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
	#'squeak_changestamp' : 'SLH 6/2/2026 23:51'
}
SKActionBlock >> nextBlock [

	^ nextBlock.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 01:54'
}
SKActionBlock >> nextBlock: aBlock [

	nextBlock := aBlock.
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 14:54'
}
SKActionBlock >> snapToTarget: aBlock [

	"| snapBlock snapConnectionPoint |
	
	snapBlock := aSnapTarget key.
	snapConnectionPoint := (snapBlock availableSnapConnectionPoints detect: [:assoc | 
		assoc key = aSnapTarget value]) value.

	self isStart ifTrue: [Transcript show: 'Snapping disabled for start blocks', String cr. ^ self].

	Transcript show: 'Snapping to ', snapBlock, String cr.
	self align: self topConnectionPoint with: snapConnectionPoint.
	
	self previousBlock: snapBlock.
	""snapBlock nextBlock: self.""
	
	self disableTableLayout: true.
	snapBlock vResizing: #rigid; hResizing: #rigid.
	snapBlock addMorph: self."
	
	self isStart ifTrue: [Transcript show: 'Snapping disabled for start blocks', String cr. ^ self].
	Transcript show: 'Snapping to ', aBlock, String cr.
	self align: self connectionPointTop with: aBlock connectionPointBottom.
	
	self previousBlock: aBlock.
	aBlock nextBlock: self.
	
	self disableTableLayout: true.
	aBlock vResizing: #rigid; hResizing: #rigid.
	aBlock addMorph: self.
	
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
	#'squeak_changestamp' : 'SLH 6/3/2026 22:30'
}
SKActionBlock >> validSnapConnectionsIn: anObject [

	| validConnections snapRadius |

	validConnections := Collection new.
	snapRadius := 20.

	"anObject allMorphsDo: [:each |
		(each isKindOf: SKActionBlock) ifTrue: [
			(((self connectionPointTop dist: each connectionPointBottom) < 20) and: [
				each nextBlock isNil not and: [
					each ~= self]]) ifTrue: [
						validConnections add: ].
			] ifFalse: [].
			and: [((self connectionPointTop dist: each connectionPointBottom) < 20)
				and: [each nextBlock isNil not
					and: [(each hasOwner: self) not
						and: [each ~= self]] ifTrue: [
							currentDistance := self connectionPointTop dist: each connectionPointBottom.
							currentDistance < shortestDistance ifTrue: [
								shortestDistance := currentDistance.
								closestBlock := each]]]."

	^ validConnections
]
