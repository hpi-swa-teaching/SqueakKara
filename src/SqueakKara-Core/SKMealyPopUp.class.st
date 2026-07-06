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
	#name : #SKMealyPopUp,
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
SKMealyPopUp >> actionClose [

	self visible: false
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars 7/7/2026 10:53'
}
SKMealyPopUp >> actionSetCommand: aCommand [

	self edge command: (self formatItem: aCommand)
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars 7/7/2026 10:53'
}
SKMealyPopUp >> actionSetCondition: aCondition [

	self edge condition: (self formatItem: aCondition)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:10'
}
SKMealyPopUp >> addSelectionModel: aModel [

	self selectionModels add: aModel
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:58'
}
SKMealyPopUp >> bringChildrenToFront [

	self selectionWindows do: [:each | each comeToFront].
	self closeButton comeToFront

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:51'
}
SKMealyPopUp >> buildCloseButton [

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
SKMealyPopUp >> closeButton [

	^ closeButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/23/2026 21:38'
}
SKMealyPopUp >> closeButton: aButton [

	closeButton := aButton
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:05'
}
SKMealyPopUp >> closeButtonColor [

	^ SKStylesheet colorRed
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:05'
}
SKMealyPopUp >> closeButtonHeight [

	^ 50
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:05'
}
SKMealyPopUp >> closeButtonWidth [

	^ 100
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 15:24'
}
SKMealyPopUp >> commandList [

	^ #(
		'kara move'
		'kara turn: left'
		'kara turn: right'
		'kara push'
		'None'
	)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 15:25'
}
SKMealyPopUp >> conditionList [

	^ #(
		'kara onCloverleaf'
		'kara trunkAhead'
		'kara mushroomAhead'
		'None'
	)
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:00'
}
SKMealyPopUp >> drawSelectionWindows [

	self selectionWindows do: [:each | self addMorph: each]





]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:49'
}
SKMealyPopUp >> edge [

	^ edge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/23/2026 21:38'
}
SKMealyPopUp >> edge: anEdge [

	edge := anEdge
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 10:52'
}
SKMealyPopUp >> formatItem: aItem [

	aItem ifNil: [^ ''].
	aItem = 'None' ifTrue: [^ ''].
	^ aItem
]

{
	#category : #events,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:17'
}
SKMealyPopUp >> handleCloseButtonClicked [

	self edge actionDeselect

	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars 7/7/2026 10:46'
}
SKMealyPopUp >> initialize [

	super initialize. 

	self
		addSelectionModel: (SKSelectionModel newWithType: #condition andItems: self conditionList andPopUp: self);
		addSelectionModel: (SKSelectionModel newWithType: #command andItems: self commandList andPopUp: self).
	
	self selectionModels do: [:aModel| self selectionWindows add: (PluggableListMorph on: aModel list: #items selected: #selectedIndex changeSelected: #itemSelectedAtIndex:)].
		
	self drawSelectionWindows;
		updatePositionsOfChildren;
		buildCloseButton;
		color: Color transparent





]

{
	#category : #events,
	#'squeak_changestamp' : 'Lars 7/7/2026 10:41'
}
SKMealyPopUp >> itemClicked: aItem byType: aType [

	aType caseOf: {
		[#command] -> [self actionSetCommand: aItem].
		[#condition]  -> [self actionSetCondition: aItem]
	} otherwise: []
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:11'
}
SKMealyPopUp >> makeVisible [

	self visible: true.
	self comeToFront
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:09'
}
SKMealyPopUp >> selectionModels [

	^ selectionModels ifNil: [selectionModels := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:59'
}
SKMealyPopUp >> selectionWindows [

	(selectionWindows) ifNil:[self selectionWindows: OrderedCollection new]. 
	^ selectionWindows
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:59'
}
SKMealyPopUp >> selectionWindows: anObject [

	selectionWindows := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:26'
}
SKMealyPopUp >> updatePositionsOfChildren [

	|newX newY|
	
	(selectionWindows size =1 ) ifFalse: [
		1 to: (self selectionWindows size -1) do: [:each | 
			newX:= ((self selectionWindows at: each) position x) + ((self selectionWindows at: each) extent x). 
			newY:= (self selectionWindows at: each) position y.  
			self selectionWindows at: (each + 1) put: ((self selectionWindows at: (each + 1)) position: (newX @ newY))]]


]
