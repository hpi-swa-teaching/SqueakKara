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
	#'squeak_changestamp' : 'JJG 7/1/2024 15:01'
}
SKLandingPage >> actionNew [

	SKEnvironment newWithKaraAt: 1 @ 1.
	self delete
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LK 6/21/2024 22:55'
}
SKLandingPage >> addAllButtons [

	self addButton: self buildButtonNew atIndex: 0.
	
	self addButton: self buildButtonExample1 atIndex: 1.
	self addButton: self buildButtonExample2 atIndex: 2.
	self addButton: self buildButtonExample3 atIndex: 3.
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LK 7/4/2024 19:01'
}
SKLandingPage >> addButton: aButton atIndex: anInteger [

	| anOffset |

	self addMorph: aButton.
	
	anOffset := 2 * aButton height * anInteger.
	
	aButton position: self center - (aButton width / 2) + (0 @ anOffset)
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
	#'squeak_changestamp' : 'LK 6/21/2024 22:53'
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
