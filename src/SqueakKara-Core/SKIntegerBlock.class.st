Class {
	#name : #SKIntegerBlock,
	#superclass : #SKValueBlock,
	#category : #'SqueakKara-Core'
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
