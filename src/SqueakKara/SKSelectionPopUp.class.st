Class {
	#name : #SKSelectionPopUp,
	#superclass : #PluggableListMorph,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/9/2026 12:40'
}
SKSelectionPopUp >> handlesMouseDown: aEvent [ 

^ true 
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
	#'squeak_changestamp' : 'LP 6/9/2026 12:41'
}
SKSelectionPopUp >> mouseDown: aEvent [ 

#todo
.
]
