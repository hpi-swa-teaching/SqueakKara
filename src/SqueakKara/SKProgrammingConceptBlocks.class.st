Class {
	#name : #SKProgrammingConceptBlocks,
	#superclass : #SKProgrammingConcept,
	#category : #'SqueakKara-Core'
}

{
	#category : #building,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:43'
}
SKProgrammingConceptBlocks >> buildProcessWithCompiler: aCompiler scheduler: aScheduler [

	^ SKProcessCode newWithCompiler: aCompiler scheduler: aScheduler
]

{
	#category : #building,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:34'
}
SKProgrammingConceptBlocks >> buildProgrammingUI: aExecuter andEnvironment: aEnvironment [
	
	^ SKProgrammingUIBlocks newWithExecuter: aExecuter andEnvironment: aEnvironment
]

{
	#category : #info,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:36'
}
SKProgrammingConceptBlocks >> name [

	^ 'Blocks'
]
