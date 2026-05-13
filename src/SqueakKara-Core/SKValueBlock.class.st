Class {
	#name : #SKValueBlock,
	#superclass : #SKBlock,
	#instVars : [
		'value',
		'type'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 16:03'
}
SKValueBlock >> blockType [

	^ #Value.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 16:02'
}
SKValueBlock >> type [

	^ type.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 16:02'
}
SKValueBlock >> type: aType [

	type := aType.
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
