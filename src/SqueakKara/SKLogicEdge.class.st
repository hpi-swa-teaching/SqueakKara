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
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 13:23'
}
SKLogicEdge class >> newWithCommand: aString condition: anotherString fromNode: aLogicNode toNode: anotherLogicNode [

	^(self new
		command: aString;
		condition: anotherString;
		toNode: aLogicNode;
		fromNode: anotherLogicNode;
		yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:30'
}
SKLogicEdge class >> newWithCommand: aString condition: anotherString toNode: aLogicNode [

	^(self new
		command: aString;
		condition: anotherString;
		toNode: aLogicNode;
		yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:19'
}
SKLogicEdge class >> newWithfromNode: aLogicNode toNode: anotherLogicNode [

	^ (self new
		outNode: aLogicNode;
		inNode: anotherLogicNode;
		yourself)
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
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:50'
}
SKLogicEdge >> condition: aString [

	(aString  ~= '') ifTrue: [self toggleHasNoDefaultCondition].
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
