Class {
	#name : #SKAction,
	#superclass : #Object,
	#instVars : [
		'type',
		'action'
	],
	#category : #'SqueakKara-Core'
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
