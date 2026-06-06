Class {
	#name : #SKBooleanSlotPart,
	#superclass : #SKInputSlotPart,
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 03:30'
}
SKBooleanSlotPart >> defaultValue [

	^ false.
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'SLH 6/6/2026 02:13'
}
SKBooleanSlotPart >> drawOn: aCanvas [
	| b p1 p2 p3 p4 p5 p6 pts indent borderWidth |
	
	borderWidth := 2.
	b := self bounds insetBy: borderWidth.
	
	indent := 16. 
	
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
		borderColor: self block borderColor.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'SLH 6/5/2026 21:50'
}
SKBooleanSlotPart >> initialize [
	super initialize.
	
	self defaultUI: (Morph new color: Color transparent; extent: 50@25).
	self hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	self addMorphBack: defaultUI.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 03:49'
}
SKBooleanSlotPart >> type [

	^ #Boolean.
]
