Class {
	#name : #SKStateMachineEditor,
	#superclass : #SystemWindow,
	#instVars : [
		'playGround',
		'mode',
		'selectedNode',
		'modeStack',
		'nodesToDelete',
		'nodeCounter',
		'buttonPanel'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/21/2026 14:48'
}
SKStateMachineEditor >> actionAddEdgeFrom: aNode to: anotherNode [

	| edge |

	edge := SKMealyEdge newFrom: aNode to: anotherNode.
	self playGround addEdge: edge.
	
	aNode addDependent: edge.
	aNode addEdge: edge;
		calculateBestEdgeDirections.

	(anotherNode = aNode) ifFalse: [	
		anotherNode addEdge: edge;
			addDependent: edge;
			calculateBestEdgeDirections].

	edge update: #unusedValue. 
	self actionSelectEdge: edge
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 7/1/2026 12:56'
}
SKStateMachineEditor >> actionCreateNode [

	| node |
	node := SKMealyNode newWithName: self nodeCounter asString.
	node stateMachineEditor: self.
	
	self nodeCounterPP.
	self playGround addNode: node.
	node createNodeTextMorph.
	node openInHand
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 09:32'
}
SKStateMachineEditor >> actionDeleteEdge: aEdge [

	self playGround removeEdge: aEdge.
	aEdge fromNode removeEdge: aEdge.
	aEdge fromNode = aEdge toNode ifFalse: [aEdge toNode removeEdge: aEdge].
	aEdge delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/21/2026 15:39'
}
SKStateMachineEditor >> actionDeleteNode: aNode [
	
	| belongingEdges |
	
	aNode isStartingNode ifTrue: [^nil].
		
	belongingEdges := Set new.
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
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 7/1/2026 12:34'
}
SKStateMachineEditor >> actionSelectNode: aNode [

	self unselectAll.
	aNode selectNode
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKStateMachineEditor >> buildActionButtonStack [

	| stack |

	stack := SKButtonStack new
		cellInset: self modeButtonVerticalDistance;
		buttonExtent: self modeButtonSize;
		yourself.
	stack
		addButtonWithLabel: 'Create Node'
		target: self
		selector: #actionCreateNode
		color: self modeButtonNormalColor.
	^ stack
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKStateMachineEditor >> buildButtonPanel [

	buttonPanel := AlignmentMorph newColumn
		color: Color transparent;
		cellInset: self modeButtonVerticalDistance;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		yourself.
	buttonPanel
		addMorphBack: self buildActionButtonStack;
		addMorphBack: self buildModeButtonStack.
	self addMorph: buttonPanel
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKStateMachineEditor >> buildModeButtonStack [

	| stack |

	stack := SKButtonStack new
		cellInset: self modeButtonVerticalDistance;
		buttonExtent: self modeButtonSize;
		selectedColor: self modeButtonSelectedColor;
		yourself.
	self modes do: [:aMode |
		stack
			addButtonWithLabel: (self modeLables at: aMode)
			target: self
			selector: #toggleMode:
			arguments: { aMode }
			color: self modeButtonNormalColor].
	self modeStack: stack.
	^ stack
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'S 7/2/2026 12:04'
}
SKStateMachineEditor >> buttonPanel [

	^ buttonPanel
]

{
	#category : #layout,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKStateMachineEditor >> buttonPanelOffset [

	^ 20
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:43'
}
SKStateMachineEditor >> deselectAllEdges [

	self playGround edges do: [:aEdge | self actionDeselectEdge: aEdge]
]

{
	#category : #const,
	#'squeak_changestamp' : 'Lars Kuhr 6/19/2026 16:11'
}
SKStateMachineEditor >> edgeSelectionDistance [

	^ 40
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
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 7/2/2026 12:04'
}
SKStateMachineEditor >> extent: aPoint [

	super extent: aPoint.
	self relayoutContents
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 7/1/2026 12:38'
}
SKStateMachineEditor >> handelSelectModeNodeClicked: aNode [

	self actionSelectNode: aNode
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
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 13:01'
}
SKStateMachineEditor >> handleEdgeModeNodeClick: aNode [

	(self selectedNode = aNode) ifTrue: [
		self actionAddEdgeFrom: self selectedNode to: aNode.
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
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 16:11'
}
SKStateMachineEditor >> handleEdgeModeNodeClicked: aNode [

	(self selectedNode = aNode) ifTrue: [
		self actionAddEdgeFrom: self selectedNode to: aNode.
		self selectedNode: nil.
		^ nil].
	
	self selectedNode ifNotNil: [
		self actionAddEdgeFrom: self selectedNode to: aNode.
		self selectedNode: nil.
		^ nil].
	
	self selectedNode: aNode.
						
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
	#'squeak_changestamp' : 'JS 6/16/2026 16:49'
}
SKStateMachineEditor >> initialize [

	super initialize.
	
	self	openInWorld; 
		extent: 1500 @ 1000;
		paneColor: Color white;
		setLabel: self windowTitle.
	
	self addMorph: self playGround.
	self buildButtonPanel.
	self relayoutContents.
	self initializePlayground.
	self toggleMode: #drag
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 7/1/2026 13:08'
}
SKStateMachineEditor >> initializePlayground [

	|startingNode|

	self playGround color: Color white.
	
	startingNode := SKMealyNode newWithName: self nodeCounter asString.
	self nodeCounterPP.
	startingNode isStartingNode: true. 
	startingNode addMorph: (StringMorph new
		contents: 'START';
		color: Color black;
		emphasis: TextEmphasis bold emphasisCode;
		font: ((TextStyle named: #BitstreamVeraSans) addNewFontSize: 8);
		center: startingNode center).
		
	self playGround addNode: startingNode.
	self playGround addMorph: startingNode.
	
	startingNode center: self playGround center
	

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
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKStateMachineEditor >> modeStack [

	^ modeStack
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKStateMachineEditor >> modeStack: aStack [

	modeStack := aStack
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
	#'squeak_changestamp' : 'Lars Kuhr 7/1/2026 12:28'
}
SKStateMachineEditor >> nodeClicked: aNode [

	self mode caseOf: {
		[#delete] -> [self actionDeleteNode: aNode].
		[#edge]   -> [self handleEdgeModeNodeClicked: aNode].
		[#select] -> [self handelSelectModeNodeClicked: aNode]
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
	#'squeak_changestamp' : 'JS 6/16/2026 19:02'
}
SKStateMachineEditor >> playGroundClicked: aPosition [

	self mode caseOf: {
		[#delete] -> [self handleDeleteModePlayGroundClicked: aPosition]. 
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
	#category : #layout,
	#'squeak_changestamp' : 'S 7/2/2026 12:04'
}
SKStateMachineEditor >> relayoutContents [

	| content panelWidth playGroundExtent |
	self buttonPanel ifNil: [^ self].
	content := self innerBounds insetBy: (0 @ self labelHeight corner: 0 @ 0).
	content := content insetBy: self buttonPanelOffset.
	panelWidth := self modeButtonSize x.
	playGroundExtent :=
		(content width - panelWidth - self buttonPanelOffset) @ content height.
	self playGround
		position: content topLeft;
		extent: playGroundExtent.
	self buttonPanel
		position: self playGround topRight + (self buttonPanelOffset @ 0)
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/19/2026 16:11'
}
SKStateMachineEditor >> selectEdgeNear: aPosition [

	| edge distance limit |
	
	"max distance from the line where it will be clicked"
	limit := self edgeSelectionDistance.
	
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
	#'squeak_changestamp' : 'Lars Kuhr 7/1/2026 12:21'
}
SKStateMachineEditor >> selectedNode: aNode [

	aNode 
		ifNil: [ selectedNode ifNotNil: [selectedNode unmarkNode]]
		ifNotNil: [aNode markNode].
	
	selectedNode := aNode.
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
	#'squeak_changestamp' : 'SSP 7/2/2026 01:00'
}
SKStateMachineEditor >> toggleMode: aMode [

	| label button |

	self unselectAll.
	self deselectAllEdges.
	self mode: aMode.
	label := self modeLables at: aMode.
	button := self modeStack buttons detect: [:b | b label = label].
	self modeStack select: button
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 7/1/2026 12:34'
}
SKStateMachineEditor >> unselectAll [
	
	self playGround nodes do: [:anotherNode| anotherNode unselectNode]
	
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
