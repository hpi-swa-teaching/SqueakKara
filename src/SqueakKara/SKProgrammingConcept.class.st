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
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:32'
}
SKProgrammingConcept >> buildProgrammingUI: aExecuter andEnvironment: aEnvironment [

	self subclassResponsibility
]

{
	#category : #info,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 20:46'
}
SKProgrammingConcept >> name [
	
	self subclassResponsibility
]
