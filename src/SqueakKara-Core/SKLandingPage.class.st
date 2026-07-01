"
provides a user interface for the user to select either a blank work environment or one of the provided example problems. It is the first page the user sees.
"
Class {
	#name : #SKLandingPage,
	#superclass : #SystemWindow,
	#instVars : [
		'selectedConcept',
		'conceptStack'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'SP 7/2/2026 01:24'
}

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
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:20'
}
SKLandingPage >> actionExample1 [

	self buildEnvironment initializeWithChallenge1.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:20'
}
SKLandingPage >> actionExample2 [

	self buildEnvironment initializeWithChallenge2.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:20'
}
SKLandingPage >> actionExample3 [

	self buildEnvironment initializeWithChallenge3.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:20'
}
SKLandingPage >> actionExample4 [

	self buildEnvironment initializeWithChallenge4.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/2/2026 15:45'
}
SKLandingPage >> actionNew [

	self buildEnvironment initializeWithBlankProject.
	self delete
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LM 5/7/2026 22:16'
}
SKLandingPage >> addAllButtons [

	self addButton: self buildButtonNew atIndex: 0.
	
	self addButton: self buildButtonExample1 atIndex: 1.
	self addButton: self buildButtonExample2 atIndex: 2.
	self addButton: self buildButtonExample3 atIndex: 3.
	self addButton: self buildButtonExample4 atIndex: 4
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 20:43'
}
SKLandingPage >> addButton: aButton atIndex: anInteger [

	| yOffset basePosition |
	
	self addMorph: aButton.
	
	yOffset := (aButton height + 10) * (anInteger - 1).
	
	basePosition := self position
		- (aButton width / 2)
		+ (200 @ 250).
	
	aButton position: basePosition + (0 @ yOffset)
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
	#'squeak_changestamp' : 'LK 7/4/2024 19:12'
}
SKLandingPage >> buildButtonExample1 [

	^ self buildButtonWithLabel: self buttonExample1Label
		andSelector: #actionExample1
		andColor: SKStylesheet secondaryColor
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LK 7/4/2024 19:12'
}
SKLandingPage >> buildButtonExample2 [

	^ self buildButtonWithLabel: self buttonExample2Label
		andSelector: #actionExample2
		andColor: SKStylesheet secondaryColor
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LK 7/4/2024 19:12'
}
SKLandingPage >> buildButtonExample3 [

	^ self buildButtonWithLabel: self buttonExample3Label
		andSelector: #actionExample3
		andColor: SKStylesheet secondaryColor
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LM 5/7/2026 22:15'
}
SKLandingPage >> buildButtonExample4 [

	^ self buildButtonWithLabel: self buttonExample4Label
		andSelector: #actionExample4
		andColor: SKStylesheet secondaryColor
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LK 7/4/2024 19:12'
}
SKLandingPage >> buildButtonNew [

	^ self buildButtonWithLabel: self buttonNewLabel
		andSelector: #actionNew
		andColor: SKStylesheet primaryColor
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LM 4/28/2026 20:08'
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
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:17'
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
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKLandingPage >> buildConceptStack [

	| stack |
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
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKLandingPage >> buildContent [

	| row |
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
	row position: self position + ((self extent - row fullBounds extent) // 2)
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
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKLandingPage >> buildProjectStack [

	| stack |
	stack := SKButtonStack new.
	stack
		addButtonWithLabel: self buttonNewLabel
		target: self
		selector: #actionNew
		color: SKStylesheet primaryColor.
	self exampleProjects do: [:assoc |
		stack
			addButtonWithLabel: assoc key
			target: self
			selector: assoc value
			color: SKStylesheet secondaryColor].
	^ stack
]

{
	#category : #labels,
	#'squeak_changestamp' : 'LK 6/21/2024 22:53'
}
SKLandingPage >> buttonExample1Label [

	^ 'Example Project 1'
]

{
	#category : #labels,
	#'squeak_changestamp' : 'LK 6/21/2024 22:53'
}
SKLandingPage >> buttonExample2Label [

	^ 'Example Project 2'
]

{
	#category : #labels,
	#'squeak_changestamp' : 'LK 6/21/2024 22:53'
}
SKLandingPage >> buttonExample3Label [

	^ 'Example Project 3'
]

{
	#category : #labels,
	#'squeak_changestamp' : 'LM 5/7/2026 22:15'
}
SKLandingPage >> buttonExample4Label [

	^ 'Example Project 4'
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LK 7/4/2024 19:06'
}
SKLandingPage >> buttonHeight [

	^ 20 px
]

{
	#category : #labels,
	#'squeak_changestamp' : 'LK 6/21/2024 22:52'
}
SKLandingPage >> buttonNewLabel [

	^ 'New Blank Project'
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
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKLandingPage >> exampleProjects [

	^ {
		self buttonExample1Label -> #actionExample1.
		self buttonExample2Label -> #actionExample2.
		self buttonExample3Label -> #actionExample3.
		self buttonExample4Label -> #actionExample4
	}
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
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
