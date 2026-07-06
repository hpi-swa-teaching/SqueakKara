"
A SKBooleanBlock is a SKValueBlock representing a Boolean Value. It can be placed in other Blocks expecting a Boolean Value

Instance Variables

"
Class {
	#name : #SKBooleanBlock,
	#superclass : #SKValueBlock,
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:12'
}

{
	#category : #drawing,
	#'squeak_changestamp' : 'SLH 7/6/2026 10:36'
}
SKBooleanBlock >> drawOn: aCanvas [
	| blockBounds points indent borderWidth |
	
	borderWidth := SKBlockStyle borderWidth.
	blockBounds := self bounds insetBy: borderWidth.
	
	indent := self height // 2. 
	
	points := OrderedCollection new.
	points add: blockBounds left @ blockBounds center y.
	points add: (blockBounds left + indent) @ blockBounds top.
	points add: (blockBounds right - indent) @ blockBounds top.
	points add: blockBounds right @ blockBounds center y.
	points add: (blockBounds right - indent) @ blockBounds bottom.
	points add: (blockBounds left + indent) @ blockBounds bottom.
	
	aCanvas drawPolygon: points
		color: self color
		borderWidth: borderWidth
		borderColor: self borderColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKBooleanBlock >> type [

	^ #Boolean
]
