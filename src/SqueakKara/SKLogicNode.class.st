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
	#category : #constructor,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 14:49'
}
SKLogicNode class >> newWithName: aString [
	
	^ (self new
		name: aString;
		yourself)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:06'
}
SKLogicNode >> addEdge: aLogicEdge [
	
	aLogicEdge fromNode: self.
	self edges add: aLogicEdge.
	
	^ aLogicEdge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 15:04'
}
SKLogicNode >> edges [

	^ edges ifNil: [edges := OrderedCollection new]
]

{
	#category : #tests,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 15:05'
}
SKLogicNode >> hasEdge [

	^ (self edges size > 0)
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
