Class {
	#name : #SKBlockPart,
	#superclass : #Morph,
	#instVars : [
		'label',
		'value',
		'returnType'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 17:30'
}
SKBlockPart >> initialize [
	super initialize.
	
	self borderColor: Color blue;
		color: Color white;
		borderWidth: 2;
		addMorph: self value;
		hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	
	self extent: self value extent+(5@5).
	self value center: self center.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 16:50'
}
SKBlockPart >> label [

	^ label ifNil: [label := StringMorph new contents: 'Placeholder'].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 16:50'
}
SKBlockPart >> label: aLabel [
	
	self label contents: aLabel.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 16:53'
}
SKBlockPart >> returnType [

	^ returnType.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 16:53'
}
SKBlockPart >> returnType: aType [

	returnType := aType.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 17:07'
}
SKBlockPart >> value [

	^ value ifNil: [value := TextMorph new].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 17:11'
}
SKBlockPart >> value: aValue [

	self value contents: aValue.
	"self extent: self label extent+(10@10).
	self label center: self center."
]
