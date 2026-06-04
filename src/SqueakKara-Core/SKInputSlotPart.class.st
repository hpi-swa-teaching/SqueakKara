Class {
	#name : #SKInputSlotPart,
	#superclass : #SKBlockPart,
	#instVars : [
		'defaultUI',
		'attachedBlock',
		'connectionPoint'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 19:41'
}
SKInputSlotPart >> acceptBlock: aBlock [

	self attachedBlock: aBlock.
	
	self removeMorph: self defaultUI.
	aBlock disableTableLayout: false.
	
	self addMorph: aBlock.
	
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
	#'squeak_changestamp' : 'SLH 6/4/2026 15:48'
}
SKInputSlotPart >> connectionPoint [

	^ connectionPoint ifNil: [connectionPoint := SKBlockConnectionPoint new 
		block: self block;
		blockPart: self;
		type: (self type);
		positionCalculation: [self leftCenter]].
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
