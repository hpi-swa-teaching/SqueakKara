"
SKLandingPage provides a user interface for the user to select either a blank work environment or one of the provided example problems. It is the first page the user sees.
"
Class {
	#name : #SKLandingPage,
	#superclass : #SystemWindow,
	#instVars : [
		'selectedConcept',
		'conceptButtons'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 16:01'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:17'
}
SKLandingPage >> actionConceptSelected: aIndex [

	self selectedConcept: aIndex.
	self conceptButtons do: [:aButton | aButton color: self conceptSelectionButtonNormalColor].
	(self conceptButtons at: (self selectedConcept)) color: self conceptSelectionButtonSelectedColor
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
	#'squeak_changestamp' : 'JS 5/27/2026 21:50'
}
SKLandingPage >> actionNew [

	self buildEnvironment initializeWithKaraAt: 1 @ 1.
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
	#category : #conceptSelection,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:19'
}
SKLandingPage >> buildEnvironment [ 

	^ SKEnvironment newWithProgrammingConcept: (self concepts at: self selectedConcept)
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
	#category : #conceptSelection,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:42'
}
SKLandingPage >> concepts [

	^ { SKProgrammingConceptCode new. SKProgrammingConceptBlocks new. SKProgrammingConceptMealy new}
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 20:42'
}
SKLandingPage >> defaultExtent [

	^ 350 px @ 200 px
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 21:18'
}
SKLandingPage >> initialize [

	super initialize.
	
	self setLabel: self windowTitle;
		openInHand;
		extent: self defaultExtent;
		addAllButtons;
		buildConceptSelection;
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
