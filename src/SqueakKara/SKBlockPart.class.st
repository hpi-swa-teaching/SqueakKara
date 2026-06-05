Class {
	#name : #SKBlockPart,
	#superclass : #Morph,
	#instVars : [
		'block'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:09'
}
SKBlockPart >> block [

	^ block.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:09'
}
SKBlockPart >> block: aBlock [

	block := aBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:07'
}
SKBlockPart >> type [

	^ SubclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/5/2026 23:55'
}
SKBlockPart >> updateLayout [

	self block updateLayout.
]
