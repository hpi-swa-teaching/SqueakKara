Class {
	#name : #SKProgrammingUI,
	#superclass : #Object,
	#instVars : [
		'executer'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:45'
}
SKProgrammingUI class >> newWithExecuter: aExecuter [

	^ (self new
		executer: aExecuter;
		build;
		yourself)
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:35'
}
SKProgrammingUI >> build [

 	self subclassResponsibility
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:53'
}
SKProgrammingUI >> close [

	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:33'
}
SKProgrammingUI >> executer [

	^ executer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:34'
}
SKProgrammingUI >> executer: aExecuter [

	executer := aExecuter
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:53'
}
SKProgrammingUI >> getCode [

	self subclassResponsibility
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:43'
}
SKProgrammingUI >> setCode: aCode [

	self subclassResponsibility
]
