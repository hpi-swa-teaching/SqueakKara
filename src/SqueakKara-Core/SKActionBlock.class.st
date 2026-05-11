Class {
	#name : #SKActionBlock,
	#superclass : #SKBlock,
	#instVars : [
		'action'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 14:12'
}
SKActionBlock class >> newWithLabel: aLabel andAction: anAction [

	SKActionBlock basicNew initializeWithLabel: aLabel andAction: anAction.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 18:07'
}
SKActionBlock >> action [

	^ action.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 18:44'
}
SKActionBlock >> action: aBlock [

	^ action := aBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 19:06'
}
SKActionBlock >> command [

	| args |
	
	args := self blockParts collect: [:each | each value contents asString].
	
	^ self action valueWithArguments: args asArray.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 09:55'
}
SKActionBlock >> type [

	^ 'action'.
]
