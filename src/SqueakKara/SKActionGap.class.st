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
	#'squeak_changestamp' : 'FR 5/27/2026 03:58'
}
SKActionGap >> command [
	| code |
	code:= ''.
	self flag: #temp.
	self submorphs do: [:each | each action ifNotNil: [code:= code, each command, '.',  String cr]].
	^code
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 03:47'
}
SKActionGap >> hasStartBlock [
	^false
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/27/2026 09:46'
}
SKActionGap >> initialize [
	super initialize.
	self color: Color transparent.
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

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 03:51'
}
SKActionGap >> updateCode [
	(self ownerThatIsA: SKBlockSpace) ifNotNil: [(self ownerThatIsA: SKBlockSpace) updateCode]
]
