Class {
	#name : #SKBlockEditor,
	#superclass : #Morph,
	#instVars : [
		'startBlock',
		'window'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/6/2026 14:37'
}
SKBlockEditor >> getCode [

	^ self startBlock getCode.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'SLH 6/6/2026 00:56'
}
SKBlockEditor >> initialize [
	super initialize.
	
	self minWidth: 500;
		minHeight: 500;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: (Color r: 0.8 g: 1 b: 0.8).

	self addMorph: self startBlock.
	self startBlock updateLayout.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/6/2026 15:23'
}
SKBlockEditor >> open [
	| window |
	
	window := RectangleMorph new
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		yourself.

	window
		addMorph: self;
		addMorph: SKBlockSource new.

	self window: (window openInWindowLabeled: 'Block Editor').

	self startBlock
		fullBounds;
		align: self startBlock topCenter
		with: self topCenter + (0 @ 10).
		
	^ self window.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/6/2026 00:56'
}
SKBlockEditor >> startBlock [

	^ startBlock ifNil: [startBlock := SKActionBlock new
		addLabel: 'Start of Script';
		isStart: true;
		leftSource: true;
		yourself].
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'SLH 6/2/2026 20:51'
}
SKBlockEditor >> wantsDroppedMorph: aMorph event: anEvent [

	^ ((aMorph class = SKBlock) or: [aMorph class inheritsFrom: SKBlock]).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/6/2026 14:44'
}
SKBlockEditor >> window [

	^ window.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/6/2026 14:44'
}
SKBlockEditor >> window: aWindow [

	window := aWindow.
]
