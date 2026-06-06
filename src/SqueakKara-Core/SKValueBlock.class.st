Class {
	#name : #SKValueBlock,
	#superclass : #SKBlock,
	#instVars : [
		'value'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/13/2026 16:03'
}
SKValueBlock >> blockType [

	^ #Value.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 20:47'
}
SKValueBlock >> connectionPointPositionForType: aConnectionPointType [

	^ self leftCenter.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/6/2026 11:35'
}
SKValueBlock >> getCode [

	| args |
	
	args := (self blockParts select: [:each | each type ~~ #Label]) collect: [:each | each value asString].
	
	^ self value valueWithArguments: args asArray.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/6/2026 14:59'
}
SKValueBlock >> type [

	self subclassResponsibility.
]

{
	#category : #snapping,
	#'squeak_changestamp' : 'SLH 6/6/2026 02:01'
}
SKValueBlock >> validSnapConnectionsIn: anObject [

	| validConnections snapRadius |

	validConnections := OrderedCollection new.
	snapRadius := 20.

	anObject allMorphsDo: [:each |
		((each isKindOf: SKActionBlock) and: [
			((each hasOwner: self) not) and: [
				each ~= self]]) ifTrue: [
					validConnections addAll: (each valueConnectionPoints select: [:connection |
						((connection dist: self anchorPoint) < 20)])]].

	^ validConnections
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/13/2026 12:41'
}
SKValueBlock >> value [

	^ value.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/6/2026 11:11'
}
SKValueBlock >> value: aBlockClosure [

	value := aBlockClosure.
]
