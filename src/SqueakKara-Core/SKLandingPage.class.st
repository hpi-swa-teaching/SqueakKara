Class {
	#name : #SKLandingPage,
	#superclass : #SystemWindow,
	#category : #'SqueakKara-Core'
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
	#'squeak_changestamp' : 'LK 6/21/2024 23:02'
}
SKLandingPage >> actionExample2 [

	SKEnvironment basicNew initializeWithChallenge1.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'LK 6/21/2024 23:02'
}
SKLandingPage >> actionExample3 [

	SKEnvironment basicNew initializeWithChallenge1.
	self delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'LK 6/21/2024 23:01'
}
SKLandingPage >> actionNew [

	SKEnvironment newWithKaraAt: 1@1.
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
	#'squeak_changestamp' : 'LK 6/21/2024 22:52'
}
SKLandingPage >> addButton: aButton atIndex: anInteger [

	| anOffset |

	self addMorph: aButton.
	
	anOffset := 2 * aButton height * anInteger.
	
	aButton position: self center - (aButton width / 2) + (0 @ anOffset).
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LK 6/21/2024 23:02'
}
SKLandingPage >> buildButtonExample1 [

	^ SimpleButtonMorph new
		    label: self buttonExample1Label;
		    target: self;
		    actionSelector: #actionExample1;
		    color: Color lightGray
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LK 6/21/2024 23:02'
}
SKLandingPage >> buildButtonExample2 [

	^ SimpleButtonMorph new
		    label: self buttonExample2Label;
		    target: self;
		    actionSelector: #actionExample2;
		    color: Color lightGray
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LK 6/21/2024 23:02'
}
SKLandingPage >> buildButtonExample3 [

	^ SimpleButtonMorph new
		    label: self buttonExample3Label;
		    target: self;
		    actionSelector: #actionExample3;
		    color: Color lightGray
]

{
	#category : #buttons,
	#'squeak_changestamp' : 'LK 6/21/2024 23:01'
}
SKLandingPage >> buildButtonNew [

	^ SimpleButtonMorph new
		    label: self buttonNewLabel;
		    target: self;
		    actionSelector: #actionNew.
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
