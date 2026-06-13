Class {
	#name : #SKIntegerBlock,
	#superclass : #SKValueBlock,
	#category : #'SqueakKara-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKIntegerBlock >> initialize [

	super initialize.
	
	self cornerStyle: #rounded.
	self cornerRadius: 20
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKIntegerBlock >> type [

	^ #Integer
]
