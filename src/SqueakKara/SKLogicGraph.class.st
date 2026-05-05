Class {
	#name : #SKLogicGraph,
	#superclass : #Object,
	#instVars : [
		'startingNode'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:54'
}
SKLogicGraph class >> newWithStartingNode: aLogicNode [
	
	^ (self new
		startingNode: aLogicNode;
		yourself)
]

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
