"
SKExecuteContext stores bindings for variables that can be used in the SKWorkspace and is used to compile the code written by the user.

Instance Variables
	kara:		<SKKara>
	left: 		<SKDirection>
	right:		<SKDirection>

kara
	- Stores the Kara.

left
	- The rotation of left.

right
	- The rotation of right.
"
Class {
	#name : #SKExecuteContext,
	#superclass : #Object,
	#instVars : [
		'kara',
		'right',
		'left'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JanWein 7/5/2026 13:03'
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
	#'squeak_changestamp' : 'LM 4/28/2026 20:39'
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
