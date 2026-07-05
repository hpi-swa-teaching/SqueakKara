"
SKExecuteContext stores bindings for variables that can be used in the SKWorkspace and is used to compile the code written by the user.
"
Class {
	#name : #SKExecuteContext,
	#superclass : #Object,
	#instVars : [
		'kara',
		'right',
		'left',
		'env'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:41'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:42'
}
SKExecuteContext >> env [

	^ env
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 21:04'
}
SKExecuteContext >> env: aDictonary [

	env := aDictonary
]

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
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 13:02'
}
SKExecuteContext >> kara: aGridObject [
	
	kara := aGridObject
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
