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
		'windowManager',
		'minimumExtent'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'LM 4/28/2026 20:16'
}

{
	#category : #'open/close',
	#'squeak_changestamp' : 'FR 6/23/2026 17:53'
}
SKSystemWindow >> closeBoxHit [

	self windowManager ifNotNil: [self windowManager buildConfirmationWindow]
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
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/23/2026 17:54'
}
SKSystemWindow >> minimumExtent [

	^ minimumExtent ifNil: [minimumExtent := 450 @ 550. ^ 450 @ 550]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/23/2026 17:53'
}
SKSystemWindow >> minimumExtent: anObject [
	minimumExtent := anObject
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/2/2026 12:51'
}
SKSystemWindow >> windowManager [
	^ windowManager
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/2/2026 12:51'
}
SKSystemWindow >> windowManager: anObject [
	windowManager := anObject
]
