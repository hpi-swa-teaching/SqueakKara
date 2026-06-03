Class {
	#name : #SKLabelPart,
	#superclass : #SKBlockPart,
	#instVars : [
		'label'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:13'
}
SKLabelPart >> initialize [

	super initialize.
	
	self hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		color: Color transparent;
		addMorph: self label.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:01'
}
SKLabelPart >> label [

	^ label ifNil: [label := StringMorph new contents: 'Placeholder'].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:01'
}
SKLabelPart >> label: aString [

	self label contents: aString.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:07'
}
SKLabelPart >> type [

	^ #Label.
]
