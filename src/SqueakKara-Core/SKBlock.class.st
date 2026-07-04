Class {
	#name : #SKBlock,
	#superclass : #Morph,
	#instVars : [
		'leftSource',
		'blockParts',
		'blockRows',
		'category',
		'anchorPoint',
		'actionConnectionPoints',
		'valueConnectionPoints',
		'isPreview',
		'previewBlock'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/24/2026 14:45'
}
SKBlock >> getPreview [

	^ previewBlock ifNil: [
		previewBlock := self copy
			isPreview: true;
			color: Color gray;
			borderColor: Color gray;
			removeAllMorphs]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/24/2026 11:54'
}
SKBlock >> isPreview [

	^ isPreview ifNil: [isPreview := false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/24/2026 11:54'
}
SKBlock >> isPreview: aBoolean [

	isPreview := aBoolean
]
