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
	#'squeak_changestamp' : 'FR 6/9/2026 23:15'
}
SKFunctionStart >> functionName [

	^ functionName ifNil: [functionName := self functionNameSlot contents. ^ functionName]
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
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/10/2026 00:08'
}
SKFunctionStart >> haveSpawned [

	^ haveSpawned ifNil: [haveSpawned := false. ^false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 23:22'
}
SKFunctionStart >> haveSpawned: aBoolean [

	haveSpawned := aBoolean
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
	#'squeak_changestamp' : 'FR 6/10/2026 00:27'
}
SKFunctionStart >> removeCall [

	(self caller functionStarts at: self functionName ifAbsent: [^ self]) value = [self getCode] value ifTrue:[self caller functionStarts removeKey: self functionName]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/10/2026 00:24'
}
SKFunctionStart >> spawn [

	(self caller notNil and:[self caller == self owner]) ifTrue: [^ self].
	self caller: self owner.
	self functionName: (self caller nextAvailableFunctionNameFor: self functionName).
	self functionNameSlot contents: self functionName.
	self updateLayout.
	self haveSpawned: true.
	self caller functionStarts at: (self functionName) asString put: [self getCode]
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'FR 6/10/2026 00:01'
}
SKFunctionStart >> updateName [

	self removeCall.
	self functionName: self functionNameSlot contents asString.
	self caller functionStarts at: self functionName ifAbsent: [self caller functionStarts at: self functionName put: [self getCode]].
	self updateLayout
	
]
