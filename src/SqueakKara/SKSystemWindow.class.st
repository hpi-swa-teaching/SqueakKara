Class {
	#name : #SKSystemWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'resizeListener'
	],
	#category : #SqueakKara
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/27/2026 12:17'
}
SKSystemWindow >> extent: aPoint [

	self resizeListener value.
	super extent: aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/27/2026 11:52'
}
SKSystemWindow >> resizeListener [
	^ resizeListener
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/27/2026 11:52'
}
SKSystemWindow >> resizeListener: aBlock [
	resizeListener := aBlock
]
