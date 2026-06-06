Class {
	#name : #SKBlockConnectionPoint,
	#superclass : #Object,
	#instVars : [
		'uiDelegate',
		'connectedPoint',
		'type'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #connecting,
	#'squeak_changestamp' : 'SLH 6/4/2026 19:43'
}
SKBlockConnectionPoint >> connectTo: aConnectionPoint [

	(self == aConnectionPoint) ifTrue: [^ self].
	(self connectedPoint == aConnectionPoint) ifTrue: [^ self].
	
	self disconnect.
	aConnectionPoint disconnect.
	
	self connectedPoint: aConnectionPoint.
	aConnectionPoint connectedPoint: self.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 19:08'
}
SKBlockConnectionPoint >> connectedPoint [

	^ connectedPoint.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 19:08'
}
SKBlockConnectionPoint >> connectedPoint: aConnectionPoint [

	connectedPoint := aConnectionPoint.
]

{
	#category : #connecting,
	#'squeak_changestamp' : 'SLH 6/4/2026 23:20'
}
SKBlockConnectionPoint >> disconnect [

	| oldConnectedPoint |
	
	self isConnected ifFalse: [^ self].
	
	oldConnectedPoint := self connectedPoint.
	self connectedPoint: nil.
	oldConnectedPoint disconnect.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 23:09'
}
SKBlockConnectionPoint >> dist: anotherBlockConnectionPoint [

	^ self position dist: (anotherBlockConnectionPoint position).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 19:10'
}
SKBlockConnectionPoint >> isConnected [

	^ connectedPoint isNil not.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 21:02'
}
SKBlockConnectionPoint >> position [

	^ self uiDelegate connectionPointPositionForType: self type.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:37'
}
SKBlockConnectionPoint >> type [

	^ type.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:38'
}
SKBlockConnectionPoint >> type: aType [

	type := aType.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 20:49'
}
SKBlockConnectionPoint >> uiDelegate [

	^ uiDelegate.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 20:49'
}
SKBlockConnectionPoint >> uiDelegate: aMorph [

	uiDelegate := aMorph.
]
