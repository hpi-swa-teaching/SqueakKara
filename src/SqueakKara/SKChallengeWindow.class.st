Class {
	#name : #SKChallengeWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'windowManager'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'open/close',
	#'squeak_changestamp' : 'JS 5/17/2026 12:42'
}
SKChallengeWindow >> closeBoxHit [
	self windowManager buildConfirmationWindow.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 5/17/2026 12:22'
}
SKChallengeWindow >> initialize [
	super initialize.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/17/2026 12:41'
}
SKChallengeWindow >> windowManager [
	^ windowManager
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/17/2026 12:41'
}
SKChallengeWindow >> windowManager: anObject [
	windowManager := anObject
]
