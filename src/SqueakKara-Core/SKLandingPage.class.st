"
provides a user interface for the user to select either a blank work environment or one of the provided example problems. It is the first page the user sees.
"
Class {
	#name : #SKLandingPage,
	#superclass : #SystemWindow,
	#instVars : [
		'selectedConcept',
		'conceptStack',
		'conceptButtons'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'SP 7/2/2026 01:24'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 7/5/2026 00:20'
}
SKLandingPage >> actionBlankProject [

	self buildEnvironment initializeWithBlankProject.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKLandingPage >> actionConceptSelected: aIndex [

	self selectedConcept: aIndex.
	self conceptStack selectButtonAt: aIndex
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 7/6/2026 04:03'
}
SKLandingPage >> actionLoadLevel: aLevel [

	self buildEnvironment initializeWithLevel: aLevel.
	self delete

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:07'
}
SKLandingPage >> addConceptButton: aButton [

	self conceptButtons add: aButton
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'JS 7/6/2026 03:52'
}
SKLandingPage >> buildButtonWithLabel: aLabel andSelector: aSelector andColor: aColor [

	^ SimpleButtonMorph new
		label: aLabel;
		target: self;
		actionSelector: aSelector;
		color: aColor;
		height: self buttonHeight;
		yourself
]

{
	#category : #conceptSelection,
	#'squeak_changestamp' : 'JS 7/6/2026 03:52'
}
SKLandingPage >> buildConceptButtonFor: aConcept atIndex: aIndex [

	| button |
	
	button := self buildButtonWithLabel: aConcept name andSelector: #actionConceptSelected: andColor: self conceptSelectionButtonNormalColor.
	button arguments: { aIndex };
		extent: 150 @ self buttonHeight.
	^ button
]

{
	#category : #conceptSelection,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:16'
}
SKLandingPage >> buildConceptSelection [

	| container button |
	
	container := AlignmentMorph newColumn.
	container position: (self position + (400 @ 80)).
	
	self concepts  withIndexDo: [:concept :i | 
		button := self buildConceptButtonFor: concept atIndex: i.
		self addConceptButton: button.
		container addMorph: button].
	
	self addMorph: container
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'JS 7/6/2026 03:29'
}
SKLandingPage >> buildConceptStack [

	| stack|
	
	stack := SKButtonStack new
		selectedColor: self conceptSelectionButtonSelectedColor;
		buttonExtent: self conceptButtonExtent;
		yourself.
	
	self concepts withIndexDo: [:concept :i |
		stack
			addButtonWithLabel: concept name
			target: self
			selector: #actionConceptSelected:
			arguments: { i }
			color: self conceptSelectionButtonNormalColor].
	
	self conceptStack: stack.
	^ stack
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'JS 7/5/2026 14:16'
}
SKLandingPage >> buildContent [

	| row topBar|
	
	topBar := (self submorphs select: [:each | each isKindOf: AlignmentMorph]) at: 1.

	row := AlignmentMorph newRow
		color: Color transparent;
		cellInset: self contentSpacing;
		layoutInset: self contentSpacing;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		yourself.
	row
		addMorphBack: self buildProjectStack;
		addMorphBack: self buildConceptStack.
	self addMorph: row.
	self extent: self extent x @ (self extent y max: row bounds height +( topBar extent y * 2)).
	
	row center: self center x @ self center y + (topBar extent y / 2).
	row goBehind
]

{
	#category : #conceptSelection,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:19'
}
SKLandingPage >> buildEnvironment [ 

	^ SKEnvironment newWithProgrammingConcept: (self concepts at: self selectedConcept)
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'JS 7/6/2026 04:25'
}
SKLandingPage >> buildProjectStack [

	| stack maxWidth levelIndex|
	
	maxWidth := 0.
	levelIndex := 0.
	stack := SKButtonStack new.
	stack
		addButtonWithLabel: self buttonBlankProjectLabel
		target: self
		selector: #actionEmptyProject
		color: SKStylesheet primaryColor.
		
	self exampleProjects do: [:each |
		stack
			addButtonWithLabel: each key
			target: self
			selector: each value
			arguments: {'SKLevelWorld',(levelIndex // 5 + 1) asString, 'Level', (levelIndex \\ 5 + 1) asString}
			color: SKStylesheet secondaryColor.
			maxWidth := maxWidth max: stack buttons last extent x.
			levelIndex := levelIndex + 1].
	stack buttons do: [:each | 
		each extent: (maxWidth + 20) @ each extent y.
		each firstSubmorph left: each left + 10].
	^ stack
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JS 7/5/2026 00:18'
}
SKLandingPage >> buttonBlankProjectLabel [

	^ 'New Blank Project'
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JS 7/6/2026 04:23'
}
SKLandingPage >> buttonExample10Label [

	^ SKLevelWorld2Level5 levelName
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JS 7/6/2026 04:24'
}
SKLandingPage >> buttonExample11Label [

	^ SKLevelWorld3Level1 levelName
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JS 7/6/2026 04:22'
}
SKLandingPage >> buttonExample1Label [

	^ SKLevelWorld1Level1 levelName
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JS 7/6/2026 04:22'
}
SKLandingPage >> buttonExample2Label [

	^ SKLevelWorld1Level2 levelName
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JS 7/6/2026 04:22'
}
SKLandingPage >> buttonExample3Label [

	^ SKLevelWorld1Level3 levelName
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JS 7/6/2026 04:22'
}
SKLandingPage >> buttonExample4Label [

	^ SKLevelWorld1Level4 levelName
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JS 7/6/2026 03:19'
}
SKLandingPage >> buttonExample5Label [

	^ 'TBC'
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JS 7/6/2026 04:23'
}
SKLandingPage >> buttonExample6Label [

	^ SKLevelWorld2Level1 levelName
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JS 7/6/2026 04:23'
}
SKLandingPage >> buttonExample7Label [

	^ SKLevelWorld2Level2 levelName
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JS 7/6/2026 04:23'
}
SKLandingPage >> buttonExample8Label [

	^ SKLevelWorld2Level3 levelName
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JS 7/6/2026 03:22'
}
SKLandingPage >> buttonExample9Label [

	^ 'TBC'
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LK 7/4/2024 19:06'
}
SKLandingPage >> buttonHeight [

	^ 20 px
]

{
	#category : #layout,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKLandingPage >> conceptButtonExtent [

	^ 150 px @ 20 px
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:10'
}
SKLandingPage >> conceptButtons [

	^ conceptButtons ifNil: [conceptButtons := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/5/2026 00:14'
}
SKLandingPage >> conceptButtons: anOrderedCollection [

	conceptStack := anOrderedCollection
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:06'
}
SKLandingPage >> conceptSelectionButtonNormalColor [

	^ Color gray
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:06'
}
SKLandingPage >> conceptSelectionButtonSelectedColor [

	^ Color red
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKLandingPage >> conceptStack [

	^ conceptStack
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKLandingPage >> conceptStack: aStack [

	conceptStack := aStack
]

{
	#category : #conceptSelection,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:15'
}
SKLandingPage >> concepts [

	^ { SKProgrammingConcept code.  SKProgrammingConcept blocks. SKProgrammingConcept mealy }
]

{
	#category : #layout,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKLandingPage >> contentSpacing [

	^ 12
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKLandingPage >> defaultExtent [

	^ 420 px @ 280 px
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'JS 7/6/2026 04:14'
}
SKLandingPage >> exampleProjects [

	^ {
		self buttonExample1Label -> #actionLoadLevel:.
		self buttonExample2Label -> #actionLoadLevel:.
		self buttonExample3Label -> #actionLoadLevel:.
		self buttonExample4Label -> #actionLoadLevel:.
		self buttonExample5Label -> #actionLoadLevel:.
		self buttonExample6Label -> #actionLoadLevel:.
		self buttonExample7Label -> #actionLoadLevel:.
		self buttonExample8Label -> #actionLoadLevel:.
		self buttonExample9Label -> #actionLoadLevel:.
		self buttonExample10Label -> #actionLoadLevel:.
		self buttonExample11Label -> #actionLoadLevel:.
	}
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 7/5/2026 14:03'
}
SKLandingPage >> initialize [
	
	super initialize.
	
	self setLabel: self windowTitle;
		openInHand;
		extent: self defaultExtent;
		buildContent;
		actionConceptSelected: 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 20:47'
}
SKLandingPage >> selectedConcept [

	^ selectedConcept
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 20:47'
}
SKLandingPage >> selectedConcept: aIndex [

	selectedConcept := aIndex
]

{
	#category : #labels,
	#'squeak_changestamp' : 'LK 6/21/2024 22:44'
}
SKLandingPage >> windowTitle [

	^ 'SqueakKara'
]
