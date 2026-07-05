"
A SKBlockEditor is the Space in which SKBlocks can be placed. It also keeps track of all functions and variables and is the access point for the SKEnvironment to retrieve the code to be executed

Instance Variables
	functionStarts:		<Object>
	isWatchingChanges:		<Object>
	startBlock:		<Object>
	variables:		<Object>
	window:		<Object>

functionStarts
	- a Dictionary of Sets including all names of functionStarts that are placed in this instance

isWatchingChanges
	- boolean wether the BlockEditor rescales when the window size is changed

startBlock
	- the initial startingPoint of a Program written inside this instance

variables
	- a set of all variables used inside this instances' Program

window
	- the system window surrounding this instance

"
Class {
	#name : #SKBlockEditor,
	#superclass : #Morph,
	#instVars : [
		'startBlock',
		'window',
		'functionStarts',
		'isWatchingChanges',
		'variables',
		'blockMax'
	],
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:28'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/24/2026 20:00'
}
SKBlockEditor >> blockMax [

	^ blockMax ifNil:[^ 15]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/24/2026 20:00'
}
SKBlockEditor >> blockMax: aNumber [

	blockMax := aNumber
]

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
	#'squeak_changestamp' : 'FR 7/3/2026 02:48'
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
		yourself.
	pane scroller addMorph: source.
	pane adjustLayoutBounds.

	^ pane
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 7/3/2026 02:27'
}
SKBlockEditor >> buildWindowWithSourceWidth: aNumber [

	^ RectangleMorph new
		borderWidth: 0;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		color: Color transparent;
		extent: ((aNumber * 4) min: World width * 0.75) @ ((aNumber * 3) min: World height * 0.75);
		yourself
]

{
	#category : #resizing,
	#'squeak_changestamp' : 'FR 7/3/2026 14:31'
}
SKBlockEditor >> expandIfNeededToInclude: aRectangle [

	| newExtent |
	
	newExtent := self extent.
	(aRectangle right > newExtent x) ifTrue: [newExtent := aRectangle right @ newExtent y].
	(aRectangle left < 0) ifTrue: [
		self shiftSubmorphsBy: (aRectangle left abs @ 0).
		self scroller offset: (self scroller offset x + aRectangle left abs @ (self scroller offset y)).
		newExtent := (newExtent x - aRectangle left) @ newExtent y].
	(aRectangle bottom > newExtent y) ifTrue: [newExtent := newExtent x @ aRectangle bottom + SKBlockStyle blockPartHeight].
	(aRectangle top < 0) ifTrue: [
		self shiftSubmorphsBy: (0 @ aRectangle top abs).
		self scroller offset:( self scroller offset x @ (self scroller offset y + aRectangle top abs)).
		newExtent := newExtent x @ (newExtent y - aRectangle top) ].
	newExtent = self extent ifTrue: [^self].
	self extent: newExtent.
	self layoutChanged
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 02:36'
}
SKBlockEditor >> functionStartWithName: aString [

	(self functionStarts at: aString ifAbsent: [self error: 'The called function is not defined.'.]) isEmpty
		ifTrue:[self error: 'The called function is not defined.'.].
		
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
	#'squeak_changestamp' : 'FR 6/30/2026 00:55'
}
SKBlockEditor >> getCode [

	| code |
	
	code:= '| '.
	self variables do: [:each | code:= code, each, ' '].
	code := code,' |', String cr,  self startBlock getCode.
	
	^ code
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
	#category : #'submorphs - tracking',
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
	#'squeak_changestamp' : 'FR 7/3/2026 02:30'
}
SKBlockEditor >> ownerChanged [

	super ownerChanged.
	self isWatchingChanges ifFalse: [^self].
	self expandIfNeededToInclude: self owner innerBounds;
		refreshBlockCount
	
]

{
	#category : #'submorphs - tracking',
	#'squeak_changestamp' : 'FR 6/29/2026 20:40'
}
SKBlockEditor >> refreshBlockCount [

	| result |
	
	result := self startBlock blockCount - 1.
	self functionStarts keysDo: [:key | result := (self functionStartWithName: key) blockCount + result].
	self setBlockCountDisplay: result
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 14:05'
}
SKBlockEditor >> scroller [

	^ self owner
]

{
	#category : #'submorphs - tracking',
	#'squeak_changestamp' : 'FR 6/29/2026 20:40'
}
SKBlockEditor >> setBlockCountDisplay: aNumber [
	
	aNumber > self blockMax ifTrue:[(self startBlock blockParts at: 2) defaultUIEntry color: Color red]
		ifFalse:[(self startBlock blockParts at: 2) defaultUIEntry color: Color black].
	(self startBlock blockParts at: 2) setDefaultUIText: aNumber asString, ' / ', self blockMax asString
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/24/2026 19:56'
}
SKBlockEditor >> startBlock [

	^ startBlock ifNil: [startBlock := SKActionBlock new
		addLabel: 'Start of Script';
		addStringPartWithText: '0 / 15';
		isStart: true;
		leftSource: false;
		yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 15:21'
}
SKBlockEditor >> startBlock: aSKBlock [

	startBlock := aSKBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/30/2026 00:49'
}
SKBlockEditor >> variables [

	^ variables ifNil: [variables := Set new. ^ variables]
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'FR 6/24/2026 19:34'
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
