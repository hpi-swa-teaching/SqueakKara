Class {
	#name : #SKSelectionPopUp,
	#superclass : #Morph,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/3/2026 01:59'
}
SKSelectionPopUp >> initialize [

|l|

l := PluggableListMorph new.
l updateList: #(#hallo #hallosdf  #ne).
l update: #wtf. 

l openInWorld. 

]
