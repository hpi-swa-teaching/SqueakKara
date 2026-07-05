Class {
	#name : #SKMockBlock,
	#superclass : #Morph,
	#instVars : [
		'code',
		'blockCount',
		'blockParts'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 15:01'
}
SKMockBlock >> blockCount [
	^ blockCount
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 15:01'
}
SKMockBlock >> blockCount: anObject [
	blockCount := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 15:03'
}
SKMockBlock >> blockParts [
	^ blockParts ifNil:[blockParts := OrderedCollection new].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 15:02'
}
SKMockBlock >> blockParts: anObject [
	blockParts := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 15:01'
}
SKMockBlock >> code [
	^ code
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 15:01'
}
SKMockBlock >> code: anObject [
	code := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 15:01'
}
SKMockBlock >> getCode [

	^ self code
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 15:25'
}
SKMockBlock >> getCodeWithArgs: anArray [

	^ (self code valueWithArguments: anArray asArray) asString
]
