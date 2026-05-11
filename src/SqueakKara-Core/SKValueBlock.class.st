Class {
	#name : #SKValueBlock,
	#superclass : #SKBlock,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 20:35'
}
SKValueBlock >> type [

	^ #Value.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/6/2026 12:28'
}
SKValueBlock >> value [

	^ SubclassResponsibility.
]
