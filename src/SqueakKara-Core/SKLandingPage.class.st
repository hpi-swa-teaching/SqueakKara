"
SKLandingPage provides a user interface for the user to select either a blank work environment or one of the provided example problems. It is the first page the user sees.
"
Class {
	#name : #SKLandingPage,
	#superclass : #SystemWindow,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 16:01'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'LM 5/7/2026 22:07'
}
SKLandingPage >> actionExample1 [

	SKEnvironment new initializeWithChallenge1.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'LM 5/7/2026 22:07'
}
SKLandingPage >> actionExample2 [

	SKEnvironment new initializeWithChallenge2.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'LM 5/7/2026 22:09'
}
SKLandingPage >> actionExample3 [

	SKEnvironment new initializeWithChallenge3.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'LM 5/7/2026 22:15'
}
SKLandingPage >> actionExample4 [

	SKEnvironment new initializeWithChallenge4.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 20:24'
}
SKLandingPage >> actionNew [

	SKEnvironment new initializeWithKaraAt: 1 @ 1
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
	#'squeak_changestamp' : 'LM 5/7/2026 22:20'
}
SKLandingPage >> addButton: aButton atIndex: anInteger [

	| yOffset basePosition |
	
	self addMorph: aButton.
	
	yOffset := (aButton height + 10) * (anInteger - 1).
	
	basePosition := self center
		- (aButton width / 2)
		+ (0 @ 50).
	
	aButton position: basePosition + (0 @ yOffset)
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
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/7/2026 22:17'
}
SKLandingPage >> defaultExtent [

	^ 200 px @ 200 px
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 6/21/2024 22:53'
}
SKLandingPage >> initialize [

	super initialize.
	
	self setLabel: self windowTitle;
		openInHand;
		extent: self defaultExtent;
		addAllButtons
]

{
	#category : #labels,
	#'squeak_changestamp' : 'LK 6/21/2024 22:44'
}
SKLandingPage >> windowTitle [

	^ 'SqueakKara'
]
