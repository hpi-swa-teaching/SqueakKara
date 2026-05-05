Class {
	#name : #SKLogicNode,
	#superclass : #Object,
	#instVars : [
		'name',
		'edges'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:18'
}
SKLogicNode >> addEdge: aLogicEdge [
	
	edges add: aLogicEdge 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:15'
}
SKLogicNode >> edges [

	^ edges
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:15'
}
SKLogicNode >> name [

	^ name ifNil: [ name := '' ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:14'
}
SKLogicNode >> name: aString [
	
	name := aString
]
