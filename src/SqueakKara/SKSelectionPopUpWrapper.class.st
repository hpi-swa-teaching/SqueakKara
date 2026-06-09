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
		'left',
		'right',
		'isLeftSelected',
		'isRightSelected'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'LP 6/9/2026 13:16'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 12:52'
}
SKSelectionPopUpWrapper >> bringChildrenToFront [

self right comeToFront.
self left comeToFront. 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/9/2026 13:40'
}
SKSelectionPopUpWrapper >> initialize [

super initialize. 

self left: SKSelectionPopUp new. 
self right: SKSelectionPopUp new.
self addMorph: self left.
self addMorph: self right. 
self left index: 0.
self right index: 1. 
self right position: (self left extent x@0).
self extent: (self left extent x + self right extent x @ (self left extent y max: self right extent y))







]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 12:43'
}
SKSelectionPopUpWrapper >> isLeftSelected [
	^ isLeftSelected
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 12:43'
}
SKSelectionPopUpWrapper >> isLeftSelected: anObject [
	isLeftSelected := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 12:43'
}
SKSelectionPopUpWrapper >> isRightSelected [
	^ isRightSelected
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 12:43'
}
SKSelectionPopUpWrapper >> isRightSelected: anObject [
	isRightSelected := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 12:43'
}
SKSelectionPopUpWrapper >> left [
	^ left
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 12:43'
}
SKSelectionPopUpWrapper >> left: anObject [
	left := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 12:43'
}
SKSelectionPopUpWrapper >> right [
	^ right
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 12:43'
}
SKSelectionPopUpWrapper >> right: anObject [
	right := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 13:43'
}
SKSelectionPopUpWrapper >> switchToSelectedText: aIndex [ 
"we need to replace the pane of the text morph with a text morph containing the selectedValue of that Selection Pop UP "
|selectedValue |

(aIndex ==0) ifTrue:[selectedValue := self left selectedValue. ].
(aIndex == 1) ifTrue:[selectedValue := self right selectedValue. ]
]
