Class {
	#name : #SKValueBlock,
	#superclass : #SKBlock,
	#instVars : [
		'value',
		'type',
		'containingBlockPart'
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
	#'squeak_changestamp' : 'SLH 6/3/2026 01:48'
}
SKValueBlock >> connectionPoint [

	^ self leftCenter.
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
	#'squeak_changestamp' : 'SLH 6/3/2026 03:49'
}
SKValueBlock >> findClosestSnapTargetIn: anObject [

	| closestBlockPart shortestDistance currentDistance |

	shortestDistance := 20.
	closestBlockPart := nil.

	anObject allMorphsDo: [:each |
		(each isKindOf: SKInputSlotPart) ifTrue: [Transcript show: 'input found: ', each, ' with type: ', each type, String cr].
		((each isKindOf: SKInputSlotPart) 
			and: [each type = self type
				and: [each attachedBlock isNil
					and: [(each hasOwner: self) not]]]) ifTrue: [
						Transcript show: 'Candidate found: ', each, String cr.
						currentDistance := self connectionPoint dist: each connectionPoint.
						currentDistance < shortestDistance ifTrue: [
							shortestDistance := currentDistance.
							closestBlockPart := each]]].
	
	
	Transcript show: 'Done. found: ', closestBlockPart, String cr.

	^ closestBlockPart
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:50'
}
SKValueBlock >> snapToTarget: anInputSlotPart [

	Transcript show: 'Snapping to ', anInputSlotPart block, ' at ', anInputSlotPart, String cr.
	self align: self connectionPoint with: anInputSlotPart connectionPoint.
	anInputSlotPart acceptValueBlock: self.
	
	"self containingBlockPart: aBlockPart.
	aBlockPart value: self.
	
	self disableTableLayout: true.
	aBlockPart block vResizing: #rigid; hResizing: #rigid.
	aBlockPart addMorph: self.
	
	""Recursively tell all parent blocks to recalculate their fullBounds and redraw"
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
