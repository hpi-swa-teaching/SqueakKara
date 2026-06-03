Class {
	#name : #SKBlockPartOld,
	#superclass : #Morph,
	#instVars : [
		'label',
		'type',
		'value',
		'block'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 01:53'
}
SKBlockPartOld >> block [

	^ block.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 01:53'
}
SKBlockPartOld >> block: aBlock [

	block := aBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 01:47'
}
SKBlockPartOld >> connectionPoint [

	^ self leftCenter.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/2/2026 17:55'
}
SKBlockPartOld >> initialize [
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
		value: 30;
		addMorph: self value;
		vResizing: #shrinkWrap;
		cellPositioning: #center.
		
	self adjustLayoutBounds;
		minWidth: self value width + 12;
		hResizing: #spaceFill.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 02:02'
}
SKBlockPartOld >> label [

	^ label ifNil: [label := StringMorph new contents: 'Placeholder'].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 16:50'
}
SKBlockPartOld >> label: aLabel [
	
	self label contents: aLabel.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 16:00'
}
SKBlockPartOld >> type [

	^ type.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 16:00'
}
SKBlockPartOld >> type: aType [

	type := aType.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 10:28'
}
SKBlockPartOld >> value [

	^ value ifNil: [value := SKTextEntry new contents: 10 asString].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 02:20'
}
SKBlockPartOld >> value: aValue [

	(aValue isString or: [aValue isInteger]) ifTrue: [self value contents: aValue asString] ifFalse: [value := aValue].
]
