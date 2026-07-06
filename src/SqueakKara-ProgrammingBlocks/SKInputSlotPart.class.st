"
A SKInputSlotPart is a Gap for placing SKBlocks usually used inside other SKBlocks.

Instance Variables
	attachedBlock:		<Object>
	connectionPoint:		<Object>
	defaultUI:		<Object>

attachedBlock
	- the block placed inside this Slot

connectionPoint
	- the connection Point another Block could be placed onto

defaultUI
	- the contents displayed when no Block is attached

"
Class {
	#name : #SKInputSlotPart,
	#superclass : #SKBlockPart,
	#instVars : [
		'defaultUI',
		'connectionPoint'
	],
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:32'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> connectionPoint [

	^ connectionPoint ifNil: [connectionPoint := SKBlockConnectionPoint new 
		uiDelegate: self;
		type: (self type)]
]

{
	#category : #attaching,
	#'squeak_changestamp' : 'SLH 7/4/2026 14:09'
}
SKInputSlotPart >> connectionPointPositionForType: aConnectionPointType [

	^ self boundsInWorld leftCenter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> defaultUI [

	^ defaultUI
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> defaultUI: aMorph [

	defaultUI := aMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> defaultValue [

	self subclassResponsibility
]

{
	#category : #attaching,
	#'squeak_changestamp' : 'SLH 7/4/2026 14:27'
}
SKInputSlotPart >> embedVisualBlock: anSKBlock [
	
	self addMorph: anSKBlock.
	anSKBlock align: (anSKBlock anchorPoint position) with: (self connectionPoint position).
]

{
	#category : #detaching,
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> removedMorph: aMorph [

	super removedMorph: aMorph.

	self updateLayout.
	self block updateLayout
]

{
	#category : #attaching,
	#'squeak_changestamp' : 'FR 7/3/2026 02:48'
}
SKInputSlotPart >> resolveConflictingBlockEmbeddingFor: anSKBlock [
	
	self connectionPoint isConnected ifFalse: [^ self].
	
	^ nil
]

{
	#category : #detaching,
	#'squeak_changestamp' : 'SLH 7/6/2026 09:13'
}
SKInputSlotPart >> restoreDefault [

	self addMorph: self defaultUI
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> value [

	self connectionPoint isConnected ifFalse: [^ self defaultValue].
	^ self connectionPoint connectedPoint uiDelegate getCode
]
