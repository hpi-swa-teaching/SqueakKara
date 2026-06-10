"
A SKSelectionPopUpWrapper is not a Wrapper in the SWA sense.

Instance Variables
	isLeftSelected:		<Object>
	isRightSelected:		<Object>
	left:		<Object>
	right:		<Object>

isLeftSelected
	- xxxxx

isRightSelected
	- xxxxx

left
	- xxxxx

right
	- xxxxx

"
Class {
	#name : #SKSelectionPopUpWrapper,
	#superclass : #Morph,
	#instVars : [
		'selectionWindows',
		'closeButton'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'LP 6/9/2026 13:16'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:11'
}
SKSelectionPopUpWrapper >> actionClose [

	self visible: false
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:21'
}
SKSelectionPopUpWrapper >> actionGetCommand [

	^ self getValueByType: #command
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:54'
}
SKSelectionPopUpWrapper >> actionGetCondition [

	^ self getValueByType: #condition
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:58'
}
SKSelectionPopUpWrapper >> bringChildrenToFront [

	self selectionWindows do: [:each | each comeToFront].
	self closeButton comeToFront

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:06'
}
SKSelectionPopUpWrapper >> buildCloseButton [

	| closeButton |

	closeButton := (SimpleButtonMorph new
		target: self;
		actionSelector: #actionClose;
		height: self closeButtonHeight;
		width: self closeButtonWidth;
		color: self closeButtonColor;
		label: 'close X'; 
		position: self position - (0 @ self closeButtonHeight);
		yourself).
	self closeButton: closeButton;
		addMorph: closeButton

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:58'
}
SKSelectionPopUpWrapper >> closeButton [

	^ closeButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:00'
}
SKSelectionPopUpWrapper >> closeButton: aButton [

	closeButton := aButton.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:05'
}
SKSelectionPopUpWrapper >> closeButtonColor [

	^ SKStylesheet colorRed
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:05'
}
SKSelectionPopUpWrapper >> closeButtonHeight [

	^ 50
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:05'
}
SKSelectionPopUpWrapper >> closeButtonWidth [

	^ 100
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:20'
}
SKSelectionPopUpWrapper >> commandList [

	^ #(
		'kara move'
		'kara turn: left'
		'kara turn: right'
		'None'
	)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:20'
}
SKSelectionPopUpWrapper >> conditionList [

	^ #(
		'kara onCloverleaf'
		'kara isTrunkAhead'
		'None'
	)
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:00'
}
SKSelectionPopUpWrapper >> drawSelectionWindows [

	self selectionWindows do: [:each | self addMorph: each]





]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:21'
}
SKSelectionPopUpWrapper >> getValueByType: aType [
	
	| commandWindow |
	
	commandWindow := self selectionWindows detect: [:aSelectionWindow | aSelectionWindow type = aType].
	commandWindow selectedValue ifNil: [^ ''].
	commandWindow = 'None' ifTrue: [^ ''].
	^ commandWindow selectedValue
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:18'
}
SKSelectionPopUpWrapper >> initialize [

	super initialize. 
	
	self selectionWindows
		add: (SKSelectionPopUp newWithType: #condition listItems: self conditionList);
		add: (SKSelectionPopUp newWithType: #command listItems: self commandList).
		
	self drawSelectionWindows;
		updatePositionsOfChildren;
		buildCloseButton;
		visible: false





]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:11'
}
SKSelectionPopUpWrapper >> makeVisible [

	self visible: true.
	self comeToFront
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:59'
}
SKSelectionPopUpWrapper >> selectionWindows [

	(selectionWindows) ifNil:[self selectionWindows: OrderedCollection new]. 
	^ selectionWindows
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:59'
}
SKSelectionPopUpWrapper >> selectionWindows: anObject [

	selectionWindows := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:01'
}
SKSelectionPopUpWrapper >> switchToSelectedText: aSelectionPopUp [ 

	|selectedValue oldPos|
	
	oldPos := self position. 
	self selectionWindows do: [:each |(each == aSelectionPopUp)ifTrue: [selectedValue := each selectedValue.  self replaceSubmorph: each by: (PluggableTextMorph new setText: selectedValue). ]]. 
	self position: oldPos. 
	self updatePositionsOfChildren



]

{
	#category : #updating,
	#'squeak_changestamp' : 'LP 6/9/2026 16:06'
}
SKSelectionPopUpWrapper >> updatePositionsOfChildren [
|newX newY|

(selectionWindows size =1 ) ifFalse: [
	1 to: (self selectionWindows size -1) do: [:each | newX:= ((self selectionWindows at: each) position x)+((self selectionWindows at: (each)) extent x). newY:= (self selectionWindows at: each) position y.  self selectionWindows at: (each+1) put: ((self selectionWindows at:(each+1)) position:(newX@newY))] "this is very idiomatic squeak code"
]


]
