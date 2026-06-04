"
SKLandingPage provides a user interface for the user to select either a blank work environment or one of the provided example problems. It is the first page the user sees.
"
Class {
	#name : #SKLandingPage,
	#superclass : #SystemWindow,
	#category : #SqueakKara,
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
	#'squeak_changestamp' : 'AB 5/24/2026 14:56'
}
SKLandingPage >> actionExample5 [

	SKEnvironment new initializeWithChallenge5.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'AB 6/2/2026 14:44'
}
SKLandingPage >> actionExample6 [

	SKEnvironment new initializeWithChallenge6.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JanWein 6/4/2026 10:10'
}
SKLandingPage >> actionExample7 [

	SKEnvironment new initializeWithChallenge7.
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
	#'squeak_changestamp' : 'AB 5/27/2026 15:30'
}
SKLandingPage >> addAllButtons [

	self buildAllButtons doWithIndex: [ :button :index |
		self addButton: button atIndex: index - 1 ]
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
	#'squeak_changestamp' : 'JanWein 6/4/2026 10:11'
}
SKLandingPage >> buildAllButtons [

	^ OrderedCollection newFrom: {
		self buildButtonNew.
		self buildButtonExample1.
		self buildButtonExample2.
		self buildButtonExample3.
		self buildButtonExample4.
		self buildButtonExample5.
		self buildButtonExample6.
		self buildButtonExample7.}
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
	#'squeak_changestamp' : 'AB 5/24/2026 14:57'
}
SKLandingPage >> buildButtonExample5 [

	^ self buildButtonWithLabel: self buttonExample5Label
		andSelector: #actionExample5
		andColor: SKStylesheet secondaryColor
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'AB 6/2/2026 14:43'
}
SKLandingPage >> buildButtonExample6 [

	^ self buildButtonWithLabel: self buttonExample6Label
		andSelector: #actionExample6
		andColor: SKStylesheet secondaryColor
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'JanWein 6/4/2026 10:12'
}
SKLandingPage >> buildButtonExample7 [

	^ self buildButtonWithLabel: self buttonExample7Label
		andSelector: #actionExample7
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
	#category : #labels,
	#'squeak_changestamp' : 'AB 5/24/2026 14:57'
}
SKLandingPage >> buttonExample5Label [

	^ 'Example Project 5'
]

{
	#category : #labels,
	#'squeak_changestamp' : 'AB 6/2/2026 14:43'
}
SKLandingPage >> buttonExample6Label [

	^ 'Example Project 6'
]

{
	#category : #labels,
	#'squeak_changestamp' : 'JanWein 6/4/2026 10:12'
}
SKLandingPage >> buttonExample7Label [

	^ 'Example Project 7'
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
	#'squeak_changestamp' : 'AB 6/2/2026 20:31'
}
SKLandingPage >> defaultExtent [

	| buttonSlotHeight totalHeight buttonCount |
    
	buttonCount := self buildAllButtons size.
	buttonSlotHeight := self buttonHeight + 10.
	totalHeight := 50 + (buttonSlotHeight * buttonCount) + 60.
    
	^ 300 px @ totalHeight
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'AB 6/2/2026 20:28'
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
