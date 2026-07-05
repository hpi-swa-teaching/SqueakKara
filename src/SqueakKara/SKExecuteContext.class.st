"
SKExecuteContext stores bindings for variables that can be used in the SKWorkspace and is used to compile the code written by the user. Repaces the rotate: left/right by the SKDirection.

Instance Variables
	kara:		<SKKaraProxy>
	left: 		<SKDirection>
	right:		<SKDirection>

kara
	- Stores the kara.

left
	- The rotation to the left.

right
	- The rotation to the right.
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
	#'squeak_changestamp' : 'ND 7/5/2026 13:26'
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
