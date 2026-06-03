"
SKChallengeWindow provides a standard SystemWindow with an additional confirmation when closing it.
"
Class {
	#name : #SKChallengeWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'windowManager'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JS 5/26/2026 14:48'
}

{
	#category : #'open/close',
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:08'
}
SKChallengeWindow >> closeBoxHit [

	self windowManager buildConfirmationWindow
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:08'
}
SKChallengeWindow >> initialize [

	super initialize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:07'
}
SKChallengeWindow >> windowManager [

	^ windowManager
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:08'
}
SKChallengeWindow >> windowManager: anObject [

	windowManager := anObject
]
