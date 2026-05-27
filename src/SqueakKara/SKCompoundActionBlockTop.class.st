Class {
	#name : #SKCompoundActionBlockTop,
	#superclass : #SKActionBlock,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 02:33'
}
SKCompoundActionBlockTop >> drawOn: aCanvas [
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

		(innerBounds left + self tabOffset + self tabWidth+ self leftPadding) @ bottomEdge.
		(innerBounds left + self tabOffset + self tabWidth + self leftPadding - self slantWidth) @ (bottomEdge + self tabHeight).
		(innerBounds left + self tabOffset + self slantWidth + self leftPadding) @ (bottomEdge + self tabHeight).
		(innerBounds left + self tabOffset + self leftPadding) @ bottomEdge.
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
	#'squeak_changestamp' : 'FR 5/27/2026 02:27'
}
SKCompoundActionBlockTop >> leftPadding [
	
	^8
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 02:59'
}
SKCompoundActionBlockTop >> leftSource [
	
	^false.
]
