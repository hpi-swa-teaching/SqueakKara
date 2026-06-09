Class {
	#name : #SKMealyTest,
	#superclass : #TestCase,
	#instVars : [
		'environment'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 13:59'
}
SKMealyTest >> checkEqualityForEdge: aEdge and: anotherEdge [
	
	aEdge command = anotherEdge command ifFalse: [^ false].
	aEdge condition = anotherEdge condition ifFalse: [^ false].
	
	^ true
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 13:47'
}
SKMealyTest >> checkEqualityForNode: aNode and: anotherNode [

	(aNode name = anotherNode name) ifFalse: [^ false].
	(self checkIfNodeHasSameEdges: aNode and: anotherNode) ifFalse: [^ false].
	(aNode edges size = anotherNode edges size) ifFalse: [^ false].
	^ true
	

]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 14:03'
}
SKMealyTest >> checkIfLogicGraph: aLogicGraph hasNode: aNode [

	^ (aLogicGraph nodes anySatisfy: [:node | self checkEqualityForNode: node and: aNode])
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 14:02'
}
SKMealyTest >> checkIfLogicGraphHasNode: aNode [

]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 14:03'
}
SKMealyTest >> checkIfNodeHasSameEdges: aNode and: anotherNode [

	| hasEquivalentEdge |
	
	aNode edges do: [:aEdge| 
		hasEquivalentEdge := anotherNode edges anySatisfy: [:anotherEdge| self checkEqualityForEdge: aEdge and: anotherEdge].
		hasEquivalentEdge ifFalse: [^ false]].
	^ true
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 10:16'
}
SKMealyTest >> createEdgeFrom: aFromNode to: aToNode command: aCommand condition: aCondition [

	^ (SKMealyEdge new
			fromNode: aFromNode;
			toNode: aToNode;
			command: aCommand;
			condition: aCondition;
			yourself)
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 10:12'
}
SKMealyTest >> createNodeWithName: aString [ 

	^ (SKMealyNode new
			name: aString;
			yourself)
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 10:13'
}
SKMealyTest >> createStartingNodeWithName: aString [ 

	^ (SKMealyNode new
			name: aString;
			isStartingNode: true;
			yourself)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 10:00'
}
SKMealyTest >> environment [

	^ environment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 10:01'
}
SKMealyTest >> environment: aEnvironment [

	environment := aEnvironment
]

{
	#category : #setup,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 10:17'
}
SKMealyTest >> setUp [

	self environment: (SKEnvironment newWithProgrammingConcept: SKProgrammingConcept mealy).
	self environment initializeWithKaraAt: 1 @ 1
]

{
	#category : #setup,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 10:02'
}
SKMealyTest >> tearDown [

	self environment close
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 10:39'
}
SKMealyTest >> testIntegration [

	| playGround node1 node2 edge1 kara |
	
	kara := self environment karas first.
	playGround := self environment programmingUI editor playGround.
	node1 := self createStartingNodeWithName: 'node1'.
	node2 := self createNodeWithName: 'node2'.
	edge1 := self createEdgeFrom: node1 to: node2 command: 'kara turn: left' condition: ''.
	playGround
		addNode: node1;
		addNode: node2;
		addEdge: edge1.
	self environment run.
	
	(Delay forMilliseconds: 500) wait.
	
	self assert: kara viewDirection = (0 @ -1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 14:05'
}
SKMealyTest >> testNormalCompile [

	| playGround node1 node2 edge1 logicGraph logicNode1 logicNode2 logicEdge1 |
	
	playGround := self environment programmingUI editor playGround.
	node1 := self createStartingNodeWithName: 'node1'.
	node2 := self createNodeWithName: 'node2'.
	edge1 := self createEdgeFrom: node1 to: node2 command: 'kara turn: left' condition: ''.
	playGround
		addNode: node1;
		addNode: node2;
		addEdge: edge1.
	logicGraph := self environment programmingUI getCode.
	
	self assert: logicGraph nodes size = 2.
	self assert: logicGraph edges size = 1.
	
	logicNode1 := SKLogicNode newWithName: 'node1'.
	logicNode2 := SKLogicNode newWithName: 'node2'.
	logicEdge1 := (SKLogicEdge newWithCommand: 'kara turn: left' condition: '' fromNode: logicNode1 toNode: logicNode2).
	logicNode1 addEdge: logicEdge1.
	
	self assert: (self checkIfLogicGraph: logicGraph hasNode: logicNode1).
	self assert: (self checkIfLogicGraph: logicGraph hasNode: logicNode2).
	
	self assert: (self checkEqualityForNode: logicGraph startingNode and: logicNode1)
]
