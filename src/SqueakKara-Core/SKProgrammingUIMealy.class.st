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
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 10:36'
}
SKProgrammingUIMealy >> close [

	self editor delete
]

{
	#category : #compile,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:43'
}
SKProgrammingUIMealy >> compileToLogicGraph: aNodeCollection edges: aEdgeCollection [

	| startingNodeName |
	
	self logicGraph: SKLogicGraph new.
	
	aNodeCollection do: [:aNode | self logicGraph addNodeWithName: aNode name].
	aEdgeCollection do: [:aEdge | self logicGraph addEdgeFrom: (aEdge fromNode name) to: (aEdge toNode name) command: aEdge command condition: aEdge condition].

	startingNodeName := (aNodeCollection detect: [:aNode | aNode isStartingNode]) name.
	self logicGraph setStartNode: startingNodeName
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
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:33'
}
SKProgrammingUIMealy >> getCode [

	| edges |
	
	edges := self editor edges.
	edges do: [:aEdge| aEdge updateValues].
	
	self compileToLogicGraph: self editor nodes edges: edges.
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
