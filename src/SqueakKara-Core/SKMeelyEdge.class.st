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
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:32'
}
SKMeelyEdge class >> newFrom: aNode to: anotherNode [

	| instance line |
	instance := self new.
	line := LineMorph from: aNode center to: anotherNode center color: Color blue width: 3.
	instance line: line.
	aNode controller playGround addMorph: line.
	
	^ instance
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:53'
}
SKMeelyEdge >> controller [

	^ controller
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:53'
}
SKMeelyEdge >> controller: aController [

	controller := aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:10'
}
SKMeelyEdge >> fromNode [

	^ fromNode
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMeelyEdge >> fromNode: aNode [
	
	fromNode := aNode
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:30'
}
SKMeelyEdge >> line [

	^ line
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:30'
}
SKMeelyEdge >> line: aLine [

	line := aLine
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMeelyEdge >> toNode [

	^ toNode
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMeelyEdge >> toNode: aNode [

	toNode := aNode
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:53'
}
SKMeelyEdge >> update: aValue [

	self line delete.
	self line: (LineMorph from: self fromNode center to: self toNode center color: Color blue width: 3).
	self controller playGround addMorph: self line
]
