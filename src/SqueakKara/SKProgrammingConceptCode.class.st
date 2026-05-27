Class {
	#name : #SKProgrammingConceptCode,
	#superclass : #SKProgrammingConcept,
	#category : #'SqueakKara-Core'
}

{
	#category : #building,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:41'
}
SKProgrammingConceptCode >> buildProcessWithCompiler: aCompiler scheduler: aScheduler [

	^ SKProcessCode newWithCompiler: aCompiler scheduler: aScheduler
]

{
	#category : #building,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:43'
}
SKProgrammingConceptCode >> buildProgrammingUI: aExecuter andEnvironment: aEnvironment [
	
	^ SKProgrammingUICode newWithExecuter: aExecuter andEnvironment: aEnvironment
]

{
	#category : #info,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 20:46'
}
SKProgrammingConceptCode >> name [

	^ 'Code'
]
