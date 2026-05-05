Class {
	#name : #SKLogicRunner,
	#superclass : #Object,
	#instVars : [
		'currentNode'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:32'
}
SKLogicRunner >> currentNode [
	
	^ currentNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:32'
}
SKLogicRunner >> currentNode: aLogicNode [

	currentNode := aLogicNode
]
