Class {
	#name : #SKCompoundActionBlockBottom,
	#superclass : #SKActionBlock,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/27/2026 10:57'
}
SKCompoundActionBlockBottom >> initialize [

	super initialize.
	self removeAllMorphs.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 03:01'
}
SKCompoundActionBlockBottom >> leftSource [
	^false
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/27/2026 11:06'
}
SKCompoundActionBlockBottom >> tabOffsetTop [

	^ 26.
]
