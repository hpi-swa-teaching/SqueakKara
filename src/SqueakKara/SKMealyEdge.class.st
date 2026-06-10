Class {
	#name : #SKMealyEdge,
	#superclass : #Object,
	#instVars : [
		'line',
		'fromNode',
		'toNode',
		'fromPosition',
		'controller'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 6/10/2026 10:09'
}
SKMealyEdge class >> newFrom: aNode to: anotherNode [

	| instance line |
	instance := self new.
	line := LineMorph from: aNode center to: anotherNode center color: instance normalColor width: 5.
	instance 
		line: line;
		fromNode: aNode;
		toNode: anotherNode.
	aNode controller playGround addMorph: line.
	
	^ instance
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 6/9/2026 13:02'
}
SKMealyEdge class >> newFromPosition: aPosition toNode: aNode [
"TODO: Stylesheet"

	| instance line |
	instance := self new.
	line := LineMorph from: aNode center to: aPosition color: (Color fromString: '#8caaee') width: 5.
	instance 
		line: line;
		fromNode: nil;
		toNode: aNode.
	aNode controller playGround addMorph: line.
	
	^ instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:53'
}
SKMealyEdge >> controller [

	^ controller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:53'
}
SKMealyEdge >> controller: aController [

	controller := aController
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:38'
}
SKMealyEdge >> delete [
	
	self line ifNotNil: [self line delete]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:10'
}
SKMealyEdge >> fromNode [

	^ fromNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMealyEdge >> fromNode: aNode [
	
	fromNode := aNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/9/2026 15:25'
}
SKMealyEdge >> fromPosition [
	^ fromPosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/9/2026 15:25'
}
SKMealyEdge >> fromPosition: anObject [
	fromPosition := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:30'
}
SKMealyEdge >> line [

	^ line
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:30'
}
SKMealyEdge >> line: aLine [

	line := aLine
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:46'
}
SKMealyEdge >> normalColor [

	^ SKStylesheet colorLightBlue
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMealyEdge >> toNode [

	^ toNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMealyEdge >> toNode: aNode [

	toNode := aNode
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'JS 6/10/2026 10:11'
}
SKMealyEdge >> update: aValue [
"TODO: Change colour"
	
	self line delete.
	self fromNode ifNotNil:[
		self line: (LineMorph from: self fromNode center to: self toNode center color: self normalColor width: 5)]
		ifNil:[
			self line: (LineMorph from: self fromPosition to: self toNode center color: self normalColor width: 5)].
	
	self controller playGround addComponent: self line
]
