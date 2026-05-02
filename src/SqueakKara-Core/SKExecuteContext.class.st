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
	#'squeak_changestamp' : 'LM 4/28/2026 20:38'
}
SKExecuteContext >> initialize [
		
	self
		left: SKDirection rotateLeft;
		right: SKDirection rotateRight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:40'
}
SKExecuteContext >> kara [

	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 5/2/2026 19:01'
}
SKExecuteContext >> kara: aKara [
	
	kara := aKara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:40'
}
SKExecuteContext >> left [

	^ left
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:40'
}
SKExecuteContext >> left: aDirection [

	left := aDirection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:40'
}
SKExecuteContext >> right [

	^ right
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:40'
}
SKExecuteContext >> right: aDirection [

	right := aDirection
]
