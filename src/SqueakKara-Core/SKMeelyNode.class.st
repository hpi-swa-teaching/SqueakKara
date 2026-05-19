Class {
	#name : #SKMeelyNode,
	#superclass : #CircleMorph,
	#instVars : [
		'controller'
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
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:55'
}
SKMeelyNode >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:10'
}
SKMeelyNode >> initialize [

	super initialize.
	
	self extent: 60 @ 60;
		color: Color red
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:49'
}
SKMeelyNode >> justDroppedInto: newOwner event: anEvent [

	(newOwner isKindOf: SKPlayGround) ifFalse: [
		Transcript show: 'delete'; cr.].
	newOwner addMorphFront: self.
	self changed: #pos

]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 13:01'
}
SKMeelyNode >> mouseDown: anEvent [

	self controller mode = #edge ifTrue: [
		self controller selectedNode 
			ifNil: [self controller selectedNode: self]
			ifNotNil: [
				self controller selectedNode = self 
					ifTrue: [self controller selectedNode: nil]
					ifFalse: [self controller createEdgeFrom: (self controller selectedNode) to: self]]
		].

	self controller mode = #drag ifTrue: [
		anEvent hand
		waitForClicksOrDrag: self
		event: anEvent
		selectors: {nil. nil. nil. #startDrag:}
		threshold: HandMorph dragThreshold]

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:42'
}
SKMeelyNode >> selectNode [

	self color: Color blue
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 13:02'
}
SKMeelyNode >> startDrag: anEvent [

	self controller mode = #drag ifFalse: [^ nil].
	anEvent hand grabMorph: self
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:32'
}
SKMeelyNode >> unselectNode [

	self color: Color red
]
