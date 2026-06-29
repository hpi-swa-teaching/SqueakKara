Class {
	#name : #SKBlockPart,
	#superclass : #Morph,
	#instVars : [
		'block'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:02'
}
SKBlockPart >> block [

	^ block
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:02'
}
SKBlockPart >> block: aBlock [

	block := aBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:02'
}
SKBlockPart >> type [

	self subclassResponsibility
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/29/2026 21:20'
}
SKBlockPart >> updateLayout [

	self block ifNotNil: [self block updateLayout] 
]
