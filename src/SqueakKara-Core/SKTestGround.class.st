Class {
	#name : #SKTestGround,
	#superclass : #Object,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:31'
}
SKTestGround >> testLogicGraphWithKara [

	| graph runner grid kara executionContext | 
	
	graph := (SKLogicGraph new
				addNodeWithName: 'node1';
				addNodeWithName: 'node2';
				addEdgeFrom: 'node1' to: 'node2' command: 'kara move. env at: #test put: true' condition: 'true';
				addEdgeFrom: 'node2' to: 'node1' command: '' condition: 'env at: #test';
				setStartNode: 'node1';
				yourself).
	
	grid := SKGrid newWithExtent: 7@7.
	kara := SKKara newInGrid: grid at: 1@1.
	executionContext := SKExecuteContext new.
	executionContext kara: kara.

	runner := SKLogicRunner newWithExecutionContext: executionContext.
	runner attachToGraph: graph.

	^ runner
]
