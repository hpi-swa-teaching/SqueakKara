Class {
	#name : #SKProgrammingConceptCode,
	#superclass : #SKProgrammingConcept,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:08'
}
SKProgrammingConceptCode >> buildProcessWithCompiler: aCompiler [

	^ SKProcessCode newWithCompiler: aCompiler
]
