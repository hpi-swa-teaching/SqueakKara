Class {
	#name : #SKKara,
	#superclass : #SKGridObject,
	#category : #SqueakKara
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/5/2024 17:26'
}
SKKara >> getValue [


	^1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/10/2024 22:45'
}
SKKara >> move [
	"comment stating purpose of message"

	Transcript show: 'move' ; cr.
	self grid executer step.
]
