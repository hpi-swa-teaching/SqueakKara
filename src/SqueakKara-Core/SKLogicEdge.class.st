Class {
	#name : #SKLogicEdge,
	#superclass : #Object,
	#instVars : [
		'inNode',
		'outNode',
		'command',
		'condition'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #visitor,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:25'
}
SKLogicEdge >> accept: aVisitor [
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:24'
}
SKLogicEdge >> command [

	^ command ifNil: [ command := '' ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:22'
}
SKLogicEdge >> command: aString [

	command := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:23'
}
SKLogicEdge >> condition [

	^ condition ifNil: [ condition := 'default' ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:23'
}
SKLogicEdge >> condition: aString [

	condition := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:21'
}
SKLogicEdge >> inNode [

	^ inNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:21'
}
SKLogicEdge >> inNode: aLogicNode [

	inNode := aLogicNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:21'
}
SKLogicEdge >> outNode [

	^ outNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:21'
}
SKLogicEdge >> outNode: aLogicNode [

	outNode := aLogicNode
]
