Class {
	#name : #SKLabelPart,
	#superclass : #SKBlockPart,
	#instVars : [
		'label'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'SLH 6/6/2026 02:09'
}
SKLabelPart >> initialize [

	super initialize.
	
	self hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		color: Color transparent;
		"borderWidth: 1;
		borderColor: Color green;"
		addMorph: self label.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 03:01'
}
SKLabelPart >> label [

	^ label ifNil: [label := StringMorph new contents: 'Placeholder'].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 03:01'
}
SKLabelPart >> label: aString [

	self label contents: aString.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 03:07'
}
SKLabelPart >> type [

	^ #Label.
]
