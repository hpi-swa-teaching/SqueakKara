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
	#'squeak_changestamp' : 'FR 6/9/2026 00:06'
}
SKLabelPart >> initialize [

	super initialize.
	
	self hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		color: Color transparent;
		"borderWidth: 1;
		borderColor: Color green;"
		addMorph: self label
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:06'
}
SKLabelPart >> label [

	^ label ifNil: [label := StringMorph new contents: 'Placeholder']
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:06'
}
SKLabelPart >> label: aString [

	self label contents: aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:06'
}
SKLabelPart >> type [

	^ #Label
]
