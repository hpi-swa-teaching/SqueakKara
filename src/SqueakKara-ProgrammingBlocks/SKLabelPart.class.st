"
A SKLabelPart is the non-editable text displayed to show e.g. a blocks name.

Instance Variables
	label:		<Object>

label
	- the text shown

"
Class {
	#name : #SKLabelPart,
	#superclass : #SKBlockPart,
	#instVars : [
		'label'
	],
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:37'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'SLH 7/6/2026 09:21'
}
SKLabelPart >> initialize [

	super initialize.
	
	self hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		color: Color transparent;
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
