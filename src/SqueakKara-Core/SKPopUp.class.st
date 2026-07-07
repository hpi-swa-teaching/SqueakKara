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
	#name : #SKPopUp,
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
SKPopUp >> actionClose [

	self visible: false
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:21'
}
SKPopUp >> actionGetCommand [

	^ self getValueByType: #command
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:54'
}
SKPopUp >> actionGetCondition [

	^ self getValueByType: #condition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:10'
}
SKPopUp >> addSelectionModel: aModel [

	self selectionModels add: aModel
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:58'
}
SKPopUp >> bringChildrenToFront [

	self selectionWindows do: [:each | each comeToFront].
	self closeButton comeToFront

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:51'
}
SKPopUp >> buildCloseButton [

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
SKPopUp >> closeButton [

	^ closeButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/23/2026 21:38'
}
SKPopUp >> closeButton: aButton [

	closeButton := aButton
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:05'
}
SKPopUp >> closeButtonColor [

	^ SKStylesheet colorRed
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:05'
}
SKPopUp >> closeButtonHeight [

	^ 50
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:05'
}
SKPopUp >> closeButtonWidth [

	^ 100
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 15:24'
}
SKPopUp >> commandList [

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
SKPopUp >> conditionList [

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
SKPopUp >> drawSelectionWindows [

	self selectionWindows do: [:each | self addMorph: each]





]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:49'
}
SKPopUp >> edge [

	^ edge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/23/2026 21:38'
}
SKPopUp >> edge: anEdge [

	edge := anEdge
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:25'
}
SKPopUp >> getValueByType: aType [
	
	| model |
	
	model := self selectionModels detect: [:aSelectionModel | aSelectionModel type = aType].
	model selectedValue ifNil: [^ ''].
	model selectedValue = 'None' ifTrue: [^ ''].
	^ model selectedValue
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:17'
}
SKPopUp >> handleCloseButtonClicked [

	self edge actionDeselect

	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 6/23/2026 21:37'
}
SKPopUp >> initialize [

	super initialize. 

	self
		addSelectionModel: (SKSelectionModel newWithType: #condition andItems: self conditionList);
		addSelectionModel: (SKSelectionModel newWithType: #command andItems: self commandList).
	
	self selectionModels do: [:aModel| self selectionWindows add: (PluggableListMorph on: aModel list: #items selected: #selectedIndex changeSelected: #itemSelectedAtIndex:)].
		
	self drawSelectionWindows;
		updatePositionsOfChildren;
		buildCloseButton;
		color: Color transparent





]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:11'
}
SKPopUp >> makeVisible [

	self visible: true.
	self comeToFront
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:09'
}
SKPopUp >> selectionModels [

	^ selectionModels ifNil: [selectionModels := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:59'
}
SKPopUp >> selectionWindows [

	(selectionWindows) ifNil:[self selectionWindows: OrderedCollection new]. 
	^ selectionWindows
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:59'
}
SKPopUp >> selectionWindows: anObject [

	selectionWindows := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:26'
}
SKPopUp >> updatePositionsOfChildren [

	|newX newY|
	
	(selectionWindows size =1 ) ifFalse: [
		1 to: (self selectionWindows size -1) do: [:each | 
			newX:= ((self selectionWindows at: each) position x) + ((self selectionWindows at: each) extent x). 
			newY:= (self selectionWindows at: each) position y.  
			self selectionWindows at: (each + 1) put: ((self selectionWindows at: (each + 1)) position: (newX @ newY))]]


]
