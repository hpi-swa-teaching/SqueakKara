Class {
	#name : #SKProgrammingUIMealy,
	#superclass : #SKProgrammingUI,
	#instVars : [
		'logicGraph',
		'editor',
		'testMode'
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
	#'squeak_changestamp' : 'Lars Kuhr 6/22/2026 17:28'
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
	#'squeak_changestamp' : 'Lars 7/7/2026 10:55'
}
SKProgrammingUIMealy >> getCode [

	self compileToLogicGraph: self editor nodes edges: (self editor edges).
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 12:15'
}
SKProgrammingUIMealy >> testMode [

	^ testMode ifNil: [testMode := false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 12:15'
}
SKProgrammingUIMealy >> testMode: aBoolean [

	testMode := aBoolean
]
