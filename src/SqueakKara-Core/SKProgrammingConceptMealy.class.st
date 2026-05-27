Class {
	#name : #SKProgrammingConceptMealy,
	#superclass : #SKProgrammingConcept,
	#category : #'SqueakKara-Core'
}

{
	#category : #building,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:41'
}
SKProgrammingConceptMealy >> buildProcessWithCompiler: aCompiler scheduler: aScheduler [

	^ SKProcessCode newWithCompiler: aCompiler scheduler: aScheduler
]

{
	#category : #building,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:43'
}
SKProgrammingConceptMealy >> buildProgrammingUI: aExecuter andEnvironment: aEnvironment [
	
	^ SKProgrammingUIMealy newWithExecuter: aExecuter andEnvironment: aEnvironment
]

{
	#category : #info,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:41'
}
SKProgrammingConceptMealy >> name [ 

	^ 'Mealy'
]
