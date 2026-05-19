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
	#'squeak_changestamp' : 'SLH 5/19/2026 23:24'
}
SKActionBlock >> drawOn: aCanvas [
	| b bw topEdge bottomEdge tabOffset tabWidth slantWidth pts |

	bw := self borderWidth max: 1. 
	b := self bounds insetBy: bw.

	tabOffset := 8.
	tabWidth := 32.
	slantWidth := 8.

	topEdge := b top.
	bottomEdge := b bottom - self tabHeight.

	pts := {
		b left @ topEdge.
		(b left + tabOffset) @ topEdge. 
		(b left + tabOffset + slantWidth) @ (topEdge + self tabHeight).
		(b left + tabOffset + tabWidth - slantWidth) @ (topEdge + self tabHeight).
		(b left + tabOffset + tabWidth) @ topEdge.
		b right @ topEdge.
    
		b right @ bottomEdge.

		(b left + tabOffset + tabWidth) @ bottomEdge.
		(b left + tabOffset + tabWidth - slantWidth) @ (bottomEdge + self tabHeight).
		(b left + tabOffset + slantWidth) @ (bottomEdge + self tabHeight).
		(b left + tabOffset) @ bottomEdge.
		b left @ bottomEdge.
	}.

	aCanvas 
		drawPolygon: pts 
		color: self color 
		borderWidth: bw 
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
	#'squeak_changestamp' : 'SLH 5/19/2026 23:13'
}
SKActionBlock >> tabHeight [

	^ 8.
]
