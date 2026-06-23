Class {
	#name : #SKBlockEditor,
	#superclass : #Morph,
	#instVars : [
		'startBlock',
		'window',
		'functionStarts'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/23/2026 17:03'
}
SKBlockEditor >> buildSourcePane [
	
	| pane source |

	source := SKBlockSource new.
	pane := ScrollPane new
		color: Color transparent;
		borderWidth: 0;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		"extent: self sourcePaneWidth @ self minHeight;"
		yourself.
	pane scroller addMorph: source.

	^ pane
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 20:03'
}
SKBlockEditor >> functionStarts [

	^ functionStarts ifNil: [functionStarts := Dictionary new. ^functionStarts]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:02'
}
SKBlockEditor >> getCode [

	^ self startBlock getCode
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/23/2026 19:04'
}
SKBlockEditor >> initialize [

	super initialize.
	
	self minWidth: 500;
		minHeight: 500;
		"hResizing: #shrinkWrap;"
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		"color: (Color r: 0.8 g: 1 b: 0.8)."
		color: Color white.

	self addMorph: self startBlock.
	self startBlock updateLayout
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 23:09'
}
SKBlockEditor >> nextAvailableFunctionNameFor: aString [

	| counter newKey |
	
	counter := 1.
	newKey := aString, ' ', counter asString.
	[self functionStarts includesKey: newKey] whileTrue: [
		counter := counter + 1.
		newKey := aString, ' ', counter asString.
	].
	^ newKey
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/23/2026 18:52'
}
SKBlockEditor >> open [

	| window |
	
	window := RectangleMorph new
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		color: Color transparent;
		yourself.

	window
		addMorph: self;
		addMorph: self buildSourcePane.

	self window: (window openInWindowLabeled: 'Block Editor').
	self window setWindowColor: SKStylesheet primaryColor.
	self window minimumExtent: self window extent.

	self startBlock
		fullBounds;
		align: self startBlock topCenter
		with: self topCenter + (0 @ 10).
		
	^ self window
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/23/2026 19:03'
}
SKBlockEditor >> startBlock [

	^ startBlock ifNil: [startBlock := SKActionBlock new
		addLabel: 'Start of Script';
		isStart: true;
		leftSource: false;
		yourself]
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'FR 6/9/2026 00:02'
}
SKBlockEditor >> wantsDroppedMorph: aMorph event: anEvent [

	^ ((aMorph class = SKBlock) or: [aMorph class inheritsFrom: SKBlock])
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:02'
}
SKBlockEditor >> window [

	^ window
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:02'
}
SKBlockEditor >> window: aWindow [

	window := aWindow
]
