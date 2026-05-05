Class {
	#name : #SKLogicEdge,
	#superclass : #Object,
	#instVars : [
		'toNode',
		'fromNode',
		'command',
		'condition',
		'hasDefaultCondition'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:52'
}
SKLogicEdge class >> newWithCommand: aString condition: anotherString outNode: aLogicNode inNode: anotherLogicNode [

	^(self new
		command: aString;
		condition: anotherString;
		outNode: aLogicNode;
		inNode: anotherLogicNode;
		yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 16:43'
}
SKLogicEdge class >> newWithCommand: aString condition: anotherString toNode: anotherLogicNode [

	^(self new
		command: aString;
		condition: anotherString;
		toNode: anotherLogicNode;
		yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 15:01'
}
SKLogicEdge class >> newWithOutNode: aLogicNode inNode: anotherLogicNode [

	^ (self new
		outNode: aLogicNode;
		inNode: anotherLogicNode;
		yourself)
]

{
	#category : #visitor,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:37'
}
SKLogicEdge >> accept: aVisitor [

	aVisitor visitLogicEdge: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:24'
}
SKLogicEdge >> command [

	^ command ifNil: [ command := '' ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:22'
}
SKLogicEdge >> command: aString [

	command := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 15:27'
}
SKLogicEdge >> condition [

	^ condition ifNil: [ condition := '' ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 15:30'
}
SKLogicEdge >> condition: aString [

	self toggleHasNoDefaultCondition.
	condition := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 16:44'
}
SKLogicEdge >> fromNode [

	^ fromNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 16:44'
}
SKLogicEdge >> fromNode: aLogicNode [

	fromNode := aLogicNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 15:46'
}
SKLogicEdge >> hasDefaultCondition [
	
	^ hasDefaultCondition ifNil: [hasDefaultCondition := true]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 16:44'
}
SKLogicEdge >> toNode [

	^ toNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 16:45'
}
SKLogicEdge >> toNode: aLogicNode [

	toNode := aLogicNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 15:29'
}
SKLogicEdge >> toggleHasNoDefaultCondition [

	hasDefaultCondition := false
]
