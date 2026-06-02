Class {
	#name : #SKProgrammingConcept,
	#superclass : #Object,
	#instVars : [
		'name',
		'programmingUIClass',
		'processClass'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #concepts,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:33'
}
SKProgrammingConcept class >> blocks [

	^ self 
		newWithName: 'Blocks' 
		programmingUIClass: SKProgrammingUIBlocks 
		processClass: SKProcessCode
]

{
	#category : #concepts,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:13'
}
SKProgrammingConcept class >> code [

	^ self 
		newWithName: 'Code' 
		programmingUIClass: SKProgrammingUICode 
		processClass: SKProcessCode
]

{
	#category : #concepts,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:33'
}
SKProgrammingConcept class >> mealy [

	^ self 
		newWithName: 'Mealy' 
		programmingUIClass: SKProgrammingUIMealy 
		processClass: SKProcessCode
]

{
	#category : #constructor,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:04'
}
SKProgrammingConcept class >> newWithName: aString programmingUIClass: aClass processClass: anotherClass [

	^ (self new
			name: aString;
			programmingUIClass: aClass;
			processClass: anotherClass;
			yourself)
]

{
	#category : #building,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:01'
}
SKProgrammingConcept >> buildProcessWithCompiler: aCompiler scheduler: aScheduler [

	^ self processClass newWithCompiler: aCompiler scheduler: aScheduler
]

{
	#category : #building,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:02'
}
SKProgrammingConcept >> buildProgrammingUI: aExecuter andEnvironment: aEnvironment [
	
	^ self programmingUIClass newWithExecuter: aExecuter andEnvironment: aEnvironment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:02'
}
SKProgrammingConcept >> name [
	
	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:00'
}
SKProgrammingConcept >> name: aString [

	name := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:01'
}
SKProgrammingConcept >> processClass [
	
	^ processClass
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:01'
}
SKProgrammingConcept >> processClass: aClass [ 

	processClass := aClass
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:00'
}
SKProgrammingConcept >> programmingUIClass [

	^ programmingUIClass
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 10:07'
}
SKProgrammingConcept >> programmingUIClass: aClass [

	programmingUIClass := aClass
]
