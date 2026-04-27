Class {
	#name : #SKSystemWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'resizeListener'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/27/2026 13:27'
}
SKSystemWindow >> extent: aPoint [
	super extent: aPoint.
	self resizeListener value.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/27/2026 13:29'
}
SKSystemWindow >> minimumExtent [
	
	^ 400 @ 400
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
