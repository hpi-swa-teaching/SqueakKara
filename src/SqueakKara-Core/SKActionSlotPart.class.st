Class {
	#name : #SKActionSlotPart,
	#superclass : #SKInputSlotPart,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 20:51'
}
SKActionSlotPart >> connectionPointPositionForType: aConnectionPointType [

	^ self topCenter + self block tabOffsetInner.
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
	#'squeak_changestamp' : 'SLH 6/4/2026 17:12'
}
SKActionSlotPart >> initialize [
	
	super initialize.
	
	self "color: Color blue;"
		color: Color transparent;
		"borderColor: Color red;
		borderWidth: 1;"
		hResizing: #spaceFill;
		vResizing: #shrinkWrap.
		
	self defaultUI: (Morph new
		"color: Color red;
		borderColor: Color orange;"
		color: Color transparent;
		"borderColor: Color black;
		borderWidth: 1;"
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		height: 15).
	
	self addMorphBack: self defaultUI.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 23:37'
}
SKActionSlotPart >> resolveConflictingBlockEmbeddingFor: anActionBlock [
	
	| oldEmbeddedBlock |
	
	self connectionPoint isConnected ifFalse: [^ self].
	
	oldEmbeddedBlock := self connectionPoint connectedPoint uiDelegate.
	oldEmbeddedBlock snapToTarget: anActionBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 19:37'
}
SKActionSlotPart >> type [

	^ #Action.
]
