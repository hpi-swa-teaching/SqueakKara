Class {
	#name : #SKValueBlock,
	#superclass : #SKBlock,
	#instVars : [
		'value'
	],
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
	#'squeak_changestamp' : 'SLH 5/13/2026 12:41'
}
SKValueBlock >> value [

	^ value.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 12:43'
}
SKValueBlock >> value: aString [

	value := aString.
]
