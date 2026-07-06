Class {
	#name : #SKLogicGraph,
	#superclass : #Object,
	#instVars : [
		'startingNode',
		'nodes',
		'edges'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:54'
}
SKLogicGraph class >> newWithStartingNode: aLogicNode [
	
	^ (self new
		startingNode: aLogicNode;
		yourself)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:09'
}
SKLogicGraph >> addEdge: aLogicEdge [

	self edges at: (aLogicEdge toNode name) put: aLogicEdge
]

{
	#category : #construction,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:18'
}
SKLogicGraph >> addEdgeFrom: aFromString to: aToString command: aCommandString condition: aConditionString [

	 | fromNode toNode edge|
	
	fromNode := self getNodeByName: aFromString.
	toNode := self getNodeByName: aToString.
	edge := fromNode addEdge: (SKLogicEdge newWithCommand: aCommandString condition: aConditionString toNode: toNode).
	self addEdge: edge	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:09'
}
SKLogicGraph >> addNode: aLogicNode [

	self nodes at: (aLogicNode name) put: aLogicNode
]

{
	#category : #construction,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:04'
}
SKLogicGraph >> addNodeWithName: aString [

	self addNode: (SKLogicNode newWithName: aString)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:11'
}
SKLogicGraph >> edges [

	^ edges ifNil: [edges := Dictionary new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:25'
}
SKLogicGraph >> getNodeByName: aString [ 

	(self nodes includesKey: aString) ifFalse: [
		self error:  '[LogicGraph] No node found with name: ' , aString.
		^ nil].
	^ self nodes at: aString
]

{
	#category : #check,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 12:01'
}
SKLogicGraph >> isValid [

	self startingNode ifNil: [^ false].
	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:08'
}
SKLogicGraph >> nodes [

	^ nodes ifNil: [nodes := Dictionary new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 14:13'
}
SKLogicGraph >> removeNode: aNode [

	self nodes removeKey: aNode name
]

{
	#category : #construction,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:31'
}
SKLogicGraph >> setStartNode: aString [

	self startingNode: (self getNodeByName: aString)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:29'
}
SKLogicGraph >> startingNode [

	^ startingNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:29'
}
SKLogicGraph >> startingNode: aLogicNode [

	startingNode := aLogicNode
]
