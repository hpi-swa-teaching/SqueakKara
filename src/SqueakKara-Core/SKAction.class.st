"
A SKAction contains an action type and an action, represented by a block.

Instance Variables
	action:		<Block>
	type:		<Object/Symbol>

action
	- A Block that can be executed.

type
	- Some kind of type for comparison. Depending on usage, can have different data types.

"
Class {
	#name : #SKAction,
	#superclass : #Object,
	#instVars : [
		'type',
		'action'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'LM 5/10/2026 20:27'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'LM 5/7/2026 09:57'
}
SKAction class >> newWithType: aType [
	^ self new
		type: aType;
		action: []
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'LM 5/7/2026 09:54'
}
SKAction class >> newWithType: aType action: aBlock [
	^ self new
		type: aType;
		action: aBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:54'
}
SKAction >> action [

	^ action
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:54'
}
SKAction >> action: aBlock [

	action := aBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:54'
}
SKAction >> type [

	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:54'
}
SKAction >> type: aType [

	type := aType
]
