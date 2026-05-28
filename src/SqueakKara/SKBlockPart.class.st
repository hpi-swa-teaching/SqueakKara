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
	#'squeak_changestamp' : 'FR 5/27/2026 02:07'
}
SKBlockPart >> initialize [
	super initialize.
	
	self borderColor: Color black;
		color: Color white;
		borderWidth: 1;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		wrapCentering: #center;
		layoutInset: 3;
		cornerStyle: #rounded;
		cornerRadius: 12;
		value: 00;
		addMorph: self value;
		vResizing: #shrinkWrap;
		cellPositioning: #center.
		
	self adjustLayoutBounds;
		minWidth: 30;
		hResizing: #spaceFill.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 02:02'
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
	#'squeak_changestamp' : 'SLH 5/28/2026 10:28'
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
