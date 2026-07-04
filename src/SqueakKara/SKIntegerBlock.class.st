"
A SKIntegerBlock is a SKValueBlock representing a Integer Value. It can be placed in other Blocks expecting a Integer Value

Instance Variables

"
Class {
	#name : #SKIntegerBlock,
	#superclass : #SKValueBlock,
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:13'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/29/2026 21:02'
}
SKIntegerBlock >> initialize [

	super initialize.
	
	self cornerStyle: #rounded.
	self cornerRadius: self height // 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKIntegerBlock >> type [

	^ #Integer
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/29/2026 21:03'
}
SKIntegerBlock >> updateLayout [

	super updateLayout.
	self cornerRadius: self height // 2.
	self redraw
]
