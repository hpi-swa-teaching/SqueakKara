Class {
	#name : #SKProgrammingUIMeelyStateMachine,
	#superclass : #SystemWindow,
	#instVars : [
		'playGround',
		'mode',
		'selectedNode',
		'buttons'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:29'
}
SKProgrammingUIMeelyStateMachine >> actionAddEdgeFrom: aNode to: anotherNode [

	| edge |

	edge := SKMeelyEdge newFrom: aNode to: anotherNode.
	self playGround addEdge: edge.
	
	aNode addDependent: edge.
	anotherNode addDependent: edge.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:57'
}
SKProgrammingUIMeelyStateMachine >> actionCreateNode [

	| node |
	node := SKMeelyNode new.
	self playGround addNode: node.
	node openInHand
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 13:04'
}
SKProgrammingUIMeelyStateMachine >> actionDeleteEdge: aEdge [

	self playGround removeEdge: aEdge.
	aEdge delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:42'
}
SKProgrammingUIMeelyStateMachine >> actionDeleteNode: aNode [

	| belongingEdges |
	belongingEdges := OrderedCollection new.
	belongingEdges
		addAll: (self playGround findAllEdgesToNode: aNode);
		addAll: (self playGround findAllEdgesFromNode: aNode).
	belongingEdges  do: [:edge | 
		self playGround removeEdge: edge.
		edge delete].
		
	self playGround removeNode: aNode.
	aNode delete
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:52'
}
SKProgrammingUIMeelyStateMachine >> addButton: aButton [

	self buttons add: aButton
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:48'
}
SKProgrammingUIMeelyStateMachine >> buildButtonForMode: aMode withLabel: aString [

	^ self buildButtonWithActionSelector: #toggleMode: arguments: { aMode } label: aString
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:47'
}
SKProgrammingUIMeelyStateMachine >> buildButtonWithActionSelector: aActionSelector arguments: aArgumentCollection label: aString [

	| button |

	button := SimpleButtonMorph new
		label: aString;
		extent: self modeButtonSize;
		color: self modeButtonNormalColor;
		target: self;
		actionSelector: aActionSelector;
		arguments: aArgumentCollection.
	^ button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:52'
}
SKProgrammingUIMeelyStateMachine >> buttons [

	^ buttons ifNil: [buttons := OrderedCollection new]
]

