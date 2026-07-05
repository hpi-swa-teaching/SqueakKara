Class {
	#name : #SKBlockCodeGenerationTest,
	#superclass : #TestCase,
	#instVars : [
		'source'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #helper,
	#'squeak_changestamp' : 'SLH 7/5/2026 14:38'
}
SKBlockCodeGenerationTest >> setIntegerSlot: anIndex of: aBlock to: aString [

	(aBlock blockParts at: anIndex) setDefaultUIText: aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 7/5/2026 14:36'
}
SKBlockCodeGenerationTest >> source [

	^ source ifNil: [source := SKBlockSource basicNew]
]

{
	#category : #'testing - action blocks',
	#'squeak_changestamp' : 'SLH 7/5/2026 14:42'
}
SKBlockCodeGenerationTest >> testActionBlocksChainWithPeriodAndNewline [

	| first second |

	first := self source moveBlock.
	second := self source turnLeftBlock.
	first connectionPoint connectTo: second anchorPoint.

	self assert: first getCode equals: 'kara move.', String cr, 'kara turn: left'
]

{
	#category : #'testing - slots',
	#'squeak_changestamp' : 'SLH 7/5/2026 14:38'
}
SKBlockCodeGenerationTest >> testIntegerSlotsDefaultToFive [

	self assert: (self source plusBlock blockParts at: 1) value equals: 5
]

{
	#category : #'testing - action blocks',
	#'squeak_changestamp' : 'SLH 7/5/2026 14:42'
}
SKBlockCodeGenerationTest >> testMoveBlockGeneratesKaraMove [

	self assert: self source moveBlock getCode equals: 'kara move'
]

{
	#category : #'testing - variables',
	#'squeak_changestamp' : 'SLH 7/5/2026 15:17'
}
SKBlockCodeGenerationTest >> testMultipleVariableDeclaration [

	| editor |

	editor := SKBlockEditor new.
	editor startBlock:
		(SKActionBlock new addLabel: 'x'; action: ['kara move']; yourself).
	editor variables add: 'variable1'; add: 'variable2'.

	self assert: editor getCode equals: '| variable1 variable2  |', String cr, 'kara move'
]

{
	#category : #'testing - value blocks',
	#'squeak_changestamp' : 'SLH 7/5/2026 14:40'
}
SKBlockCodeGenerationTest >> testNestedValueBlocksNestParentheses [

	| outer inner |

	outer := self source plusBlock.
	inner := self source minusBlock.
	self setIntegerSlot: 1 of: inner to: '8'.
	self setIntegerSlot: 3 of: inner to: '2'.
	self setIntegerSlot: 3 of: outer to: '1'.
	(outer blockParts at: 1) connectionPoint connectTo: inner anchorPoint.

	self assert: outer getCode equals: '((((8) - (2))) + (1))'
]

{
	#category : #'testing - value blocks',
	#'squeak_changestamp' : 'SLH 7/5/2026 14:41'
}
SKBlockCodeGenerationTest >> testPlusBlockUsesCustomSlotValues [

	| block |

	block := self source plusBlock.
	self setIntegerSlot: 1 of: block to: '3'.
	self setIntegerSlot: 3 of: block to: '7'.

	self assert: block getCode equals: '((3) + (7))'
]

{
	#category : #'testing - value blocks',
	#'squeak_changestamp' : 'SLH 7/5/2026 14:41'
}
SKBlockCodeGenerationTest >> testPlusBlockUsesDefaultSlotValues [

	self assert: self source plusBlock getCode equals: '((5) + (5))'
]

{
	#category : #'testing - variables',
	#'squeak_changestamp' : 'SLH 7/5/2026 15:16'
}
SKBlockCodeGenerationTest >> testSingleVariableDeclaration [

	| editor |

	editor := SKBlockEditor new.
	editor startBlock:
		(SKActionBlock new addLabel: 'x'; action: ['kara move']; yourself).
	editor variables add: 'variable1'.

	self assert: editor getCode equals: '| variable1  |', String cr, 'kara move'
]
