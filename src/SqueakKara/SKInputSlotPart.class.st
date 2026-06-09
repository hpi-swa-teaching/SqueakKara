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
	#'squeak_changestamp' : 'FR 6/9/2026 00:02'
}
SKInputSlotPart >> acceptBlock: aBlock [

	self attachedBlock: aBlock.
	self removeMorph: self defaultUI.
	self addMorph: aBlock
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> attachedBlock [

	^ attachedBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> attachedBlock: aValueBlock [

	attachedBlock := aValueBlock
]

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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> connectionPointPositionForType: aConnectionPointType [

	^ self leftCenter
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> embedVisualBlock: anSKBlock [
	
	anSKBlock align: (anSKBlock anchorPoint position) with: (self connectionPoint position).
	self addMorph: anSKBlock
]

{
	#category : #'submorphs - callbacks',
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> removedMorph: aMorph [

	super removedMorph: aMorph.

	self updateLayout.
	self block updateLayout
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> resolveConflictingBlockEmbeddingFor: anSKBlock [
	
	"| oldEmbeddedBlock |"
	
	self connectionPoint isConnected ifFalse: [^ self].
	
	^ nil
	
	"oldEmbeddedBlock := self connectionPoint connectedPoint uiDelegate.
	oldEmbeddedBlock detachFromSnapAnchor.
	oldEmbeddedBlock position: oldEmbeddedBlock position+(25@25)."
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/9/2026 00:03'
}
SKInputSlotPart >> restoreDefault [

	self attachedBlock: nil.
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
