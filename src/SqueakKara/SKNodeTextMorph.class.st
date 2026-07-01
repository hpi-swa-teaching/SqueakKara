Class {
	#name : #SKNodeTextMorph,
	#superclass : #TextMorph,
	#instVars : [
		'node'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #input,
	#'squeak_changestamp' : 'Lars Kuhr 7/1/2026 13:02'
}
SKNodeTextMorph >> handleKeystroke: anEvent [

	anEvent keyCharacter = Character cr ifTrue: [self acceptContents.
		self owner unselectNode.
		^ self].
	super keyStroke: anEvent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 7/1/2026 13:03'
}
SKNodeTextMorph >> node [

	^ node
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 7/1/2026 13:03'
}
SKNodeTextMorph >> node: aNode [

	node := aNode
]
