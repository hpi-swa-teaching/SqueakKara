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
	#'squeak_changestamp' : 'SLH 6/3/2026 03:09'
}
SKBlockPart >> block [

	^ block.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 03:09'
}
SKBlockPart >> block: aBlock [

	block := aBlock.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/6/2026 14:59'
}
SKBlockPart >> type [

	self subclassResponsibility.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'SLH 6/5/2026 23:55'
}
SKBlockPart >> updateLayout [

	self block updateLayout.
]
