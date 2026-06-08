Class {
	#name : #SKSelectionPopUp,
	#superclass : #PluggableMultiColumnListMorph,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/8/2026 20:34'
}
SKSelectionPopUp >> handlesMouseDown: anEvent [ 

 ^ true. 





]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/8/2026 20:56'
}
SKSelectionPopUp >> initialize [

super initialize. 
self getListElementSelector.
self updateList: #(#(#hallo #pls ) #(#ha #wha #as) #(#what #the #hell)).
self updateListMorph. 
self updateColumns.  "for now everything gets truncated to one length wtf dude apparantly its the length of the first one "





]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/8/2026 20:35'
}
SKSelectionPopUp >> mouseDown: anEvent [ 

	Transcript show: 'button pressed'. 


]
