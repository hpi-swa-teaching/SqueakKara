Class {
	#name : #SKSelectionPopUp,
	#superclass : #PluggableListMorph,
	#instVars : [
		'selectedValue',
		'index',
		'type'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:54'
}
SKSelectionPopUp class >> newWithType: aType [

	^ (self new
		type: aType;
		yourself)
]

{
	#category : #constructor,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:16'
}
SKSelectionPopUp class >> newWithType: aType listItems: aListItemArray [

	^ (self new
		type: aType;
		updateList: aListItemArray;
		yourself)
]

{
	#category : #inputHandling,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:53'
}
SKSelectionPopUp >> handlesMouseDown: aEvent [ 
	
	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:16'
}
SKSelectionPopUp >> initialize [

	super initialize. 
	
	self getListElementSelector.
	self updateListMorph
]

{
	#category : #inputHandling,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:53'
}
SKSelectionPopUp >> mouseDown: anEvent [

	|itemClicked|
	
	itemClicked := self itemAt: (self rowAtLocation: anEvent position). 
	 [itemClicked] ifNotNil: [self selectedValue: itemClicked. self owner switchToSelectedText: self]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:51'
}
SKSelectionPopUp >> selectedValue [

	^ selectedValue
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:51'
}
SKSelectionPopUp >> selectedValue: anObject [

	selectedValue := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:48'
}
SKSelectionPopUp >> type [
	
	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:48'
}
SKSelectionPopUp >> type: aType [

	type := aType
]
