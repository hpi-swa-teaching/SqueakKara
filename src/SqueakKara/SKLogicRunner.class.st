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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 17:03'
}
SKLogicRunner class >> newWithKara: aKara [

	| runner |
	
	runner := self new.
	runner executeContext kara: aKara.
	^ runner
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 17:06'
}
SKLogicRunner >> attachToGraph: aLogicGraph [

	Transcript show: '[LogicRunner] Attacht to startingNode: ' , aLogicGraph startingNode name; cr.

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
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 16:32'
}
SKLogicRunner >> executeContext [

	^ executeContext ifNil: [executeContext := SKExecuteContext new]
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
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 16:07'
}
SKLogicRunner >> executeStep [
	
	| nextEdge |
	
	self currentNode hasEdge ifFalse: [
			Transcript show: '[LoigcRunner] ', currentNode name , ' has no edges'; cr.
			^ nil].
	nextEdge := self findNextEdge: self currentNode. 
	nextEdge ifNil: [^ nil].
	
	self	executeCode: nextEdge command; 
		traverseEdge: nextEdge
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 16:14'
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
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 16:45'
}
SKLogicRunner >> traverseEdge: aLogicEdge [

	Transcript show: ('[LogicRunner] ' , aLogicEdge fromNode name, ' --> ', aLogicEdge toNode name); cr.

	self currentNode: aLogicEdge toNode
	
]

{
	#category : #visit,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:39'
}
SKLogicRunner >> visitLogicEdge: aLogicEdge [

	self traverseEdge: aLogicEdge
]
