Class {
	#name : #SKBooleanBlock,
	#superclass : #SKValueBlock,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/3/2026 03:10'
}
SKBooleanBlock >> drawOn: aCanvas [

	| b p1 p2 p3 p4 p5 p6 pts |
	
	b := self bounds insetBy: self borderWidth // 2.
	
	p1 := b left @ b center y.
	p2 := (b left + self indent) @ b top.
	p3 := (b right - self indent) @ b top.
	p4 := b right @ b center y.
	p5 := (b right - self indent) @ b bottom.
	p6 := (b left + self indent) @ b bottom.
	pts := { p1. p2. p3. p4. p5. p6 }.
	
	aCanvas drawPolygon: pts
		color: self color
		borderWidth: self borderWidth
		borderColor: self borderColor.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/3/2026 03:10'
}
SKBooleanBlock >> indent [

	^16
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 18:02'
}
SKBooleanBlock >> type [

	^ #Boolean.
]
