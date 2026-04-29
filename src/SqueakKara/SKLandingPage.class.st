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
	#'squeak_changestamp' : 'LK 6/21/2024 23:02'
}
SKLandingPage >> actionExample1 [

	SKEnvironment basicNew initializeWithChallenge1.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'KD 6/23/2024 20:59'
}
SKLandingPage >> actionExample2 [

	SKEnvironment basicNew initializeWithChallenge2.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'KD 6/23/2024 20:59'
}
SKLandingPage >> actionExample3 [

	SKEnvironment basicNew initializeWithChallenge3.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'mr 4/29/2026 13:08'
}
SKLandingPage >> actionExample4 [

	SKEnvironment basicNew initializeWithChallenge4.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:01'
}
SKLandingPage >> actionNew [

	SKEnvironment newWithKaraAt: 1 @ 1.
	self delete
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'mr 4/29/2026 13:09'
}
SKLandingPage >> addAllButtons [

	self addButton: self buildButtonNew atIndex: 0.
	
	self addButton: self buildButtonExample1 atIndex: 1.
	self addButton: self buildButtonExample2 atIndex: 2.
	self addButton: self buildButtonExample3 atIndex: 3.
	self addButton: self buildButtonExample4 atIndex: 4.
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'mr 4/29/2026 13:23'
}
SKLandingPage >> addButton: aButton atIndex: anInteger [
	
	| newX newY topOffset |
	self addMorph: aButton.
	
	newX := self center x - (aButton width / 2).
	topOffset := 100.
	newY := self position y + (2 * aButton height * anInteger) + topOffset.
	
	aButton position: (newX @ newY)
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
	#'squeak_changestamp' : 'mr 4/29/2026 13:08'
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
	#'squeak_changestamp' : 'LK 7/4/2024 19:07'
}
SKLandingPage >> buildButtonWithLabel: aLabel andSelector: aSelector andColor: aColor [

	^ SimpleButtonMorph new
		    label: aLabel;
		    target: self;
		    actionSelector: aSelector;
		    color: aColor;
		    height: self buttonHeight
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
	#'squeak_changestamp' : 'mr 4/29/2026 13:11'
}
SKLandingPage >> buttonExample4Label [

	^ 'Example Project 4 with 2 Karas'
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
	#'squeak_changestamp' : 'mr 4/29/2026 13:11'
}
SKLandingPage >> defaultExtent [

	^ 250 px @ 250 px
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
