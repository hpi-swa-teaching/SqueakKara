Class {
	#name : #SKBlockFunctionTest,
	#superclass : #TestCase,
	#instVars : [
		'functionStart',
		'blockEditor'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 23:44'
}
SKBlockFunctionTest >> blockEditor [
	^ blockEditor ifNil: [blockEditor := SKBlockEditor new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 23:41'
}
SKBlockFunctionTest >> blockEditor: anObject [
	blockEditor := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 23:44'
}
SKBlockFunctionTest >> functionStart [
	^ functionStart ifNil:[functionStart := (SKFunctionStart new
		isStart: true;
		action: '';
		updateLayout;
		functionName: 'TestFunction';
		functionNameSlot: TextMorph new;
		yourself)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 23:41'
}
SKBlockFunctionTest >> functionStart: anObject [
	functionStart := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'FR 7/4/2026 00:04'
}
SKBlockFunctionTest >> setUp [
	
	| newBlock |
	
	"newBlock := SKMockBlock new.
	newBlock code: [:input | (self blockEditor functionStartWithName: input) getCode]."
	newBlock:= SKBlockSource basicNew functionCall.
	self blockEditor startBlock: newBlock.
	self blockEditor addMorph: newBlock.
	self blockEditor addMorph: self functionStart.
	self functionStart spawn
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'FR 7/3/2026 23:48'
}
SKBlockFunctionTest >> tearDown [
	
	
	self blockEditor startBlock delete.
	self blockEditor delete.
	self functionStart caller: nil.
	self functionStart delete.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'FR 7/4/2026 00:03'
}
SKBlockFunctionTest >> testFunctionCall [

	self functionStart action: 'functionCodeBlock'.
	(self blockEditor startBlock blockParts at: 2) setDefaultUIText: 'TestFunction 1'.
	self assert: (self blockEditor startBlock getCode) equals: 'functionCodeBlock'
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'FR 7/3/2026 23:50'
}
SKBlockFunctionTest >> testFunctionCallAfterRemovingDuplicates [

"	functionStart action: 'functionCodeBlock'.
	self assert: (blockEditor startBlock getCodeWithArgs: (Array with: ('TestFunction 1'))) equals: 'functionCodeBlock'"
	
]
