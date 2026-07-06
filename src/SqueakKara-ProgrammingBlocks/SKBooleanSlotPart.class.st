"
A SKBooleanSlotPart is a Gap for Boolean Value Blocks.

Instance Variables

"
Class {
	#name : #SKBooleanSlotPart,
	#superclass : #SKInputSlotPart,
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:34'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:05'
}
SKBooleanSlotPart >> defaultValue [

	^ false
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'SLH 7/6/2026 10:37'
}
SKBooleanSlotPart >> drawOn: aCanvas [
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
		color: self block borderColor
		borderWidth: 0
		borderColor: self block borderColor
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 7/3/2026 03:05'
}
SKBooleanSlotPart >> initialize [
	super initialize.
	
	self defaultUI: (Morph new color: Color transparent;
						extent: SKBlockStyle blockPartHeight * 2 @SKBlockStyle blockPartHeight).
	self hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	self addMorphBack: self defaultUI
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:06'
}
SKBooleanSlotPart >> type [

	^ #Boolean
]
