Class {
	#name : #SKBlockEditor,
	#superclass : #Morph,
	#instVars : [
		'startBlock',
		'window',
		'functionStarts',
		'isWatchingChanges'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/24/2026 02:53'
}
SKBlockEditor >> buildContainerWindow [

	| container pane sourcePane window |
	
	sourcePane := self buildSourcePane.
	sourcePane fullBounds.
	container := self buildWindowWithSourceWidth: sourcePane width.
	self width: container width - sourcePane width - 10.
	pane := self buildEditorPane.
	container
		addMorph: pane;
		addMorph: sourcePane.
	window := container openInWindowLabeled: 'Block Editor'.
	window setWindowColor: SKStylesheet primaryColor;
			minimumExtent: window extent.
	^ window
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/24/2026 02:47'
}
SKBlockEditor >> buildEditorPane [

	| pane |
	pane := ScrollPane new
			color: Color transparent;
			borderWidth: 0;
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			vScrollBarPolicy: #always;
			hScrollBarPolicy: #always;
			yourself.
	pane scroller addMorph: self.
	
	^ pane
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/24/2026 02:35'
}
SKBlockEditor >> buildSourcePane [
	
	| pane source |

	source := SKBlockSource new.
	pane := ScrollPane new
		color: Color transparent;
		borderWidth: 0;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		vScrollBarPolicy: #always;
		"extent: self sourcePaneWidth @ self minHeight;"
		yourself.
	pane scroller addMorph: source.
	pane adjustLayoutBounds.

	^ pane
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/24/2026 02:45'
}
SKBlockEditor >> buildWindowWithSourceWidth: aNumber [

	^ RectangleMorph new
		borderWidth: 0;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		color: Color transparent;
		extent: ((aNumber * 4) min: World width * 0.75) @ ((aNumber * 3) min: World height * 0.75);
		yourself.
]

{
	#category : #resizing,
	#'squeak_changestamp' : 'FR 6/24/2026 01:29'
}
SKBlockEditor >> expandIfNeededToInclude: aRectangle [

	| newExtent |
	
	newExtent := self extent.
	(aRectangle right > newExtent x) ifTrue: [newExtent := aRectangle right @ newExtent y].
	(aRectangle left < 0) ifTrue: [
		self offset: (self offset x + aRectangle left) @ self offset y.
		newExtent := (newExtent x - aRectangle left) @ newExtent y].
	(aRectangle bottom > newExtent y) ifTrue: [newExtent := newExtent x @ aRectangle bottom].
	(aRectangle top < 0) ifTrue: [
		self offset: self offset x @ (self offset y + aRectangle top).
		newExtent := newExtent x @ (newExtent y - aRectangle top) ].
	newExtent ~= self extent ifTrue: [
		self extent: newExtent.
		self layoutChanged.]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/24/2026 03:59'
}
SKBlockEditor >> functionStartWithName: aString [

	(self functionStarts at: aString ifAbsent: [self error: 'The called function is not defined.'.]) isEmpty ifTrue:[self error: 'The called function is not defined.'.].
	 ^ (self functionStarts at: aString) anyOne
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
	#'squeak_changestamp' : 'FR 6/24/2026 01:57'
}
SKBlockEditor >> initialize [

	super initialize.
	
	self color: Color white.

	self addMorph: (self startBlock center: self center).
	self startBlock updateLayout
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/24/2026 01:48'
}
SKBlockEditor >> isWatchingChanges [

	^ isWatchingChanges ifNil: [^ false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/24/2026 01:48'
}
SKBlockEditor >> isWatchingChanges: aBoolean [

	isWatchingChanges := aBoolean
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
	#'squeak_changestamp' : 'FR 6/24/2026 02:51'
}
SKBlockEditor >> open [

	self window: self buildContainerWindow.
	self startBlock fullBounds;
		align: self startBlock topCenter
		with: self topCenter + (0 @ SKBlockStyle unit * 5).
	self window layoutChanged.
	self layoutChanged.
	self isWatchingChanges: true.
		
	^ self window
]

{
	#category : #resizing,
	#'squeak_changestamp' : 'FR 6/24/2026 01:49'
}
SKBlockEditor >> ownerChanged [

	super ownerChanged.
	self isWatchingChanges ifTrue: [self expandIfNeededToInclude: self owner innerBounds]
	
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
