Class {
	#name : #SKBlockSpace,
	#superclass : #AlignmentMorph,
	#instVars : [
		'kara',
		'environment',
		'start',
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
	#'squeak_changestamp' : 'FR 5/20/2026 01:41'
}
SKBlockSpace >> acceptDroppingMorph: aMorph event: anEvent [
	self addMorph: aMorph atIndex: self dropIndex +1.
	self removeDropZone.
	self updateCode.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 01:07'
}
SKBlockSpace >> addDropZoneAtIndex: aNumber of: aMorph [
	| dropZone |
	(self dropIndex = aNumber or:[aNumber > self submorphCount and:[self dropIndex ~= nil]]) ifFalse:[
		self removeDropZone.
		dropZone := aMorph copy.
		"dropZone submorphs do: [:each | each color: Color gray]."
		dropZone submorphCount timesRepeat: [dropZone firstSubmorph delete]. "may not work with compound blocks but looks nicer for now"
		dropZone color: Color gray;
			borderColor: Color gray.
		self dropIndex: aNumber;
			privateAddMorph: dropZone
				atIndex: (aNumber).]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 16:22'
}
SKBlockSpace >> addStartBlock [
	self start: (SKBlock new label: 'Start of Script').
	self addMorph: self start.
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
	#'squeak_changestamp' : 'FR 5/20/2026 01:25'
}
SKBlockSpace >> handlesMouseMove: anEvent [
	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 01:20'
}
SKBlockSpace >> handlesMouseOver: anEvent [
	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 01:20'
}
SKBlockSpace >> handlesMouseOverDragging: anEvent [
	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 00:49'
}
SKBlockSpace >> initializeWithKara: aKara [
	super initialize.
	self listDirection: #topToBottom;
	hResizing: #spaceFill;
	wrapCentering: #center;
	cellPositioning: #topLeft;
	width: 500;
	height: 500;
	vResizing: #spaceFill;
	kara: aKara;
	openInWindowLabeled: 'SKBlockSpace'.
	SKBlockSource new.
	self addStartBlock

	
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
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 23:42'
}
SKBlockSpace >> start [
	^ start
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 23:42'
}
SKBlockSpace >> start: anObject [
	start := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 18:07'
}
SKBlockSpace >> updateCode [
	"this is obviously temporary"
	| code behind |
	code:= ''.
	behind := false.
	self flag: #temp.
	self submorphsBehind: self start do: [:each | behind
		ifFalse: [ each action ifNotNil: [code:= code, each command, '.',  String cr]]].
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
