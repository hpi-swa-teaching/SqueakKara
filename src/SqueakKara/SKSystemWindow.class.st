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
		'resizeListener',
		'closeListener'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'LM 4/28/2026 20:16'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/21/2026 17:30'
}
SKSystemWindow >> closeListener [

	^ closeListener
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/21/2026 17:29'
}
SKSystemWindow >> closeListener: aBlock [

	closeListener := aBlock
]

{
	#category : #'submorphs - add/remove',
	#'squeak_changestamp' : 'LM 5/21/2026 17:35'
}
SKSystemWindow >> delete [

	self closeListener value.
	super delete
]

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
	#'squeak_changestamp' : 'LM 7/4/2026 11:13'
}
SKSystemWindow >> minimumExtent [
	
	^ 450 @ 600
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
