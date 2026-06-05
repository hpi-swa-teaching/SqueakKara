Class {
	#name : #SKActionSlotPart,
	#superclass : #SKInputSlotPart,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/5/2026 22:16'
}
SKActionSlotPart >> connectionPointPositionForType: aConnectionPointType [

	^ self topLeft + ((self block tabOffsetInner + self block slantWidth + (self block tabWidth / 2)-self block borderWidth-2) @ 0).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 19:49'
}
SKActionSlotPart >> defaultValue [

	^ nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/5/2026 22:14'
}
SKActionSlotPart >> initialize [
	
	super initialize.
	
	self color: Color transparent;
		"borderColor: Color red;
		borderWidth: 1;"
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		height: 15.
		
	"self defaultUI: (Morph new
		color: Color transparent;
		borderColor: Color blue;
		borderWidth: 1;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		height: 15).
	
	self addMorphBack: self defaultUI."
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/5/2026 22:17'
}
SKActionSlotPart >> resolveConflictingBlockEmbeddingFor: anActionBlock [
	
	| oldEmbeddedBlock |
	
	self connectionPoint isConnected ifFalse: [^ self].
	
	oldEmbeddedBlock := self connectionPoint connectedPoint uiDelegate.
	oldEmbeddedBlock snapToTarget: anActionBlock connectionPoint.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 19:37'
}
SKActionSlotPart >> type [

	^ #Action.
]
