Class {
	#name : #SKTestGround,
	#superclass : #Object,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 17:06'
}
SKTestGround >> testLogicGraphWithKara [

	| node1 node2 edge12 graph runner grid kara | 
	
	node1 := SKLogicNode newWithName: 'node1'.
	node2 := SKLogicNode newWithName: 'node2'.
	edge12 := SKLogicEdge newWithCommand: 'kara move' condition: 'true' toNode: node2.
	node1 addEdge: edge12.
	graph := SKLogicGraph newWithStartingNode: node1.
	
	grid := SKGrid newWithExtent: 7@7.
	kara := SKKara newInGrid: grid at: 1@1.

	runner := SKLogicRunner newWithKara: kara.
	runner attachToGraph: graph.

	^ runner
]
