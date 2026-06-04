Class {
	#name : #SKValueBlock,
	#superclass : #SKBlock,
	#instVars : [
		'value'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 16:03'
}
SKValueBlock >> blockType [

	^ #Value.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 20:47'
}
SKValueBlock >> connectionPointPositionForType: aConnectionPointType [

	^ self leftCenter.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 18:02'
}
SKValueBlock >> type [

	^ SubclassResponsibility.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 22:42'
}
SKValueBlock >> validSnapConnectionsIn: anObject [

	| validConnections snapRadius |

	validConnections := OrderedCollection new.
	snapRadius := 20.

	anObject allMorphsDo: [:each |
		((each isKindOf: SKActionBlock) and: [
			((each hasOwner: self) not) and: [
				each ~= self]]) ifTrue: [
					Transcript show: 'connection points for ', each, ': ', (each valueConnectionPoints select: [:connection |
						((connection dist: self anchorPoint) < 20)]), String cr.
					validConnections addAll: (each valueConnectionPoints select: [:connection |
						((connection dist: self anchorPoint) < 20)])]].

	Transcript show: 'valid connections: ', validConnections, String cr.
	^ validConnections
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 12:41'
}
SKValueBlock >> value [

	^ value.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 12:43'
}
SKValueBlock >> value: aString [

	value := aString.
]
