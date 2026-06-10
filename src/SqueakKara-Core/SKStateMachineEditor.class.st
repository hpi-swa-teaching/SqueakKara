Class {
	#name : #SKStateMachineEditor,
	#superclass : #SystemWindow,
	#instVars : [
		'playGround',
		'mode',
		'selectedNode',
		'buttons',
		'nodesToDelete',
		'startEdgePosition',
		'nodeCounter'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:13'
}
SKStateMachineEditor >> actionAddEdgeFrom: aNode to: anotherNode [

	| edge |

	edge := SKMealyEdge newFrom: aNode to: anotherNode.
	self playGround addEdge: edge.
	
	aNode addDependent: edge.
	anotherNode addDependent: edge.
	edge update: #unusedValue. 
	self actionSelectEdge: edge
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/9/2026 15:28'
}
SKStateMachineEditor >> actionAddEdgeFromPosition: aPosition toNode: aNode [

	| edge |

	edge := SKMealyEdge newFromPosition: aPosition toNode: aNode.
	edge fromPosition: aPosition. 
	self playGround addEdge: edge.
	
	aNode addDependent: edge.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/10/2026 13:07'
}
SKStateMachineEditor >> actionCreateNode [

	| node |
	node := SKMealyNode newWithName: self nodeCounter asString.
	node stateMachineEditor: self.
	nodeCounter = 0 ifTrue: [node isStartingNode: true].
	
	self nodeCounterPP.
	self playGround addNode: node.
	node openInHand
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/10/2026 13:02'
}
SKStateMachineEditor >> actionDeleteEdge: aEdge [

	self playGround removeEdge: aEdge.
	aEdge fromNode ifNil: [
		aEdge toNode isStartingNode: false].
	aEdge delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:42'
}
SKStateMachineEditor >> actionDeleteNode: aNode [

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
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:44'
}
SKStateMachineEditor >> actionDeselectEdge: aEdge [

	aEdge gotDeselected
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:43'
}
SKStateMachineEditor >> actionSelectEdge: aEdge [

	self deselectAllEdges.
	aEdge gotSelected
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:52'
}
SKStateMachineEditor >> addButton: aButton [

	self buttons add: aButton
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:48'
}
SKStateMachineEditor >> buildButtonForMode: aMode withLabel: aString [

	^ self buildButtonWithActionSelector: #toggleMode: arguments: { aMode } label: aString
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:47'
}
SKStateMachineEditor >> buildButtonWithActionSelector: aActionSelector arguments: aArgumentCollection label: aString [

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
SKStateMachineEditor >> buttons [

	^ buttons ifNil: [buttons := OrderedCollection new]
]

{
	#category : #modes,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:19'
}
SKStateMachineEditor >> colorAllModeButtonsNormal [

	self buttons do: [:button| button color: self modeButtonNormalColor]
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:43'
}
SKStateMachineEditor >> deselectAllEdges [

	self playGround edges do: [:aEdge | self actionDeselectEdge: aEdge]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:57'
}
SKStateMachineEditor >> edges [

	^ self playGround edges
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:06'
}
SKStateMachineEditor >> enqueueNodeToDelete: aNode [

	self nodesToDelete remove: aNode
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:20'
}
SKStateMachineEditor >> handleDeleteModePlayGroundClicked: aPosition [

	| edge |
	
	edge := self selectEdgeNear: aPosition.
	edge ifNil: [^ self].
	self actionDeleteEdge: edge

]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/10/2026 13:01'
}
SKStateMachineEditor >> handleEdgeModeNodeClick: aNode [

	self selectedNode = aNode ifTrue: [
		self selectedNode: nil.
		^ nil].
	
	self selectedNode ifNotNil: [
		self actionAddEdgeFrom: self selectedNode to: aNode.
		self selectedNode: nil.
		^ nil].
	
	self selectedNode: aNode.
	self startEdgePosition ifNotNil:[
		aNode isStartingNode ifTrue:[
			(self playGround findAllEdgesToNode: aNode) do: [:edge |
				edge fromNode == nil ifTrue: [
					self playGround removeEdge: edge.
					edge delete]]]
		ifFalse: [
			aNode isStartingNode: true.].
		self actionAddEdgeFromPosition: self startEdgePosition toNode: aNode.
		self startEdgePosition: nil.
		self selectedNode: nil].
						
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/10/2026 13:13'
}
SKStateMachineEditor >> handleEdgeModeNodeClicked: aNode [

	self selectedNode = aNode ifTrue: [
		self selectedNode: nil.
		^ nil].
	
	self selectedNode ifNotNil: [
		self actionAddEdgeFrom: self selectedNode to: aNode.
		self selectedNode: nil.
		^ nil].
	
	self selectedNode: aNode.
	self startEdgePosition ifNotNil:[
		aNode isStartingNode ifTrue:[
			(self playGround findAllEdgesToNode: aNode) do: [:edge |
				edge fromNode == nil ifTrue: [
					self playGround removeEdge: edge.
					edge delete]]]
		ifFalse: [
			aNode isStartingNode: true.].
		self actionAddEdgeFromPosition: self startEdgePosition toNode: aNode.
		self startEdgePosition: nil.
		self selectedNode: nil].
						
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:25'
}
SKStateMachineEditor >> handleSelectModePlayGroundClicked: aPosition [

	| edge |
	
	edge := self selectEdgeNear: aPosition.
	edge ifNil: [^ self].
	self actionSelectEdge: edge
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:07'
}
SKStateMachineEditor >> hasNodesToDelete [

	^ self nodesToDelete size > 0
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:44'
}
SKStateMachineEditor >> initialize [

	super initialize.
	
	self	openInWorld; 
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
SKStateMachineEditor >> initializeButtons [
	
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
SKStateMachineEditor >> initializeModeButtons [

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
SKStateMachineEditor >> initilazieActionButtons [

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
SKStateMachineEditor >> markModeButtonSelected: aMode [

	| selectedButton buttonLabel |
	
	buttonLabel := self modeLables at: aMode.
	selectedButton := self buttons detect: [:button| button label = buttonLabel].
	selectedButton color: self modeButtonSelectedColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:22'
}
SKStateMachineEditor >> mode [

	^ mode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:22'
}
SKStateMachineEditor >> mode: aMode [

	mode := aMode
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:48'
}
SKStateMachineEditor >> modeButtonNormalColor [

	^ SKStylesheet colorLightGreen
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:48'
}
SKStateMachineEditor >> modeButtonSelectedColor [

	^ SKStylesheet colorYellow
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:05'
}
SKStateMachineEditor >> modeButtonSize [

	^ 250 @ 69
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 10:14'
}
SKStateMachineEditor >> modeButtonVerticalDistance [
	
	^ 10
]

{
	#category : #modes,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:13'
}
SKStateMachineEditor >> modeLables [

	| newDict |
	newDict := Dictionary new.
	newDict
		at: #drag put: 'Drag Mode';
		at: #edge put: 'Edge Mode';
		at: #delete put: 'Delete Mode';
		at: #select put: 'Select Mode'.
		
	^ newDict
]

{
	#category : #modes,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:13'
}
SKStateMachineEditor >> modes [
	
	"first item is the last item in the list"
	^ { #edge. #delete. #drag. #select }
]

{
	#category : #events,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:20'
}
SKStateMachineEditor >> nodeClicked: aNode [

	self mode caseOf: {
		[#delete] -> [self actionDeleteNode: aNode].
		[#edge]   -> [self handleEdgeModeNodeClicked: aNode]
	} otherwise: []
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:34'
}
SKStateMachineEditor >> nodeCounter [

	^ nodeCounter ifNil: [nodeCounter := 0]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:35'
}
SKStateMachineEditor >> nodeCounterPP [

	nodeCounter := nodeCounter + 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:57'
}
SKStateMachineEditor >> nodes [

	^ self playGround nodes
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:05'
}
SKStateMachineEditor >> nodesToDelete [

	^ nodesToDelete ifNil: [nodesToDelete := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:00'
}
SKStateMachineEditor >> playGround [
 
	^ playGround ifNil: [playGround := SKPlayGround newWithController: self]
]

{
	#category : #events,
	#'squeak_changestamp' : 'JS 6/10/2026 13:09'
}
SKStateMachineEditor >> playGroundClicked: aPosition [

	self mode caseOf: {
		[#delete] -> [self handleDeleteModePlayGroundClicked: aPosition]. 
		[#edge]   -> [self startEdgePosition: aPosition].
		[#select] -> [self handleSelectModePlayGroundClicked: aPosition]
	} otherwise: []
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:09'
}
SKStateMachineEditor >> queueNodeToDelete: aNode [

	self nodesToDelete add: aNode
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:45'
}
SKStateMachineEditor >> selectEdgeNear: aPosition [

	| edge distance limit |
	
	"max distance from the line where it will be clicked"
	limit := 50.
	
	edge := self playGround findNearestEdge: aPosition.
	edge ifNil: [^ nil].
	
	distance := self playGround distanceFrom: aPosition toEdge: edge.
	distance := distance abs.
	
	distance <= limit ifFalse: [^ nil].
	^ edge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:14'
}
SKStateMachineEditor >> selectedNode [

	^ selectedNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:26'
}
SKStateMachineEditor >> selectedNode: aNode [

	aNode 
		ifNil: [ selectedNode ifNotNil: [selectedNode unselectNode]]
		ifNotNil: [aNode selectNode].
	
	selectedNode := aNode.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/9/2026 01:41'
}
SKStateMachineEditor >> startEdgePosition [
	^ startEdgePosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/9/2026 01:41'
}
SKStateMachineEditor >> startEdgePosition: anObject [
	startEdgePosition := anObject
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:12'
}
SKStateMachineEditor >> step [

	self hasNodesToDelete ifFalse: [^ self].
	self nodesToDelete do: [:aNode | 
		self enqueueNodeToDelete: aNode;
			actionDeleteNode: aNode]
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:12'
}
SKStateMachineEditor >> stepTime [

	^ 100
]

{
	#category : #modes,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:43'
}
SKStateMachineEditor >> toggleMode: aMode [

	self 
		colorAllModeButtonsNormal;
		markModeButtonSelected: aMode;
		deselectAllEdges;
		mode: aMode
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:11'
}
SKStateMachineEditor >> wantsSteps [

	^ true
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 10:45'
}
SKStateMachineEditor >> windowTitle [

	^ 'Mealy Automat'
]
