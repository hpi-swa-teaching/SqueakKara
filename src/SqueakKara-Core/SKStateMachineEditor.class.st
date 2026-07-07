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
		'buttonPanel',
		'selectedEdge'
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
	#'squeak_changestamp' : 'Lars 7/7/2026 01:58'
}
SKStateMachineEditor >> actionSelectEdge: aEdge [

	self deselectEdge;
		selectedEdge: aEdge.
	aEdge actionSelect
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars 7/7/2026 01:58'
}
SKStateMachineEditor >> actionSelectNode: aNode [

	self deselectNode;
		selectedNode: aNode.
	aNode actionSelectWithMode: self mode
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 7/5/2026 15:53'
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
		color: self modeButtonDefaultColor.
	^ stack
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 7/5/2026 16:34'
}
SKStateMachineEditor >> buildButtonPanel [

	self buttonPanel: (AlignmentMorph newColumn
		color: Color transparent;
		cellInset: self modeButtonVerticalDistance;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		yourself).
	self buttonPanel
		addMorphBack: self buildActionButtonStack;
		addMorphBack: self buildModeButtonStack.
	self addMorph: self buttonPanel
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 7/5/2026 15:54'
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
			color: self modeButtonDefaultColor].
	self modeStack: stack.
	^ stack
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'S 7/2/2026 12:04'
}
SKStateMachineEditor >> buttonPanel [

	^ buttonPanel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/5/2026 16:33'
}
SKStateMachineEditor >> buttonPanel: aButtonStack [

	buttonPanel := aButtonStack
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
	#'squeak_changestamp' : 'Lars 7/7/2026 01:57'
}
SKStateMachineEditor >> deselectAll [
	
	self 
		deselectNode;
		deselectEdge
	
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:43'
}
SKStateMachineEditor >> deselectAllEdges [

	self playGround edges do: [:aEdge | self actionDeselectEdge: aEdge]
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 01:54'
}
SKStateMachineEditor >> deselectEdge [

	self selectedEdge ifNil: [^ self].
	self selectedEdge actionDeselect.
	self selectedEdge: nil
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 01:54'
}
SKStateMachineEditor >> deselectNode [

	self selectedNode ifNil: [^ self].
	self selectedNode actionDeselect.
	self selectedNode: nil
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
	#category : #events,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:20'
}
SKStateMachineEditor >> handleDeleteModePlayGroundClicked: aPosition [

	| edge |
	
	edge := self selectEdgeNear: aPosition.
	edge ifNil: [^ self].
	self actionDeleteEdge: edge

]

{
	#category : #events,
	#'squeak_changestamp' : 'Lars 7/7/2026 02:07'
}
SKStateMachineEditor >> handleEdgeModeNodeClicked: aNode [

	self selectedNode ifNil: [self actionSelectNode: aNode.
		^ self].
	self actionAddEdgeFrom: self selectedNode to: aNode.
	self deselectNode
						
]

{
	#category : #events,
	#'squeak_changestamp' : 'Lars 7/7/2026 02:08'
}
SKStateMachineEditor >> handleSelectModeNodeClicked: aNode [

	self actionSelectNode: aNode
]

{
	#category : #events,
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
	#'squeak_changestamp' : 'JS 7/5/2026 16:15'
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
	#'squeak_changestamp' : 'JS 7/5/2026 15:53'
}
SKStateMachineEditor >> modeButtonDefaultColor [

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
	#'squeak_changestamp' : 'JS 7/5/2026 15:55'
}
SKStateMachineEditor >> modes [
	
	^ { #edge. #delete. #drag. #select }
]

{
	#category : #events,
	#'squeak_changestamp' : 'Lars 7/7/2026 02:09'
}
SKStateMachineEditor >> nodeClicked: aNode [

	self mode caseOf: {
		[#delete] -> [self actionDeleteNode: aNode].
		[#edge]   -> [self handleEdgeModeNodeClicked: aNode].
		[#select] -> [self handleSelectModeNodeClicked: aNode]
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
	#'squeak_changestamp' : 'JS 7/5/2026 16:36'
}
SKStateMachineEditor >> relayoutContents [

	| content playGroundExtent |
	
	self buttonPanel ifNil: [^ self].
	content := self innerBounds insetBy: (0 @ self labelHeight corner: 0 @ 0).
	content := content insetBy: self buttonPanelOffset.
	playGroundExtent :=
		(content width - self buttonPanel extent x - self buttonPanelOffset) @ content height.
	self playGround
		position: content topLeft;
		extent: playGroundExtent.
	self buttonPanel
		position: self playGround topRight + (self buttonPanelOffset @ 0)
]

{
	#category : #helper,
	#'squeak_changestamp' : 'JS 7/5/2026 15:56'
}
SKStateMachineEditor >> selectEdgeNear: aPosition [

	| edge distance limit |
	
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
	#'squeak_changestamp' : 'Lars 7/7/2026 01:34'
}
SKStateMachineEditor >> selectedEdge [

	^ selectedEdge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars 7/7/2026 01:34'
}
SKStateMachineEditor >> selectedEdge: aEdge [

	selectedEdge := aEdge
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
	#'squeak_changestamp' : 'Lars 7/7/2026 02:02'
}
SKStateMachineEditor >> selectedNode: aNode [
	
	selectedNode := aNode
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
	#'squeak_changestamp' : 'Lars 7/7/2026 02:00'
}
SKStateMachineEditor >> toggleMode: aMode [

	| label button |

	self mode: aMode.
	label := self modeLables at: aMode.
	button := self modeStack buttons detect: [:each | each label = label].
	self modeStack select: button.
	self deselectAll
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 01:53'
}
SKStateMachineEditor >> unselectAll [
	
	self 
		deselectNode;
		deselectEdge
	
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
