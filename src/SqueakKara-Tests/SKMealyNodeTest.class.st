Class {
	#name : #SKMealyNodeTest,
	#superclass : #TestCase,
	#instVars : [
		'node',
		'stateMachineEditor'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'JS 7/5/2026 18:17'
}
SKMealyNodeTest >> setUp [
	node := SKMealyNode new.
	stateMachineEditor := SKStateMachineEditor new
]

{
	#category : #setup,
	#'squeak_changestamp' : 'JS 7/5/2026 18:17'
}
SKMealyNodeTest >> tearDown [
	node delete.
	stateMachineEditor delete
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 7/5/2026 18:22'
}
SKMealyNodeTest >> testController [

	stateMachineEditor actionCreateNode.
	stateMachineEditor playGround nodes do: [:n | 
		self assert: (n controller =  nil) not].
	(stateMachineEditor playGround nodes at: 2) delete
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 7/5/2026 18:17'
}
SKMealyNodeTest >> testLabelCreation [

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
