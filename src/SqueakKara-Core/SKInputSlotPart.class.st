Class {
	#name : #SKInputSlotPart,
	#superclass : #SKBlockPart,
	#instVars : [
		'defaultUI',
		'attachedBlock'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 04:04'
}
SKInputSlotPart >> acceptValueBlock: aValueBlock [

	self attachedBlock: aValueBlock.
	
	self removeMorph: self defaultUI.
	
	""aValueBlock disableTableLayout: false.""
	self addMorph: aValueBlock.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:22'
}
SKInputSlotPart >> attachedBlock [

	^ attachedBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:22'
}
SKInputSlotPart >> attachedBlock: aValueBlock [

	attachedBlock := aValueBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:37'
}
SKInputSlotPart >> connectionPoint [

	^ self leftCenter.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:22'
}
SKInputSlotPart >> defaultUI [

	^ defaultUI.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:23'
}
SKInputSlotPart >> defaultUI: aMorph [

	defaultUI := aMorph.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:26'
}
SKInputSlotPart >> defaultValue [

	^ SubclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 10:38'
}
SKInputSlotPart >> restoreDefault [

	self attachedBlock: nil.
	self addMorph: self defaultUI.
	"self block updateLayout."
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:26'
}
SKInputSlotPart >> value [

	attachedBlock ifNotNil: [^ attachedBlock value].
	^ self defaultValue.
]
