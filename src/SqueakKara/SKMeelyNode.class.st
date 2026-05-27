Class {
	#name : #SKMeelyNode,
	#superclass : #CircleMorph,
	#instVars : [
		'controller',
		'isInDrag'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:13'
}
SKMeelyNode >> controller [

	^ controller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:14'
}
SKMeelyNode >> controller: aController [

	controller := aController
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:17'
}
SKMeelyNode >> defaultSize [

	^ 75 @ 75
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:55'
}
SKMeelyNode >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:17'
}
SKMeelyNode >> initialize [

	super initialize.
	
	self extent: self defaultSize;
		color: self normalColor;
		borderWidth: 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:41'
}
SKMeelyNode >> isInDrag [

	^ isInDrag ifNil: [isInDrag := false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:33'
}
SKMeelyNode >> isInDrag: aBoolean [

	isInDrag := aBoolean
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:34'
}
SKMeelyNode >> justDroppedInto: newOwner event: anEvent [

	(newOwner isKindOf: SKPlayGround) ifFalse: [
		Transcript show: 'delete'; cr.].

	newOwner addMorphFront: self.
	self isInDrag: false

]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:58'
}
SKMeelyNode >> mouseDown: anEvent [

	self controller mode = #drag ifTrue: [
		anEvent hand
		waitForClicksOrDrag: self
		event: anEvent
		selectors: {nil. nil. nil. #startDrag:}
		threshold: HandMorph dragThreshold].
	self controller nodeClicked: self

]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:14'
}
SKMeelyNode >> normalColor [

	^ Color fromString: '#df8e1d'
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:14'
}
SKMeelyNode >> selectNode [

	self color: self selectedColor
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:14'
}
SKMeelyNode >> selectedColor [

	^ Color fromString: '#8caaee'
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:33'
}
SKMeelyNode >> startDrag: anEvent [

	self controller mode = #drag ifFalse: [^ nil].
	self isInDrag: true.
	anEvent hand grabMorph: self
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:40'
}
SKMeelyNode >> step [

	self isInDrag ifTrue: [self changed: #pos]
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:35'
}
SKMeelyNode >> stepTime [

	^ 20
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:14'
}
SKMeelyNode >> unselectNode [

	self color: self normalColor
]
