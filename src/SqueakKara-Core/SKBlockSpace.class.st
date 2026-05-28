Class {
	#name : #SKBlockSpace,
	#superclass : #AlignmentMorph,
	#instVars : [
		'kara',
		'environment',
		'dropIndex',
		'controller'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:41'
}
SKBlockSpace class >> newWithController: aController [

	^ self basicNew startBlockEdit;
		controller: aController
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:40'
}
SKBlockSpace class >> startBlockEdit: anEnvironment [

	^ self basicNew startBlockEdit
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:16'
}
SKBlockSpace >> acceptDroppingMorph: aMorph event: anEvent [

	self addMorph: aMorph atIndex: self dropIndex+1.
	self removeDropZone.
	self updateCode.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 10:20'
}
SKBlockSpace >> addDropZoneAtIndex: aNumber of: aMorph [

	| dropZone newIndex|
	
	(self dropIndex = aNumber or:[aNumber > self submorphCount and:[self dropIndex ~= nil]]) ifFalse:[
		newIndex := aNumber.
		(aNumber = 1 and: [self hasStartBlock]) ifTrue:[newIndex:= 2].
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
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:39'
}
SKBlockSpace >> controller [

	^ controller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:39'
}
SKBlockSpace >> controller: aController [

	controller := aController
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
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:39'
}
SKBlockSpace >> environment [

	^ controller environment
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 10:20'
}
SKBlockSpace >> handlesMouseMove: anEvent [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 10:20'
}
SKBlockSpace >> handlesMouseOver: anEvent [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 10:20'
}
SKBlockSpace >> handlesMouseOverDragging: anEvent [

	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 03:47'
}
SKBlockSpace >> hasStartBlock [
	
	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 03:13'
}
SKBlockSpace >> initialize [

	super initialize.
	self listDirection: #topToBottom;
	hResizing: #spaceFill;
	wrapCentering: #center;
	cellPositioning: #topLeft;
	cellGap: -10;
	minWidth: 50;
	minHeight: 32;
	vResizing: #spaceFill.
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
	#'squeak_changestamp' : 'FR 5/27/2026 03:28'
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
	#'squeak_changestamp' : 'FR 5/27/2026 02:38'
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
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 10:21'
}
SKBlockSpace >> removeDropZone [

	self dropIndex ifNotNil:[
		(self submorphs at: self dropIndex) delete.
		self dropIndex: nil.
		self layoutChanged]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 09:35'
}
SKBlockSpace >> startBlockEdit [

	| window |

	super initialize.
	
	window := RectangleMorph new
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		yourself.
	
	self listDirection: #topToBottom;
	hResizing: #spaceFill;
	wrapCentering: #center;
	cellPositioning: #topLeft;
	cellGap: -10;
	minWidth: 500;
	minHeight: 500;
	vResizing: #spaceFill.
	self addMorph: (SKActionBlock new label: 'Start of Script'; isStart: true; yourself).
	
	window addMorph: self.
	window addMorph: SKBlockSource new.
	window openInWindowLabeled: 'Block Editor'
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 10:20'
}
SKBlockSpace >> updateCode [

	| code |
	
	code:= ''.
	self submorphsBehind: (self firstSubmorph) do: [:each | each action ifNotNil: [code:= code, each command, '.',  String cr]].
	self controller code: code
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 10:21'
}
SKBlockSpace >> wantsDroppedMorph: aMorph event: anEvent [

	self flag: #toBeExtended.
	^((aMorph class = SKBlock) or: [aMorph class inheritsFrom: SKBlock]) and: [aMorph blockType = #Action].
	 
]
