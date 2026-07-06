"
A SKActionSlotPart is a Gap for placing SKActionBlocks inside other SKBlocks. e.g. used to build if-statements

Instance Variables

"
Class {
	#name : #SKActionSlotPart,
	#superclass : #SKInputSlotPart,
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:33'
}

{
	#category : #attaching,
	#'squeak_changestamp' : 'SLH 7/4/2026 14:09'
}
SKActionSlotPart >> connectionPointPositionForType: aConnectionPointType [

	^ self boundsInWorld topLeft + ((self block tabOffsetInner + self block slantWidth + (self block tabWidth // 2) - self block borderWidth) @ (self block tabHeight))
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
	#'squeak_changestamp' : 'Lars 7/7/2026 10:11'
}
SKActionSlotPart >> initialize [
	
	super initialize.
	
	self color: Color transparent;
		height: SKStylesheet blockPartHeight
		
]

{
	#category : #attaching,
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
	#'squeak_changestamp' : 'Lars 7/7/2026 10:19'
}
SKActionSlotPart >> updateLayout [

	self connectionPoint isConnected ifTrue: [
		self extent: self connectionPoint connectedPoint uiDelegate stackExtent] ifFalse: [
			self extent: SKStylesheet blockPartHeight * 2 @ SKStylesheet blockPartHeight].

	super updateLayout
]
