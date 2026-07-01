"
A SKBlockConnectionPoint is a Point where two SKBlocks can be connected

Instance Variables
	connectedPoint:		<Object>
	type:		<Object>
	uiDelegate:		<Object>

connectedPoint
	- another ConnectionPoint of another SKBlock that is connected to this instance

type
	- the type of this connection point (#anchor, #action, etc.)

uiDelegate
	- the Block this connectionPoint is from

"
Class {
	#name : #SKBlockConnectionPoint,
	#superclass : #Object,
	#instVars : [
		'uiDelegate',
		'connectedPoint',
		'type'
	],
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:22'
}

{
	#category : #connecting,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKBlockConnectionPoint >> connectTo: aConnectionPoint [

	(self == aConnectionPoint) ifTrue: [^ self].
	(self connectedPoint == aConnectionPoint) ifTrue: [^ self].
	
	self disconnect.
	aConnectionPoint disconnect.
	
	self connectedPoint: aConnectionPoint.
	aConnectionPoint connectedPoint: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKBlockConnectionPoint >> connectedPoint [

	^ connectedPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKBlockConnectionPoint >> connectedPoint: aConnectionPoint [

	connectedPoint := aConnectionPoint
]

{
	#category : #connecting,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKBlockConnectionPoint >> disconnect [

	| oldConnectedPoint |
	
	self isConnected ifFalse: [^ self].
	
	oldConnectedPoint := self connectedPoint.
	self connectedPoint: nil.
	oldConnectedPoint disconnect
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKBlockConnectionPoint >> dist: anotherBlockConnectionPoint [

	^ self position dist: (anotherBlockConnectionPoint position)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKBlockConnectionPoint >> isConnected [

	^ connectedPoint isNil not
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKBlockConnectionPoint >> position [

	^ self uiDelegate connectionPointPositionForType: self type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:02'
}
SKBlockConnectionPoint >> type [

	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:02'
}
SKBlockConnectionPoint >> type: aType [

	type := aType
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:02'
}
SKBlockConnectionPoint >> uiDelegate [

	^ uiDelegate
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:02'
}
SKBlockConnectionPoint >> uiDelegate: aMorph [

	uiDelegate := aMorph
]
