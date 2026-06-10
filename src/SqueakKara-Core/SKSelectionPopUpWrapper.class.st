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
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:58'
}
SKSelectionPopUpWrapper >> bringChildrenToFront [

	self selectionWindows do: [:each | each comeToFront].
	self closeButton comeToFront

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
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:58'
}
SKSelectionPopUpWrapper >> closeButton: aButton [

	closeButton := aButton
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:00'
}
SKSelectionPopUpWrapper >> drawSelectionWindows [

	self selectionWindows do: [:each | self addMorph: each]





]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:11'
}
SKSelectionPopUpWrapper >> initialize [

	| closeButton |

	super initialize. 
	
	self selectionWindows add: SKSelectionPopUp new. 
	self selectionWindows add: SKSelectionPopUp new. 
	
	self drawSelectionWindows. 
	
	self updatePositionsOfChildren. 
		
	closeButton := SimpleButtonMorph new.
	closeButton
		target: self;
		actionSelector: #actionClose.
	self closeButton: closeButton;
		addMorph: closeButton






]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:22'
}
SKSelectionPopUpWrapper >> makeVisible [

	self visible: true
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
