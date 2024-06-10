Class {
	#name : #SKKara,
	#superclass : #SKGridObject,
	#instVars : [
		'doneReceiver'
	],
	#category : #SqueakKara
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/10/2024 22:23'
}
SKKara >> doneReceiver [
	^ doneReceiver
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/10/2024 22:23'
}
SKKara >> doneReceiver: anObject [
	doneReceiver := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/5/2024 17:26'
}
SKKara >> getValue [


	^1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/10/2024 23:31'
}
SKKara >> move [
	"comment stating purpose of message"

	Transcript showln: 'move'.
	doneReceiver karadone.
	"doneReceiver karadone."
]
