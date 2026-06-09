Class {
	#name : #SKSelectionPopUpWrapper,
	#superclass : #Morph,
	#instVars : [
		'left',
		'right',
		'isLeftSelected',
		'isRightSelected'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 12:51'
}
SKSelectionPopUpWrapper >> bringChildrenToFront [

self right bringToFront.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/8/2026 20:34'
}
SKSelectionPopUpWrapper >> handlesMouseDown: anEvent [ 

 ^ true. 





]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/9/2026 12:49'
}
SKSelectionPopUpWrapper >> initialize [

super initialize. 
self hide. 

self left: SKSelectionPopUp new. 
self right: SKSelectionPopUp new.
self addMorph: self left.
self addMorph: self right. 







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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/8/2026 20:35'
}
SKSelectionPopUpWrapper >> mouseDown: anEvent [ 

	Transcript show: 'button pressed'. 


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
