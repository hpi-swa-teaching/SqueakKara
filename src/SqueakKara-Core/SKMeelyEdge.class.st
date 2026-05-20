Class {
	#name : #SKMeelyEdge,
	#superclass : #Object,
	#instVars : [
		'line',
		'fromNode',
		'toNode',
		'controller'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 13:24'
}
SKMeelyEdge class >> newFrom: aNode to: anotherNode [

	| instance line |
	instance := self new.
	line := LineMorph from: aNode center to: anotherNode center color: (Color fromString: '#8caaee') width: 5.
	instance 
		line: line;
		fromNode: aNode;
		toNode: anotherNode.
	aNode controller playGround addMorph: line.
	
	^ instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:53'
}
SKMeelyEdge >> controller [

	^ controller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:53'
}
SKMeelyEdge >> controller: aController [

	controller := aController
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:38'
}
SKMeelyEdge >> delete [
	
	self line ifNotNil: [self line delete]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:10'
}
SKMeelyEdge >> fromNode [

	^ fromNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMeelyEdge >> fromNode: aNode [
	
	fromNode := aNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:30'
}
SKMeelyEdge >> line [

	^ line
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:30'
}
SKMeelyEdge >> line: aLine [

	line := aLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMeelyEdge >> toNode [

	^ toNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMeelyEdge >> toNode: aNode [

	toNode := aNode
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 13:28'
}
SKMeelyEdge >> update: aValue [

	self line delete.
	self line: (LineMorph from: self fromNode center to: self toNode center color: (Color fromString: '#8caaee') width: 5).
	self controller playGround addComponent: self line
]
