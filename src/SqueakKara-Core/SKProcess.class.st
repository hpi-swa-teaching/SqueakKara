Class {
	#name : #SKProcess,
	#superclass : #Object,
	#category : #'SqueakKara-Core'
}

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:55'
}
SKProcess >> isSuspended [

	self subclassResponsibility
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:55'
}
SKProcess >> isTerminated [

	self subclassResponsibility
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:56'
}
SKProcess >> resume [

	self subclassResponsibility
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:56'
}
SKProcess >> suspend [

	self subclassResponsibility
]
