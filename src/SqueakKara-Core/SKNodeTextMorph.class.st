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
	#'squeak_changestamp' : 'Lars 7/7/2026 01:43'
}
SKNodeTextMorph >> handleKeystroke: anEvent [

	anEvent keyCharacter = Character cr ifTrue: [self acceptContents.
		self owner actionDeselect.
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
