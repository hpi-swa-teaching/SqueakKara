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
	#'squeak_changestamp' : 'FR 7/3/2026 23:43'
}
SKBlockFunctionTest >> setUp [
	
	| newBlock |
	
	newBlock := SKMockBlock new.
	newBlock code: [:input | (self blockEditor functionStartWithName: input) getCode].
	self blockEditor startBlock: newBlock.
	self blockEditor addMorph: self functionStart.
	self functionStart spawn
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'FR 7/3/2026 15:25'
}
SKBlockFunctionTest >> tearDown [
	
	
	blockEditor startBlock delete.
	blockEditor delete.
	functionStart caller: nil.
	functionStart delete.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'FR 7/3/2026 15:28'
}
SKBlockFunctionTest >> testFunctionCall [

	functionStart action: 'functionCodeBlock'.
	self assert: (blockEditor startBlock getCodeWithArgs: (Array with: ('TestFunction 1'))) equals: 'functionCodeBlock'
	
]
