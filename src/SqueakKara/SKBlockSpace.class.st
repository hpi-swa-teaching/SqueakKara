Class {
	#name : #SKBlockSpace,
	#superclass : #AlignmentMorph,
	#instVars : [
		'kara',
		'environment',
		'dropIndex'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 15:21'
}
SKBlockSpace class >> newWithKara: aKara [
	^ self basicNew initializeWithKara: aKara.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 03:57'
}
SKBlockSpace >> acceptDroppingMorph: aMorph event: anEvent [
	self addMorph: aMorph atIndex: self dropIndex+1.
	self removeDropZone.
	self updateCode.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 03:55'
}
SKBlockSpace >> addDropZoneAtIndex: aNumber of: aMorph [
	| dropZone newIndex|
	(self dropIndex = aNumber or:[aNumber > self submorphCount and:[self dropIndex ~= nil]]) ifFalse:[
		newIndex := aNumber.
		aNumber = 1 ifTrue:[newIndex:= 2].
		self removeDropZone.
		dropZone := aMorph copy.
		"dropZone submorphs do: [:each | each color: Color gray]."
		dropZone submorphCount timesRepeat: [dropZone firstSubmorph delete]. "may not work with compound blocks but looks nicer for now"
		dropZone color: Color gray;
			borderColor: Color gray.
		self dropIndex: newIndex;
			privateAddMorph: dropZone
				atIndex: (newIndex).]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/19/2026 15:39'
}
SKBlockSpace >> dropIndex [
	^ dropIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/19/2026 16:52'
}
SKBlockSpace >> dropIndex: aNumber [
	dropIndex := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 23:39'
}
SKBlockSpace >> environment [
	^ environment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 23:39'
}
SKBlockSpace >> environment: anObject [
	environment := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 02:38'
}
SKBlockSpace >> handlesMouseMove: anEvent [
	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 02:25'
}
SKBlockSpace >> handlesMouseOver: anEvent [
	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 02:25'
}
SKBlockSpace >> handlesMouseOverDragging: anEvent [
	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/26/2026 21:43'
}
SKBlockSpace >> initializeWithKara: aKara [

	| window |

	super initialize.
	
	window := RectangleMorph new
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		yourself.
	
	super initialize.
	self listDirection: #topToBottom;
	hResizing: #spaceFill;
	wrapCentering: #center;
	cellPositioning: #topLeft;
	cellGap: -12;
	minWidth: 500;
	minHeight: 500;
	vResizing: #spaceFill;
	kara: aKara.
	self addMorph: (SKActionBlock new label: 'Start of Script'; isStart: true; yourself).
	
	window addMorph: self.
	window addMorph: SKBlockSource new.
	window openInWindowLabeled: 'SKBlockSource'
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 15:17'
}
SKBlockSpace >> kara [
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 15:17'
}
SKBlockSpace >> kara: anObject [
	kara := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/19/2026 16:42'
}
SKBlockSpace >> mouseLeave: anEvent [
	self removeDropZone.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 01:21'
}
SKBlockSpace >> mouseLeaveDragging: anEvent [
	self removeDropZone.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 01:25'
}
SKBlockSpace >> mouseMove: anEvent [
| grabbedMorph layout |
	anEvent hand submorphCount = 1 ifTrue:[
		grabbedMorph := anEvent hand firstSubmorph.
		(self wantsDroppedMorph: grabbedMorph event: anEvent) ifFalse: [^self].
		layout := self layoutPolicy.
		self addDropZoneAtIndex: (layout indexForInserting: grabbedMorph at: anEvent position in: self) of: grabbedMorph
		]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 22:28'
}
SKBlockSpace >> objectHeight [
	^40
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/19/2026 15:55'
}
SKBlockSpace >> removeDropZone [
	self dropIndex ifNotNil:[
		(self submorphs at: self dropIndex) delete.
		self dropIndex: nil.
		]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 04:43'
}
SKBlockSpace >> updateCode [
	"this is obviously temporary"
	| code |
	code:= ''.
	self flag: #temp.
	self submorphsBehind: (self firstSubmorph) do: [:each | each action ifNotNil: [code:= code, each command, '.',  String cr]].
	self environment workspace userCode: code.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/19/2026 15:58'
}
SKBlockSpace >> wantsDroppedMorph: aMorph event: anEvent [
	self flag: #toBeExtended.
	^((aMorph class = SKBlock) or: [SKBlock subclasses includes: aMorph class]) and: [aMorph blockType = #Action].
	 
]
