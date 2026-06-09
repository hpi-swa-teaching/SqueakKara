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
		'selectionWindows'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'LP 6/9/2026 13:16'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 15:32'
}
SKSelectionPopUpWrapper >> bringChildrenToFront [

self selectionWindows do: [:each | each comeToFront].

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/9/2026 15:26'
}
SKSelectionPopUpWrapper >> drawSelectionWindows [

self selectionWindows do: [:each | self addMorph: each].





]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/9/2026 16:07'
}
SKSelectionPopUpWrapper >> initialize [

super initialize. 


self selectionWindows add: SKSelectionPopUp new. 
self selectionWindows add: SKSelectionPopUp new. 

self drawSelectionWindows. 

self updatePositionsOfChildren. 






]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 15:22'
}
SKSelectionPopUpWrapper >> selectionWindows [
	(selectionWindows) ifNil:[self selectionWindows: OrderedCollection new]. 
	^ selectionWindows
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 15:21'
}
SKSelectionPopUpWrapper >> selectionWindows: anObject [
	selectionWindows := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 16:13'
}
SKSelectionPopUpWrapper >> switchToSelectedText: aSelectionPopUp [ 

|selectedValue oldPos|

oldPos := self position. 
self selectionWindows do: [:each |(each == aSelectionPopUp)ifTrue: [selectedValue := each selectedValue.  self replaceSubmorph: each by: (PluggableTextMorph new setText: selectedValue).]]. 
self position: oldPos. 
self updatePositionsOfChildren. 



]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 16:06'
}
SKSelectionPopUpWrapper >> updatePositionsOfChildren [
|newX newY|

(selectionWindows size =1 ) ifFalse: [
	1 to: (self selectionWindows size -1) do: [:each | newX:= ((self selectionWindows at: each) position x)+((self selectionWindows at: (each)) extent x). newY:= (self selectionWindows at: each) position y.  self selectionWindows at: (each+1) put: ((self selectionWindows at:(each+1)) position:(newX@newY))] "this is very idiomatic squeak code"
]


]
