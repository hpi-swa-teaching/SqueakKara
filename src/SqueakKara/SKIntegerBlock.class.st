Class {
	#name : #SKIntegerBlock,
	#superclass : #SKValueBlock,
	#category : #'SqueakKara-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'SLH 5/13/2026 12:54'
}
SKIntegerBlock >> initialize [

	super initialize.
	
	self cornerStyle: #rounded.
	self cornerRadius: 20.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/13/2026 18:03'
}
SKIntegerBlock >> type [

	^ #Integer.
]
