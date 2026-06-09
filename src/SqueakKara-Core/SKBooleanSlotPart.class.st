Class {
	#name : #SKBooleanSlotPart,
	#superclass : #SKInputSlotPart,
	#category : #'SqueakKara-Core'
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
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:38'
}
SKBooleanSlotPart >> drawOn: aCanvas [

	| b p1 p2 p3 p4 p5 p6 pts indent borderWidth |
	
	borderWidth := SKBlockStyle borderWidth.
	b := self bounds insetBy: borderWidth.
	
	indent := self height // 2. 
	
	p1 := b left @ b center y.
	p2 := (b left + indent) @ b top.
	p3 := (b right - indent) @ b top.
	p4 := b right @ b center y.
	p5 := (b right - indent) @ b bottom.
	p6 := (b left + indent) @ b bottom.
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