{
	#category : #modes,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:19'
}
SKProgrammingUIMeelyStateMachine >> colorAllModeButtonsNormal [

	self buttons do: [:button| button color: self modeButtonNormalColor]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 13:18'
}
SKProgrammingUIMeelyStateMachine >> findeEdgeToDelete: aPosition [

	| edge distance limit |
	
	"max distance from the line where it will be clicked"
	limit := 200.
	
	edge := self playGround findNearestEdge: aPosition.
	distance := edge fromNode position dist: aPosition.
	
	distance <= limit ifTrue: [self actionDeleteEdge: edge]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:24'
}
SKProgrammingUIMeelyStateMachine >> handleEdgeModeNodeClick: aNode [

	self selectedNode = aNode ifTrue: [
		self selectedNode: nil.
		^ nil].
	
	self selectedNode ifNotNil: [
		self actionAddEdgeFrom: self selectedNode to: aNode.
		self selectedNode: nil.
		^ nil].
	
	self selectedNode: aNode
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:02'
}
SKProgrammingUIMeelyStateMachine >> initialize [

	super initialize.
	
	self	openInHand; 
		extent: 1500 @ 1000;
		paneColor: Color white;
		setLabel: self windowTitle.
	
	self playGround
			extent: 1400@900;
			color: Color white;
			position: (self position + (50@100)).
	self addMorph: self playGround.
			
	self initializeButtons.
	self toggleMode: #drag
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:01'
}
SKProgrammingUIMeelyStateMachine >> initializeButtons [
	
	| container |
	
	container := AlignmentMorph newColumn.
	container 
		position: (self position + (1100 @ 50));
		cellInset: self modeButtonVerticalDistance.
	container
		addMorph: self initilazieActionButtons;
		addMorph: self initializeModeButtons.
	self addMorph: container
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:55'
}
SKProgrammingUIMeelyStateMachine >> initializeModeButtons [

	| container modeLabels button |
	
	container := AlignmentMorph newColumn.
	container 
		cellInset: self modeButtonVerticalDistance;
		color: Color transparent.
	
	modeLabels := self modeLables.
	
	self modes do: [:mode | 
		button := self buildButtonForMode: mode withLabel: (modeLabels at: mode).
		self addButton: button.
		container addMorph:  button].
	
	^ container
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:57'
}
SKProgrammingUIMeelyStateMachine >> initilazieActionButtons [

	| container |
	
	container := AlignmentMorph newColumn.
	container 
		cellInset: self modeButtonVerticalDistance;
		color: Color transparent.
	container addMorph: (self buildButtonWithActionSelector: #actionCreateNode arguments: {} label: 'Create Node').
	^ container
]

{
	#category : #modes,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:24'
}
SKProgrammingUIMeelyStateMachine >> markModeButtonSelected: aMode [

	| selectedButton buttonLabel |
	
	buttonLabel := self modeLables at: aMode.
	selectedButton := self buttons detect: [:button| button label = buttonLabel].
	selectedButton color: self modeButtonSelectedColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:22'
}
SKProgrammingUIMeelyStateMachine >> mode [

	^ mode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:22'
}
SKProgrammingUIMeelyStateMachine >> mode: aMode [

	mode := aMode
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:16'
}
SKProgrammingUIMeelyStateMachine >> modeButtonNormalColor [

	^ Color fromString: '#a6d189'
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:17'
}
SKProgrammingUIMeelyStateMachine >> modeButtonSelectedColor [

	^ Color fromString: '#8caaee'
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:05'
}
SKProgrammingUIMeelyStateMachine >> modeButtonSize [

	^ 250 @ 69
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:14'
}
SKProgrammingUIMeelyStateMachine >> modeButtonVerticalDistance [
	
	^ 10
]

{
	#category : #modes,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:03'
}
SKProgrammingUIMeelyStateMachine >> modeLables [

	| newDict |
	newDict := Dictionary new.
	newDict
		at: #drag put: 'Drag Mode';
		at: #edge put: 'Edge Mode';
		at: #delete put: 'Delete Mode'.
		
	^ newDict
]

{
	#category : #modes,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:03'
}
SKProgrammingUIMeelyStateMachine >> modes [
	
	"first item is the last item in the list"
	^ { #edge. #delete. #drag }
]

{
	#category : #events,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:16'
}
SKProgrammingUIMeelyStateMachine >> nodeClicked: aNode [

	self mode caseOf: {
		[#delete] -> [self actionDeleteNode: aNode].
		[#edge]   -> [self handleEdgeModeNodeClick: aNode]
	} otherwise: []
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:00'
}
SKProgrammingUIMeelyStateMachine >> playGround [
 
	^ playGround ifNil: [playGround := SKPlayGround newWithController: self]
]

{
	#category : #events,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 13:03'
}
SKProgrammingUIMeelyStateMachine >> playGroundClicked: aPosition [

	self mode caseOf: {
		[#delete] -> [self findeEdgeToDelete: aPosition]
	} otherwise: []
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:14'
}
SKProgrammingUIMeelyStateMachine >> selectedNode [

	^ selectedNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:26'
}
SKProgrammingUIMeelyStateMachine >> selectedNode: aNode [

	aNode 
		ifNil: [ selectedNode ifNotNil: [selectedNode unselectNode]]
		ifNotNil: [aNode selectNode].
	
	selectedNode := aNode.
]

{
	#category : #modes,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:22'
}
SKProgrammingUIMeelyStateMachine >> toggleMode: aMode [

	self 
		colorAllModeButtonsNormal;
		markModeButtonSelected: aMode;
		mode: aMode
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:41'
}
SKProgrammingUIMeelyStateMachine >> windowTitle [

	^ 'Meely Automat'
]
