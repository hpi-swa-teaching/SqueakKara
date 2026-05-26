Class {
	#name : #SKActionBlock,
	#superclass : #SKBlock,
	#instVars : [
		'action'
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
	#'squeak_changestamp' : 'SLH 5/11/2026 18:07'
}
SKActionBlock >> action [

	^ action.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 18:44'
}
SKActionBlock >> action: aBlock [

	^ action := aBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 16:03'
}
SKActionBlock >> blockType [

	^ #Action.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 19:06'
}
SKActionBlock >> command [

	| args |
	
	args := self blockParts collect: [:each | each value contents asString].
	
	^ self action valueWithArguments: args asArray.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/26/2026 17:25'
}
SKActionBlock >> drawOn: aCanvas [
	| innerBounds borderWidth topEdge bottomEdge pts |
	
	borderWidth := self borderWidth max: 1. 
	innerBounds := self bounds insetBy: borderWidth.

	topEdge := innerBounds top.
	bottomEdge := innerBounds bottom - self tabHeight.

	pts := {
		innerBounds left @ topEdge.
		(innerBounds left + self tabOffset) @ topEdge. 
		(innerBounds left + self tabOffset + self slantWidth) @ (topEdge + self tabHeight).
		(innerBounds left + self tabOffset + self tabWidth - self slantWidth) @ (topEdge + self tabHeight).
		(innerBounds left + self tabOffset + self tabWidth) @ topEdge.
		innerBounds right @ topEdge.
    
		innerBounds right @ bottomEdge.

		(innerBounds left + self tabOffset + self tabWidth) @ bottomEdge.
		(innerBounds left + self tabOffset + self tabWidth - self slantWidth) @ (bottomEdge + self tabHeight).
		(innerBounds left + self tabOffset + self slantWidth) @ (bottomEdge + self tabHeight).
		(innerBounds left + self tabOffset) @ bottomEdge.
		innerBounds left @ bottomEdge.
	}.

	aCanvas 
		drawPolygon: pts 
		color: self color 
		borderWidth: borderWidth 
		borderColor: self borderColor.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/20/2026 00:20'
}
SKActionBlock >> minHeight [

	^ super minHeight + self tabHeight.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/26/2026 17:00'
}
SKActionBlock >> slantWidth [

	^ 8.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/19/2026 23:13'
}
SKActionBlock >> tabHeight [

	^ 8.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/26/2026 17:00'
}
SKActionBlock >> tabOffset [

	^ 8.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/26/2026 17:00'
}
SKActionBlock >> tabWidth [

	^ 32.
]
