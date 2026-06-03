Class {
	#name : #SKActionGap,
	#superclass : #SKBlockSpace,
	#instVars : [
		'command'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 03:47'
}
SKActionGap >> hasStartBlock [
	^false
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/2/2026 20:57'
}
SKActionGap >> initialize [
	super initialize.
	self color: Color transparent;
		wrapCentering: #left;
		vResizing: #shrinkWrap;
		minHeight: 20.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 03:35'
}
SKActionGap >> mouseEnter: anEvent [

	(self ownerThatIsA: SKBlockSpace) ifNotNil: [(self ownerThatIsA: SKBlockSpace) removeDropZone]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 03:53'
}
SKActionGap >> mouseEnterDragging: anEvent [

	(self ownerThatIsA: SKBlockSpace) ifNotNil: [(self ownerThatIsA: SKBlockSpace) removeDropZone]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 04:01'
}
SKActionGap >> mouseMove: anEvent [

	(self ownerThatIsA: SKBlockSpace) ifNotNil: [(self ownerThatIsA: SKBlockSpace) removeDropZone].
	^super mouseMove: anEvent.
]
