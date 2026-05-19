Class {
	#name : #SKPUIMeelyStateMachine,
	#superclass : #SystemWindow,
	#instVars : [
		'playGround',
		'mode',
		'selectedNode'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:16'
}
SKPUIMeelyStateMachine >> addComponent: aComponent [

	aComponent controller: self.
	playGround addMorph: aComponent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:53'
}
SKPUIMeelyStateMachine >> createEdgeFrom: aNode to: anotherNode [

	| edge |

	self selectedNode: nil.
	
	edge := SKMeelyEdge newFrom: aNode to: anotherNode.
	edge
		fromNode: aNode;
		toNode: anotherNode;
		controller:  self.
	aNode addDependent: edge.
	anotherNode addDependent: edge.
	
	self playGround addEdge: edge
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:58'
}
SKPUIMeelyStateMachine >> createNode [
	
	| node |
	
	node := SKMeelyNode new.
	node controller: self.
	node openInHand
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:51'
}
SKPUIMeelyStateMachine >> initialize [

	super initialize.
	
	self	openInHand; 
		extent: 1000 @ 1000;
		paneColor: Color white;
		setLabel: self windowTitle.
	
	self playGround: (SKPlayGround new
					extent: 900@900;
					color: Color green;
					position: (self position + (50@100))).
	self addMorph: self playGround.
		
	self addComponent: (SKMeelyNode new position: (self playGround position)).
	self addComponent: (SKMeelyNode new position: (self playGround position + (100 @ 100))).
	
	self initializeButtons.
	
	self mode: #edge
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:56'
}
SKPUIMeelyStateMachine >> initializeButtons [

	self addMorph: (SimpleButtonMorph new 
						position: self position + (700 @ 150);
						extent: 100 @ 50;
						label: 'Drag Mode';
						target: self;
						actionSelector: #toggleDragMode).
						
	self addMorph: (SimpleButtonMorph new 
						position: self position + (700 @ 200);
						extent: 100 @ 50;
						label: 'Edge Mode';
						target: self;
						actionSelector: #toggleEdgeMode).
						
	self addMorph: (SimpleButtonMorph new 
						position: self position + (700 @ 300);
						extent: 100 @ 50;
						label: 'Add Node';
						target: self;
						actionSelector: #createNode).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:18'
}
SKPUIMeelyStateMachine >> mode [
	
	^ mode ifNil: [mode := #drag]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:23'
}
SKPUIMeelyStateMachine >> mode: aMode [

	"modes: drag, edge"
	self selectedNode: nil.
	mode := aMode
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:16'
}
SKPUIMeelyStateMachine >> playGround [
	
	^ playGround
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:16'
}
SKPUIMeelyStateMachine >> playGround: aPlayGround [

	playGround := aPlayGround
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:22'
}
SKPUIMeelyStateMachine >> selectedNode [

	^ selectedNode
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:41'
}
SKPUIMeelyStateMachine >> selectedNode: aNode [
	
	selectedNode ifNotNil: [selectedNode unselectNode].
	aNode ifNotNil: [aNode selectNode].

	selectedNode := aNode
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:57'
}
SKPUIMeelyStateMachine >> toggleDragMode [

	self mode: #drag
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:57'
}
SKPUIMeelyStateMachine >> toggleEdgeMode [

	self mode: #edge
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 10:31'
}
SKPUIMeelyStateMachine >> windowTitle [
	
	^ 'Meely State Machine'
]
