Class {
	#name : #SKCompoundActionBlockTop,
	#superclass : #SKActionBlock,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/27/2026 10:57'
}
SKCompoundActionBlockTop >> initialize [

	super initialize.
	self removeAllMorphs.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 02:59'
}
SKCompoundActionBlockTop >> leftSource [
	
	^false.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/27/2026 11:06'
}
SKCompoundActionBlockTop >> tabOffsetBottom [

	^ 26.
]
