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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/9/2026 13:26'
}
SKSelectionPopUp >> handlesMouseDown: aEvent [ 

^ true. 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 13:39'
}
SKSelectionPopUp >> index [
	^ index
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 13:39'
}
SKSelectionPopUp >> index: anObject [
	index := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/9/2026 12:41'
}
SKSelectionPopUp >> initialize [

super initialize. 

self getListElementSelector.
self updateList: #(#hallo #test #well #no #squeak).
self updateListMorph.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/9/2026 13:39'
}
SKSelectionPopUp >> mouseDown: anEvent [

	|itemClicked|
	
	itemClicked := self itemAt: (self rowAtLocation: anEvent position). 
	 [itemClicked] ifNotNil: [self selectedValue: itemClicked. self owner switchToSelectedText: self index.].
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
