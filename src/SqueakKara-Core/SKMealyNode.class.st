Class {
	#name : #SKMealyNode,
	#superclass : #CircleMorph,
	#instVars : [
		'controller',
		'isInDrag',
		'nodeType',
		'stateMachineEditor'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:13'
}
SKMealyNode >> controller [

	^ controller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:14'
}
SKMealyNode >> controller: aController [

	controller := aController
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:17'
}
SKMealyNode >> defaultSize [

	^ 75 @ 75
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:55'
}
SKMealyNode >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 6/9/2026 02:35'
}
SKMealyNode >> initialize [

	super initialize.
	
	self extent: self defaultSize;
		color: self normalColor;
		borderWidth: 3;
		setToBasicNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:41'
}
SKMealyNode >> isInDrag [

	^ isInDrag ifNil: [isInDrag := false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:33'
}
SKMealyNode >> isInDrag: aBoolean [

	isInDrag := aBoolean
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/9/2026 02:38'
}
SKMealyNode >> isStart [
	
	^ self nodeType = 'start'
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JS 6/9/2026 13:24'
}
SKMealyNode >> justDroppedInto: newOwner event: anEvent [

	(newOwner isKindOf: SKPlayGround) ifFalse: [controller queueNodeToDelete: self].

	newOwner addMorphFront: self.
	self isInDrag: false.
	self visualiseNodeType
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:58'
}
SKMealyNode >> mouseDown: anEvent [

	self controller mode = #drag ifTrue: [
		anEvent hand
		waitForClicksOrDrag: self
		event: anEvent
		selectors: {nil. nil. nil. #startDrag:}
		threshold: HandMorph dragThreshold].
	self controller nodeClicked: self

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/9/2026 00:43'
}
SKMealyNode >> nodeType [
	^ nodeType
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/9/2026 00:43'
}
SKMealyNode >> nodeType: anObject [
	nodeType := anObject
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:45'
}
SKMealyNode >> normalColor [

	^ SKStylesheet colorOrange
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:14'
}
SKMealyNode >> selectNode [

	self color: self selectedColor
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:45'
}
SKMealyNode >> selectedColor [

	^ SKStylesheet colorRed
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/9/2026 02:15'
}
SKMealyNode >> setToBasicNode [
	
	self nodeType: 'basic'
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/9/2026 02:15'
}
SKMealyNode >> setToStartNode [
	
	self nodeType: 'start'
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:33'
}
SKMealyNode >> startDrag: anEvent [

	self controller mode = #drag ifFalse: [^ nil].
	self isInDrag: true.
	anEvent hand grabMorph: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/9/2026 13:23'
}
SKMealyNode >> stateMachineEditor [
	^ stateMachineEditor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/9/2026 13:23'
}
SKMealyNode >> stateMachineEditor: anObject [
	stateMachineEditor := anObject
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:40'
}
SKMealyNode >> step [

	self isInDrag ifTrue: [self changed: #pos]
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:35'
}
SKMealyNode >> stepTime [

	^ 20
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:14'
}
SKMealyNode >> unselectNode [

	self color: self normalColor
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/9/2026 17:18'
}
SKMealyNode >> visualiseNodeType [

|hasStartEdge|

	self isStart ifTrue: [
		hasStartEdge := false.
		(self stateMachineEditor playGround findAllEdgesToNode: self) do: [:edge |
				edge fromNode == nil ifTrue: 
					[hasStartEdge := true]].
		hasStartEdge ifFalse: [
			self stateMachineEditor actionAddEdgeFromPosition: self center -100 toNode: self]]
]
