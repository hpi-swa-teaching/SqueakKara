Class {
	#name : #SKProgrammingConcept,
	#superclass : #Object,
	#category : #'SqueakKara-Core'
}

{
	#category : #building,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:36'
}
SKProgrammingConcept >> buildProcessWithCompiler: aCompiler scheduler: aScheduler [

	self subclassResponsibility
]

{
	#category : #building,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:30'
}
SKProgrammingConcept >> buildProgrammingUI: aExecuter [

	self subclassResponsibility
]
