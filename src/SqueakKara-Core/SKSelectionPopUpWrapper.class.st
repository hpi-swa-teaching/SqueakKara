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
		'closeButton',
		'edge',
		'selectionModels'
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
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:10'
}
SKSelectionPopUpWrapper >> addSelectionModel: aModel [

	self selectionModels add: aModel
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
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:51'
}
SKSelectionPopUpWrapper >> buildCloseButton [

	| closeButton |

	closeButton := (SimpleButtonMorph new
		target: self;
		actionSelector: #handleCloseButtonClicked;
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
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:51'
}
SKSelectionPopUpWrapper >> conditionList [

	^ #(
		'kara onCloverleaf'
		'kara trunkAhead'
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
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:49'
}
SKSelectionPopUpWrapper >> edge [

	^ edge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:49'
}
SKSelectionPopUpWrapper >> edge: aEdge [

	edge := aEdge
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:25'
}
SKSelectionPopUpWrapper >> getValueByType: aType [
	
	| model |
	
	model := self selectionModels detect: [:aSelectionModel | aSelectionModel type = aType].
	model selectedValue ifNil: [^ ''].
	model selectedValue = 'None' ifTrue: [^ ''].
	^ model selectedValue
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:50'
}
SKSelectionPopUpWrapper >> handleCloseButtonClicked [

	self edge gotDeselected

	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:15'
}
SKSelectionPopUpWrapper >> initialize [

	super initialize. 
	
	self
		addSelectionModel: (SKSelectionModel newWithType: #condition andItems: self conditionList);
		addSelectionModel: (SKSelectionModel newWithType: #command andItems: self commandList).
	
	self selectionModels do: [:aModel| self selectionWindows add: (PluggableListMorph on: aModel list: #items selected: #selectedIndex changeSelected: #itemSelectedAtIndex:)].
		
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
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:09'
}
SKSelectionPopUpWrapper >> selectionModels [

	^ selectionModels ifNil: [selectionModels := OrderedCollection new]
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
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:26'
}
SKSelectionPopUpWrapper >> updatePositionsOfChildren [

	|newX newY|
	
	(selectionWindows size =1 ) ifFalse: [
		1 to: (self selectionWindows size -1) do: [:each | 
			newX:= ((self selectionWindows at: each) position x) + ((self selectionWindows at: each) extent x). 
			newY:= (self selectionWindows at: each) position y.  
			self selectionWindows at: (each + 1) put: ((self selectionWindows at: (each + 1)) position: (newX @ newY))]]


]
