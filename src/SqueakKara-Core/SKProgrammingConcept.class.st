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
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:52'
}
SKProgrammingConcept >> buildProgrammingUI [

	self subclassResponsibility
]
