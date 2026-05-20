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
	#'squeak_changestamp' : 'FR 5/20/2026 04:48'
}
SKBlockPart >> initialize [
	super initialize.
	
	self borderColor: Color black;
		color: Color white;
		borderWidth: 1;
		cornerStyle: #rounded;
		cornerRadius: 20;
		addMorph: self value;
		vResizing: #shrinkWrap;
		layoutInset: 5@0;
		extent: (self value extent+(10@5));
		minWidth: self width;
		hResizing: #shrinkWrap.
	self value center: self center;
		minWidth: self width.
	self value: 3.
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
	#'squeak_changestamp' : 'SLH 5/13/2026 16:00'
}
SKBlockPart >> type [

	^ type.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 16:00'
}
SKBlockPart >> type: aType [

	type := aType.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 04:37'
}
SKBlockPart >> value [

	^ value ifNil: [value := SKTextEntry new contents: 10 asString].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 04:27'
}
SKBlockPart >> value: aValue [

	self value contents: (aValue asString).
]
