"
A SKSystemWindow is a custom implementation of the internal SystemWindow in order to listen for resize Events.

Instance Variables
	resizeListener:		<Block>

resizeListener
	- A Block of code that is being called without any arguments if the SystemWindow is being resized.

"
Class {
	#name : #SKSystemWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'resizeListener'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'LM 4/28/2026 20:16'
}

{
	#category : #geometry,
	#'squeak_changestamp' : 'LM 4/28/2026 20:25'
}
SKSystemWindow >> extent: aPoint [

	super extent: aPoint.
	self resizeListener value
]

{
	#category : #'geometry - layout',
	#'squeak_changestamp' : 'LM 4/27/2026 13:29'
}
SKSystemWindow >> minimumExtent [
	
	^ 400 @ 400
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:13'
}
SKSystemWindow >> resizeListener [

	^ resizeListener
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:13'
}
SKSystemWindow >> resizeListener: aBlock [

	resizeListener := aBlock
]
