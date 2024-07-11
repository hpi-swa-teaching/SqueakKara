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
	#category : #initialization,
	#'squeak_changestamp' : 'EB 7/11/2024 15:20'
}
SKExecuteContext >> initialize [
		
	left := SKDirection rotateLeft.
	right := SKDirection rotateRight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:40'
}
SKExecuteContext >> kara: anObject [
	
	kara := anObject
]
