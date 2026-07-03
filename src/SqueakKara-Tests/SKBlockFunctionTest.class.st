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
	#category : #setup,
	#'squeak_changestamp' : 'FR 7/3/2026 15:24'
}
SKBlockFunctionTest >> setUp [
	
	| newBlock |
	
	newBlock := SKMockBlock new.
	newBlock code: [:input | (blockEditor functionStartWithName: input) getCode].
	blockEditor := SKBlockEditor new startBlock: newBlock.
	functionStart := (SKFunctionStart new
		isStart: true;
		action: '';
		updateLayout;
		functionName: 'TestFunction';
		functionNameSlot: TextMorph new;
		yourself).
	blockEditor addMorph: functionStart.
	functionStart spawn.
	
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
