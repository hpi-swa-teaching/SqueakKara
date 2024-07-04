"
SKStylesheet provides access to common stylistic properties, e.g. primary and secondary colors.
"
Class {
	#name : #SKStylesheet,
	#superclass : #Object,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'LK 7/4/2024 19:13'
}

{
	#category : #colors,
	#'squeak_changestamp' : 'LK 7/4/2024 19:11'
}
SKStylesheet class >> primaryColor [

	^ Color lightGreen lighter
]

{
	#category : #colors,
	#'squeak_changestamp' : 'LK 7/4/2024 19:12'
}
SKStylesheet class >> secondaryColor [

	^ Color gray lighter
]
