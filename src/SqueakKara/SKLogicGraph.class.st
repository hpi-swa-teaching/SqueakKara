Class {
	#name : #SKLogicGraph,
	#superclass : #Object,
	#instVars : [
		'startingNode'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:29'
}
SKLogicGraph >> startingNode [

	^ startingNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:29'
}
SKLogicGraph >> startingNode: aLogicNode [

	startingNode := aLogicNode
]
