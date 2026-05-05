Class {
	#name : #SKLogicGraphTest,
	#superclass : #TestCase,
	#instVars : [
		'runner',
		'executeContext'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #asseccing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 21:28'
}
SKLogicGraphTest >> executeContext [

	^ executeContext
]

{
	#category : #asseccing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 21:29'
}
SKLogicGraphTest >> executeContext: aExecuteContext [

	executeContext := aExecuteContext
]

{
	#category : #util,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:40'
}
SKLogicGraphTest >> executeSteps: aNumber [

	(1 to: aNumber) do: [:i| self runner executeStep]
]

{
	#category : #asseccing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 21:23'
}
SKLogicGraphTest >> runner [
	
	^ runner
]

{
	#category : #asseccing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 21:24'
}
SKLogicGraphTest >> runner: aRunner [
	
	runner := aRunner
]

{
	#category : #setup,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:33'
}
SKLogicGraphTest >> setUp [

	self executeContext: (SKExecuteContext new).
	self runner: (SKLogicRunner newWithExecutionContext: self executeContext)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:59'
}
SKLogicGraphTest >> testAccessToUndefinedVariables [

	| graph env|
	
	graph := SKLogicGraph new.
	graph
		addNodeWithName: 'node1';
		addNodeWithName: 'node2'.
	graph 
		addEdgeFrom: 'node1' to: 'node2' command: '' condition: 'env at: #non'.
	graph setStartNode: 'node1'.
	
	self runner attachToGraph: graph.
	env := self runner executeContext env.
	
	self executeSteps: 1.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:47'
}
SKLogicGraphTest >> testBaseCondition [

	| graph env|
	
	graph := SKLogicGraph new.
	graph
		addNodeWithName: 'node1';
		addNodeWithName: 'node2'.
	graph addEdgeFrom: 'node1' to: 'node2' command: 'env at: #test put: true' condition: '(env at: #con) < 11'.
	graph setStartNode: 'node1'.
	
	self runner attachToGraph: graph.
	env := self runner executeContext env.
	env at: #test put: false.
	env at: #con put: 10.
	
	self executeSteps: 1.
	
	self assert: (env at: #test)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:44'
}
SKLogicGraphTest >> testBasicEdgeExecution [

	| graph env|
	
	graph := SKLogicGraph new.
	graph
		addNodeWithName: 'node1';
		addNodeWithName: 'node2'.
	graph addEdgeFrom: 'node1' to: 'node2' command: 'env at: #test put: true' condition: 'true'.
	graph setStartNode: 'node1'.
	
	self runner attachToGraph: graph.
	env := self runner executeContext env.
	env at: #test put: false.
	
	self executeSteps: 1.
	
	self assert: (env at: #test)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:53'
}
SKLogicGraphTest >> testDefaultEdge [

	
	| graph env|
	
	graph := SKLogicGraph new.
	graph
		addNodeWithName: 'node1';
		addNodeWithName: 'node2'.
	graph addEdgeFrom: 'node1' to: 'node2' command: 'env at: #test put: true' condition: ''.
	graph setStartNode: 'node1'.
	
	self runner attachToGraph: graph.
	env := self runner executeContext env.
	env at: #test put: false.
	
	self executeSteps: 1.
	
	self assert: (env at: #test)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:54'
}
SKLogicGraphTest >> testNoPossibleEdge [

	
	| graph env|
	
	graph := SKLogicGraph new.
	graph
		addNodeWithName: 'node1';
		addNodeWithName: 'node2'.
	graph 
		addEdgeFrom: 'node1' to: 'node2' command: 'env at: #test put: true' condition: 'false';
		addEdgeFrom: 'node1' to: 'node2' command: 'env at: #test put: true' condition: '(env at: #con) < 10'.
	graph setStartNode: 'node1'.
	
	self runner attachToGraph: graph.
	env := self runner executeContext env.
	env at: #test put: false.
	env at: #con put: 10.
	
	self executeSteps: 4.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 23:01'
}
SKLogicGraphTest >> testSelfLoop [

	| graph env|
	
	graph := SKLogicGraph new.
	graph addNodeWithName: 'node1'.
	graph addEdgeFrom: 'node1' to: 'node1' command: 'env at: #test put: ((env at: #test) + 1)' condition: ''.
	graph setStartNode: 'node1'.
	
	self runner attachToGraph: graph.
	env := self runner executeContext env.
	env at: #test put: 0.
	
	self executeSteps: 5.
	
	self assert: (env at: #test) = 5
]
