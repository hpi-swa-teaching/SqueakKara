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
	#'squeak_changestamp' : 'FR 6/3/2026 02:57'
}
SKBlockPart >> initialize [
	super initialize.
	
	self borderColor: Color black;
		color: Color white;
		borderWidth: SKBlockStyle borderWidth//2;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		wrapCentering: #center;
		cellPositioning: #center;
		layoutInset: SKBlockStyle hInset @ (TextStyle defaultFont height //6);
		cornerStyle: #rounded;
		cornerRadius: SKBlockStyle blockPartHeight // 2;
		value: 30;
		addMorph: self value;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		adjustLayoutBounds;
		minWidth: self width;
		addMorph: (Morph new extent: self value width@0).
		Transcript show: self width.
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
	#'squeak_changestamp' : 'FR 6/3/2026 02:44'
}
SKBlockPart >> value [

	^ value ifNil: [value := SKTextEntry new contents: 10 asString; centered].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 04:27'
}
SKBlockPart >> value: aValue [

	self value contents: (aValue asString).
]
