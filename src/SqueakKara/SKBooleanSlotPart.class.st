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
	#'squeak_changestamp' : 'FR 6/23/2026 17:33'
}
SKBooleanSlotPart >> drawOn: aCanvas [
	| innerBounds p1 p2 p3 p4 p5 p6 pts indent borderWidth |
	
	borderWidth := SKBlockStyle borderWidth.
	innerBounds := self bounds insetBy: borderWidth.
	
	indent := self height // 2. 
	
	p1 := innerBounds left @ innerBounds center y.
	p2 := (innerBounds left + indent) @ innerBounds top.
	p3 := (innerBounds right - indent) @ innerBounds top.
	p4 := innerBounds right @ innerBounds center y.
	p5 := (innerBounds right - indent) @ innerBounds bottom.
	p6 := (innerBounds left + indent) @ innerBounds bottom.
	pts := { p1. p2. p3. p4. p5. p6 }.
	
	aCanvas drawPolygon: pts
		color: self block borderColor
		borderWidth: 0
		borderColor: self block borderColor
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 00:24'
}
SKBooleanSlotPart >> initialize [
	super initialize.
	
	self defaultUI: (Morph new color: Color transparent; extent: SKBlockStyle blockPartHeight * 2 @SKBlockStyle blockPartHeight).
	self hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	self addMorphBack: defaultUI
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:06'
}
SKBooleanSlotPart >> type [

	^ #Boolean
]
