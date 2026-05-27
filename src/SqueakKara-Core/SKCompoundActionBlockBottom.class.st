Class {
	#name : #SKCompoundActionBlockBottom,
	#superclass : #SKActionBlock,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 03:02'
}
SKCompoundActionBlockBottom >> drawOn: aCanvas [
	| innerBounds borderWidth topEdge bottomEdge pts |
	
	borderWidth := self borderWidth max: 1. 
	innerBounds := self bounds insetBy: borderWidth.

	topEdge := innerBounds top.
	bottomEdge := innerBounds bottom - self tabHeight.

	pts := {
		innerBounds left @ topEdge.
		(innerBounds left + self tabOffset + self leftPadding) @ topEdge. 
		(innerBounds left + self tabOffset + self slantWidth + self leftPadding) @ (topEdge + self tabHeight).
		(innerBounds left + self tabOffset + self tabWidth + self leftPadding - self slantWidth) @ (topEdge + self tabHeight).
		(innerBounds left + self tabOffset + self tabWidth + self leftPadding) @ topEdge.
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
	#'squeak_changestamp' : 'FR 5/27/2026 03:01'
}
SKCompoundActionBlockBottom >> leftPadding [
	^8
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 03:01'
}
SKCompoundActionBlockBottom >> leftSource [
	^false
]
