"
SKExecuteContext stores bindings for variables that can be used in the SKWorkspace and is used to compile the code written by the user.
"
Class {
	#name : #SKExecuteContext,
	#superclass : #Object,
	#instVars : [
		'kara',
		'right',
		'left'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:41'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/12/2024 12:26'
}
SKExecuteContext class >> create: aKara [

	self basicNew.
	self kara: aKara.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'KD 6/12/2024 12:35'
}
SKExecuteContext >> initialize [
		
	left := 'left'.
	right := 'right'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:40'
}
SKExecuteContext >> kara: anObject [
	
	kara := anObject
]
