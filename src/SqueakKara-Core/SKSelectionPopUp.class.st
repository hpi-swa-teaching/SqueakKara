Class {
	#name : #SKSelectionPopUp,
	#superclass : #PluggableListMorph,
	#instVars : [
		'selectedValue',
		'index'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #inputHandling,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:53'
}
SKSelectionPopUp >> handlesMouseDown: aEvent [ 
	
	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:56'
}
SKSelectionPopUp >> initialize [

	super initialize. 
	
	self getListElementSelector.
	self updateList: #(#hallo #test #well #no #squeak).
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
	#'squeak_changestamp' : 'LP 6/9/2026 13:34'
}
SKSelectionPopUp >> selectedValue [
	^ selectedValue
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 13:34'
}
SKSelectionPopUp >> selectedValue: anObject [
	selectedValue := anObject
]
