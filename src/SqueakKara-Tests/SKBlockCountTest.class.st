Class {
	#name : #SKBlockCountTest,
	#superclass : #TestCase,
	#instVars : [
		'source'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 7/5/2026 22:47'
}
SKBlockCountTest >> source [

	^ source ifNil: [source := SKBlockSource basicNew]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SLH 7/5/2026 22:49'
}
SKBlockCountTest >> testChainedActionBlocksAreCounted [

	| first second |

	first := self source moveBlock.
	second := self source turnLeftBlock.
	first connectionPoint connectTo: second anchorPoint.

	self assert: first blockCount equals: 2
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SLH 7/5/2026 22:48'
}
SKBlockCountTest >> testSingleActionBlockCountsAsOne [

	self assert: self source moveBlock blockCount equals: 1
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SLH 7/5/2026 22:52'
}
SKBlockCountTest >> testValueBlockHasZeroBlockCount [

	self assert: self source plusBlock blockCount equals: 0
]
