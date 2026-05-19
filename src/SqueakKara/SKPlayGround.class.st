Class {
	#name : #SKPlayGround,
	#superclass : #Morph,
	#instVars : [
		'edges'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 10:57'
}
SKPlayGround >> acceptDroppingMorph: aMorph event: anEvent [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:47'
}
SKPlayGround >> addEdge: aEdge [

	self edges add: aEdge
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:49'
}
SKPlayGround >> edges [

	^ edges ifNil: [edges := OrderedCollection new]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 10:55'
}
SKPlayGround >> wantsDroppedMorph: aMorph event: anEvent [

	^ true
]
