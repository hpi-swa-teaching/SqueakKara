Class {
	#name : #SKBooleanBlock,
	#superclass : #SKValueBlock,
	#category : #'SqueakKara-Core'
}

{
	#category : #drawing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKBooleanBlock >> drawOn: aCanvas [
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
