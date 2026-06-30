Class {
	#name : #SKMealyNodeTest,
	#superclass : #TestCase,
	#instVars : [
		'node'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'JS 6/9/2026 17:30'
}
SKMealyNodeTest >> setUp [
	node := SKMealyNode new
]

{
	#category : #setup,
	#'squeak_changestamp' : 'JS 6/9/2026 17:30'
}
SKMealyNodeTest >> tearDown [
	node delete
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 6/9/2026 17:48'
}
SKMealyNodeTest >> testController [


|stateMachineEditor|

	stateMachineEditor := SKStateMachineEditor new.
	stateMachineEditor actionCreateNode.
	stateMachineEditor playGround nodes do: [:n | 
		self assert: (n controller =  nil) not]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LP 6/30/2026 16:27'
}
SKMealyNodeTest >> testLabelCreation [

|stateMachineEditor|

	stateMachineEditor := SKStateMachineEditor new.
	stateMachineEditor initializePlayground. 
	stateMachineEditor playGround nodes do: [:each| (each isStartingNode) ifTrue: [self assert: each label = nil]]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 6/9/2026 17:43'
}
SKMealyNodeTest >> testNodeSize [

	self assert: node extent = node defaultSize
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 6/10/2026 13:00'
}
SKMealyNodeTest >> testNodeType [

	node isStartingNode: true.
	self assert: node isStartingNode
]
