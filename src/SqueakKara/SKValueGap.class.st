Class {
	#name : #SKValueGap,
	#superclass : #SKBlockSpace,
	#instVars : [
		'command'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 10:14'
}
SKValueGap >> command [
	| code |
	code:= ''.
	self flag: #temp.
	self submorphs do: [:each | each action ifNotNil: [code:= code, each command, '.',  String cr]].
	^code
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 10:14'
}
SKValueGap >> hasStartBlock [
	^false
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 10:15'
}
SKValueGap >> initialize [
	super initialize.
	self color: Color transparent.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 10:15'
}
SKValueGap >> mouseEnter: anEvent [

	(self ownerThatIsA: SKBlockSpace) ifNotNil: [(self ownerThatIsA: SKBlockSpace) removeDropZone]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 10:15'
}
SKValueGap >> mouseEnterDragging: anEvent [

	(self ownerThatIsA: SKBlockSpace) ifNotNil: [(self ownerThatIsA: SKBlockSpace) removeDropZone]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 10:15'
}
SKValueGap >> mouseMove: anEvent [

	(self ownerThatIsA: SKBlockSpace) ifNotNil: [(self ownerThatIsA: SKBlockSpace) removeDropZone].
	^super mouseMove: anEvent.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 10:15'
}
SKValueGap >> updateCode [
	(self ownerThatIsA: SKBlockSpace) ifNotNil: [(self ownerThatIsA: SKBlockSpace) updateCode]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 10:15'
}
SKValueGap >> wantsDroppedMorph: aMorph event: anEvent [

	self flag: #toBeExtended.
	^((aMorph class = SKBlock) or: [aMorph class inheritsFrom: SKBlock]) and: [aMorph blockType = #Value].
	 
]
