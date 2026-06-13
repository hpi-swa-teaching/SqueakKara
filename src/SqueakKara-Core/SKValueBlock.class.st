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
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKValueBlock >> blockType [

	^ #Value
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKValueBlock >> connectionPointPositionForType: aConnectionPointType [

	^ self leftCenter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKValueBlock >> getCode [

	| args |
	
	args := (self blockParts select: [:each | each type ~~ #Label]) collect: [:each | each value asString].
	
	^ self value valueWithArguments: args asArray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKValueBlock >> type [

	self subclassResponsibility
]

{
	#category : #snapping,
	#'squeak_changestamp' : 'FR 6/9/2026 00:16'
}
SKValueBlock >> validSnapConnectionsIn: anObject [

	| validConnections |

	validConnections := OrderedCollection new.

	anObject allMorphsDo: [:each |
		((each isKindOf: SKActionBlock) and: [
			((each hasOwner: self) not) and: [
				each ~= self]]) ifTrue: [
					validConnections addAll: (each valueConnectionPoints select: [:connection |
						((connection dist: self anchorPoint) < self snapRadius)])]].

	^ validConnections
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKValueBlock >> value [

	^ value
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:01'
}
SKValueBlock >> value: aBlockClosure [

	value := aBlockClosure
]
