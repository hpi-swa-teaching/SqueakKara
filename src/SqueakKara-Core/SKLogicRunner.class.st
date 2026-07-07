Class {
	#name : #SKLogicRunner,
	#superclass : #Object,
	#instVars : [
		'currentNode',
		'executeContext',
		'compiler'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 21:07'
}
SKLogicRunner class >> newWithExecutionContext: aExecutionContext [

	^ (self new
		executeContext: aExecutionContext copy;
		yourself)
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:47'
}
SKLogicRunner >> attachToGraph: aLogicGraph [

"	Transcript show: '[LogicRunner] Attacht to startingNode: ' , aLogicGraph startingNode name; cr."

	self executeContext env: (SKContextVariables new).
	self compiler: (Compiler new);
		currentNode: aLogicGraph startingNode 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 15:36'
}
SKLogicRunner >> compiler [

	^ compiler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 15:36'
}
SKLogicRunner >> compiler: aCompiler [

	compiler := aCompiler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:32'
}
SKLogicRunner >> currentNode [
	
	^ currentNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:32'
}
SKLogicRunner >> currentNode: aLogicNode [

	currentNode := aLogicNode
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 15:40'
}
SKLogicRunner >> executeCode: aString [

	^ (self compiler evaluate: aString for: self executeContext)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 20:56'
}
SKLogicRunner >> executeContext [

	^ executeContext
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 15:21'
}
SKLogicRunner >> executeContext: aExecuteContext [
	
	^ executeContext := aExecuteContext
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 09:20'
}
SKLogicRunner >> executeLogicGraph [

	| hasNextStep counter |
	
	counter := 0.
	
	hasNextStep := true.
	[hasNextStep] whileTrue: [self executeStep ifNil: [hasNextStep := false].
		counter := counter + 1.
		counter >= 500 ifTrue: [Transcript show: '[SKLogicRunner] Endlosschleife Detected'.
			^ self]]
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 09:23'
}
SKLogicRunner >> executeStep [
	
	| nextEdge |
	
	self currentNode hasEdge ifFalse: [
			Transcript show: '[LoigcRunner] ', currentNode name , ' has no edges'; cr.
			^ nil].
	nextEdge := self findNextEdge: self currentNode. 
	nextEdge ifNil: [^ nil].
	
	self	executeCode: nextEdge getCode; 
		traverseEdge: nextEdge
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:55'
}
SKLogicRunner >> findNextEdge: aLogicNode [

	| possibleEdges defaultEdges result |
	
	possibleEdges := aLogicNode edges select: [:aEdge |
			result := self executeCode: aEdge condition.
			((aEdge hasDefaultCondition not) and: (result isBoolean)) and: result].
	defaultEdges := aLogicNode edges select: [:aEdge | aEdge hasDefaultCondition].
	
	(possibleEdges size > 0) ifTrue: [^ possibleEdges first].
	(defaultEdges size > 0) ifTrue: [^ defaultEdges first].
	
	Transcript show: '[LogicRunner] No possible edge found'; cr.
	^ nil
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:48'
}
SKLogicRunner >> traverseEdge: aLogicEdge [

"	Transcript show: ('[LogicRunner] ' , aLogicEdge fromNode name, ' --> ', aLogicEdge toNode name); cr."

	self currentNode: aLogicEdge toNode
	
]
