Class {
	#name : #SKIntegerBlock,
	#superclass : #SKValueBlock,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 12:54'
}
SKIntegerBlock >> initialize [

	super initialize.
	
	self cornerStyle: #rounded.
	self cornerRadius: 20.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 18:03'
}
SKIntegerBlock >> type [

	^ #Integer.
]
