Class {
	#name : #SKBlockEditor,
	#superclass : #Morph,
	#instVars : [
		'kara',
		'environment',
		'dropIndex',
		'controller',
		'startBlock'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 00:52'
}
SKBlockEditor class >> open [
	| editor window |
	
	editor := self new.
	
	window := RectangleMorph new
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		yourself.

	window
		addMorph: editor;
		addMorph: SKBlockSource new.

	window openInWindowLabeled: 'Block Editor'.

	editor startBlock
		align: editor startBlock topCenter
		with: editor topCenter + (0 @ 10).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 00:56'
}
SKBlockEditor >> initialize [
	super initialize.
	
	self minWidth: 500;
		minHeight: 500;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: (Color r: 0.8 g: 1 b: 0.8).

	self addMorph: self startBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 03:09'
}
SKBlockEditor >> startBlock [

	^ startBlock ifNil: [startBlock := SKActionBlock new addLabel: 'Start of Script'; isStart: true; leftSource: true; yourself].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/2/2026 20:51'
}
SKBlockEditor >> wantsDroppedMorph: aMorph event: anEvent [

	^ ((aMorph class = SKBlock) or: [aMorph class inheritsFrom: SKBlock]).
]
