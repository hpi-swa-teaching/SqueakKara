Class {
	#name : #SKActionBlock,
	#superclass : #SKBlock,
	#instVars : [
		'action',
		'isStart',
		'tabOffsetBottom',
		'tabOffsetTop'
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
	#'squeak_changestamp' : 'SLH 5/11/2026 18:44'
}
SKActionBlock >> action: aBlock [

	^ action := aBlock.
]

{
	#category : #type,
	#'squeak_changestamp' : 'SLH 5/13/2026 16:03'
}
SKActionBlock >> blockType [

	^ #Action.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/27/2026 10:58'
}
SKActionBlock >> drawOn: aCanvas [
	| innerBounds topEdge bottomEdge pts |
	
	innerBounds := self bounds insetBy: self borderWidth / 2.

	topEdge := innerBounds top.
	bottomEdge := innerBounds bottom - self tabHeight.

	pts := self isStart ifFalse:{
		innerBounds left @ topEdge.
		(innerBounds left + self tabOffsetTop) @ topEdge. 
		(innerBounds left + self tabOffsetTop + self slantWidth) @ (topEdge + self tabHeight).
		(innerBounds left + self tabOffsetTop + self tabWidth - self slantWidth) @ (topEdge + self tabHeight).
		(innerBounds left + self tabOffsetTop + self tabWidth) @ topEdge.
		innerBounds right @ topEdge.
    
		innerBounds right @ bottomEdge.

		(innerBounds left + self tabOffsetBottom + self tabWidth) @ bottomEdge.
		(innerBounds left + self tabOffsetBottom + self tabWidth - self slantWidth) @ (bottomEdge + self tabHeight).
		(innerBounds left + self tabOffsetBottom + self slantWidth) @ (bottomEdge + self tabHeight).
		(innerBounds left + self tabOffsetBottom) @ bottomEdge.
		innerBounds left @ bottomEdge.
	} ifTrue: {
		innerBounds left @ topEdge.
		innerBounds right @ topEdge.
		innerBounds right @ bottomEdge.

		(innerBounds left + self tabOffsetTop + self tabWidth) @ bottomEdge.
		(innerBounds left + self tabOffsetTop + self tabWidth - self slantWidth) @ (bottomEdge + self tabHeight).
		(innerBounds left + self tabOffsetBottom + self slantWidth) @ (bottomEdge + self tabHeight).
		(innerBounds left + self tabOffsetBottom) @ bottomEdge.
		innerBounds left @ bottomEdge.
	}.

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
	#'squeak_changestamp' : 'FR 5/27/2026 02:36'
}
SKActionBlock >> layoutInset [
	
	self isStart ifTrue:[^(Rectangle left: 10 right: 10 top: 5 bottom:  self tabHeight + 5)].
	^(Rectangle left: 8 right: 8 top: self tabHeight bottom:  self tabHeight* 2).
]

{
	#category : #layout,
	#'squeak_changestamp' : 'SLH 5/20/2026 00:20'
}
SKActionBlock >> minHeight [

	^ super minHeight + self tabHeight.
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
	#'squeak_changestamp' : 'FR 5/26/2026 17:00'
}
SKActionBlock >> tabOffset [

	^ 8.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 09:38'
}
SKActionBlock >> tabOffsetBottom [

	^ tabOffsetBottom ifNil: [tabOffsetBottom := 8].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 09:36'
}
SKActionBlock >> tabOffsetBottom: anInteger [

	tabOffsetBottom := anInteger.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 09:38'
}
SKActionBlock >> tabOffsetTop [

	^ tabOffsetTop ifNil: [tabOffsetTop := 8].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 09:36'
}
SKActionBlock >> tabOffsetTop: anInteger [

	tabOffsetTop := anInteger.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 5/26/2026 17:00'
}
SKActionBlock >> tabWidth [

	^ 32.
]
