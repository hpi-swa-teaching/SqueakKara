Class {
	#name : #SKProgrammingUIMealy,
	#superclass : #SKProgrammingUI,
	#instVars : [
		'logicGraph',
		'editor'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:58'
}
SKProgrammingUIMealy >> build [

	self editor: SKStateMachineEditor new.
	self environment windowManager addWindow: self editor
]

{
	#category : #compile,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:56'
}
SKProgrammingUIMealy >> compileToLogicGraph: aNodeCollection edges: aEdgeCollection [

	| startingNodeName |
	
	self logicGraph: SKLogicGraph new.
	
	aNodeCollection do: [:aNode | self logicGraph addNodeWithName: aNode name].
	aEdgeCollection do: [:aEdge | self logicGraph addEdgeFrom: aEdge fromNode name to: aEdge toNode name command: aEdge command condition: aEdge command].

	startingNodeName := aNodeCollection detect: [:aNode | aNode isStartingNode].
	self logicGraph startingNode: (self logicGraph getNodeByName: startingNodeName).

	self deleteUselessNodes
]

{
	#category : #compile,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:55'
}
SKProgrammingUIMealy >> deleteUselessNodes [

	logicGraph nodes do: [:aNode | (aNode hasEdge and: (aNode <> self logicGraph startingNode)) ifTrue: [
		logicGraph deleteNodeWithNoEdge: aNode]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:58'
}
SKProgrammingUIMealy >> editor [

	^ editor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:58'
}
SKProgrammingUIMealy >> editor: aEditor [

	editor := aEditor
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 12:03'
}
SKProgrammingUIMealy >> getCode [

	self compileToLogicGraph: self editor nodes edges: self editor nodes.
	self logicGraph isValid ifFalse: [self inform: 'Der Automat ist nicht valide!'].
	^ self logicGraph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:53'
}
SKProgrammingUIMealy >> logicGraph [

	^ logicGraph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:54'
}
SKProgrammingUIMealy >> logicGraph: aLogicGraph [

	logicGraph := aLogicGraph
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:40'
}
SKProgrammingUIMealy >> setCode: aCode [

	
]
