Class {
	#name : #SKActionSlotPart,
	#superclass : #SKInputSlotPart,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/6/2026 02:49'
}
SKActionSlotPart >> connectionPointPositionForType: aConnectionPointType [

	^ self topLeft+((self block tabOffsetInner+self block slantWidth+(self block tabWidth/2)-self block borderWidth)@(self block tabHeight)).
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
	#'squeak_changestamp' : 'SLH 6/6/2026 02:02'
}
SKActionSlotPart >> initialize [
	
	super initialize.
	
	self color: Color transparent;
		"borderColor: Color red;
		borderWidth: 1;"
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

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/6/2026 09:54'
}
SKActionSlotPart >> updateLayout [

	self connectionPoint isConnected ifTrue: [
		self extent: self connectionPoint connectedPoint uiDelegate stackExtent] ifFalse: [
			self extent: 30@15].

	super updateLayout.
]
