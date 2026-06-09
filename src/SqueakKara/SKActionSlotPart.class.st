Class {
	#name : #SKActionSlotPart,
	#superclass : #SKInputSlotPart,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/9/2026 00:04'
}
SKActionSlotPart >> connectionPointPositionForType: aConnectionPointType [

	^ self topLeft+((self block tabOffsetInner+self block slantWidth+(self block tabWidth//2)-self block borderWidth)@(self block tabHeight))
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:04'
}
SKActionSlotPart >> defaultValue [

	^ nil
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 01:50'
}
SKActionSlotPart >> initialize [
	
	super initialize.
	
	self color: Color transparent;
		height: SKBlockStyle blockPartHeight.
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/9/2026 00:05'
}
SKActionSlotPart >> resolveConflictingBlockEmbeddingFor: anActionBlock [
	
	| oldEmbeddedBlock |
	
	self connectionPoint isConnected ifFalse: [^ self].
	
	oldEmbeddedBlock := self connectionPoint connectedPoint uiDelegate.
	oldEmbeddedBlock snapToTarget: anActionBlock connectionPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:05'
}
SKActionSlotPart >> type [

	^ #Action
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/9/2026 01:05'
}
SKActionSlotPart >> updateLayout [

	self connectionPoint isConnected ifTrue: [
		self extent: self connectionPoint connectedPoint uiDelegate stackExtent] ifFalse: [
			self extent: SKBlockStyle blockPartHeight * 2 @ SKBlockStyle blockPartHeight].

	super updateLayout
]
