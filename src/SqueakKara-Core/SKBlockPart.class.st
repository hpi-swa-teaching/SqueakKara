Class {
	#name : #SKBlockPart,
	#superclass : #Morph,
	#instVars : [
		'label',
		'type',
		'value'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 12:39'
}
SKBlockPart >> initialize [
	super initialize.
	
	self borderColor: Color black;
		color: Color white;
		borderWidth: 1;
		cornerStyle: #rounded;
		cornerRadius: 100;
		addMorph: self value;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		layoutInset: 5@0.
	
	self extent: (self value extent+(5@5) max: 20@20).
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
	#'squeak_changestamp' : 'SLH 5/11/2026 20:56'
}
SKBlockPart >> type [

	^ SubclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 20:16'
}
SKBlockPart >> value [

	^ value ifNil: [value := TextMorph new].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 20:20'
}
SKBlockPart >> value: aValue [

	self value contents: (aValue asString).
]
