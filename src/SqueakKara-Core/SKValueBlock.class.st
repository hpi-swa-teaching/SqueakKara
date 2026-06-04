Class {
	#name : #SKValueBlock,
	#superclass : #SKBlock,
	#instVars : [
		'value',
		'type',
		'containingBlockPart',
		'connectionPoint'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 11:34'
}
SKValueBlock >> attachToAnchor: aConnectionPoint [

	self containingBlockPart ifNotNil: [
		Transcript show: 'Detaching ', self, ' from ', self containingBlockPart, String cr.
		self containingBlockPart restoreDefault.
		self containingBlockPart: nil].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/13/2026 16:03'
}
SKValueBlock >> blockType [

	^ #Value.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 10:53'
}
SKValueBlock >> connectionPoint [

	^ connectionPoint ifNil: [connectionPoint := SKBlockConnectionPoint new
		block: self;
		type: (self type);
		positionCalculation: [self leftCenter]].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 02:14'
}
SKValueBlock >> containingBlockPart [

	^ containingBlockPart.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 02:15'
}
SKValueBlock >> containingBlockPart: aBlockPart [

	containingBlockPart := aBlockPart.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 11:29'
}
SKValueBlock >> detachFromControllingBlock [

	self containingBlockPart ifNotNil: [
		Transcript show: 'Detaching ', self, ' from ', self containingBlockPart, String cr.
		self containingBlockPart restoreDefault.
		self containingBlockPart: nil].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 10:46'
}
SKValueBlock >> snapAnchor [

	^ self connectionPoint.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 15:49'
}
SKValueBlock >> snapToTarget: aConnectionPoint [

	| block blockPart |
	
	block := aConnectionPoint block.
	blockPart := aConnectionPoint blockPart.
	
	"((self type = #Action) and: [self isStart]) ifTrue: [Transcript show: 'Snapping disabled for start blocks', String cr. ^ self]."
	Transcript show: 'Snapping to ', block, ' at ', aConnectionPoint, String cr.
	self align: (self snapAnchor position) with: (aConnectionPoint position).
	
	self containingBlockPart: blockPart.
	blockPart attachedBlock: self.
	
	self disableTableLayout: true.
	block vResizing: #rigid; hResizing: #rigid.
	block addMorph: self.
	
	"Recursively tell all parent blocks to recalculate their fullBounds and redraw"
	self withAllOwnersDo: [ :each | 
		(each isKindOf: Morph) ifTrue: [
			each layoutChanged.
			each changed.
		].
	].
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
	#'squeak_changestamp' : 'SLH 6/4/2026 10:51'
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
						((connection dist: self snapAnchor) < 20)]), String cr.
					validConnections addAll: (each valueConnectionPoints select: [:connection |
						((connection dist: self snapAnchor) < 20) and: [
							connection connectedBlock isNil]])]].

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
