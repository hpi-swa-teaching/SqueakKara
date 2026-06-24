Class {
	#name : #SKFunctionStart,
	#superclass : #SKActionBlock,
	#instVars : [
		'functionNameSlot',
		'functionName',
		'caller'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/10/2026 00:22'
}
SKFunctionStart >> caller [

	^ caller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/10/2026 00:22'
}
SKFunctionStart >> caller: anObject [

	caller := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'FR 6/10/2026 00:28'
}
SKFunctionStart >> delete [

	self caller ifNotNil: [self removeCall].
	super delete
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/24/2026 03:47'
}
SKFunctionStart >> functionName [

	^ functionName ifNil: [functionName := self functionNameSlot contents asString. ^ functionName]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 19:36'
}
SKFunctionStart >> functionName: aString [

	functionName := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/10/2026 00:07'
}
SKFunctionStart >> functionNameSlot [

	^ functionNameSlot
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/10/2026 00:08'
}
SKFunctionStart >> functionNameSlot: aTextMorph [

	functionNameSlot := aTextMorph
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 23:05'
}
SKFunctionStart >> initialize [

	super initialize.
	self addLabel: 'when I receive'.
	self functionNameSlot: ((self addStringPartWithText: 'Message') defaultUIEntry).
	self functionNameSlot on: #keyStroke send: #updateName to: self.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/10/2026 00:22'
}
SKFunctionStart >> justDroppedInto: anObject event: anEvent [

	super justDroppedInto: anObject event: anEvent.
	anObject class = SKBlockEditor ifTrue:[self spawn]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'FR 6/24/2026 03:48'
}
SKFunctionStart >> removeCall [

	(self caller functionStarts at: self functionName ifAbsent: [^ self])  remove:  self ifAbsent: [^ self]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/24/2026 03:49'
}
SKFunctionStart >> spawn [

	(self caller notNil and:[self caller == self owner]) ifTrue: [^ self].
	self caller: self owner.
	self functionName: (self caller nextAvailableFunctionNameFor: self functionName) asString.
	self functionNameSlot contents: self functionName.
	self updateLayout.
	(self caller functionStarts at: self functionName ifAbsentPut: [Set new]) add: self.
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'FR 6/24/2026 03:43'
}
SKFunctionStart >> updateName [

	self removeCall.
	self functionName: self functionNameSlot contents asString.
	(self caller functionStarts at: self functionName ifAbsentPut: [Set new]) add: self.
	self updateLayout
	
]
