Class {
	#name : #SKCompoundActionBlock,
	#superclass : #SKActionBlock,
	#instVars : [
		'children'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 10:04'
}
SKCompoundActionBlock >> children [

	^ children.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 10:05'
}
SKCompoundActionBlock >> children: aBlockCollection [

	children := aBlockCollection.
]
