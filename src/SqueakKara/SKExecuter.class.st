"
SKExecuter provides a way to run the code step by step. It uses the pre-existing Compiler class and adds the feature that each move or turn call on the SKKara-object ist executed on its own beat as well as the ability to pause, stop or restart execution.
"
Class {
	#name : #SKExecuter,
	#superclass : #Object,
	#instVars : [
		'karas',
		'compiler',
		'process',
		'speed',
		'state'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:45'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:37'
}
SKExecuter >> compiler [
	
	^ compiler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 5/2/2026 17:49'
}
SKExecuter >> compiler: aCompiler [
	
	compiler := aCompiler
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mr 5/2/2026 17:49'
}
SKExecuter >> defaultSpeed [
	
	^ 25
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mr 5/2/2026 17:50'
}
SKExecuter >> defaultState [
	
	^ #terminated
]

{
	#category : #execution,
	#'squeak_changestamp' : 'mr 5/2/2026 18:56'
}
SKExecuter >> execute: aString [

	self state: #running.
	^ self executeForEachKara: aString useProxy: false
	
]

{
	#category : #execution,
	#'squeak_changestamp' : 'mr 5/2/2026 18:37'
}
SKExecuter >> executeForEachKara: aString useProxy: aBoolean [
	
	| executionResult |
	
	self karas do: [ :kara | 
		| karaForExecution context |
		
		karaForExecution := aBoolean 
			ifTrue: [ SKKaraProxy newWithKara: kara executer: self ]
			ifFalse: [ kara ].

		context := SKExecuteContext new.
		context kara: karaForExecution.
		
		executionResult := self compiler evaluate: aString for: context
	].

	^ executionResult
]

{
	#category : #execution,
	#'squeak_changestamp' : 'mr 5/2/2026 18:56'
}
SKExecuter >> executeForked: aString [

	self state: #running.
	self process: [ self executeForEachKara: aString useProxy: true ] fork
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mr 5/2/2026 19:02'
}
SKExecuter >> initialize [
	
	self compiler: Compiler new.
	self speed: self defaultSpeed.
	self state: self defaultState
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 5/2/2026 16:09'
}
SKExecuter >> karas [
	^ karas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 5/2/2026 16:09'
}
SKExecuter >> karas: anOrderedCollection [

	karas := anOrderedCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:38'
}
SKExecuter >> process [
	
	^ process
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 5/2/2026 19:02'
}
SKExecuter >> process: aProcess [
	
	process := aProcess
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 4/28/2026 20:09'
}
SKExecuter >> resumeExecution [
	
	self process isTerminated ifTrue: [ ^ self ].
	
	self state: #running.
	self process resume
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 12:05'
}
SKExecuter >> speed [
	
	^ speed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 5/2/2026 19:04'
}
SKExecuter >> speed: anInteger [
	
	speed := anInteger
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/29/2026 18:50'
}
SKExecuter >> state [

	(self process isNil) 
		ifTrue: [ self state: #terminated ]
		ifFalse: [(self process isTerminated) 
			ifTrue: [ self state: #terminated ]].
	^ state
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 5/2/2026 19:04'
}
SKExecuter >> state: aSymbol [

	state := aSymbol
]

{
	#category : #execution,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:37'
}
SKExecuter >> step [

	self stepTime > 0
		ifTrue: [(Delay forMilliseconds: self stepTime) wait]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:19'
}
SKExecuter >> stepTime [

	(self speed = 0) ifTrue: [ ^ 5000 ].
	^ 5000 / self speed
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 4/28/2026 20:14'
}
SKExecuter >> suspendExecution [

	((self process isTerminated not) and: (self process isSuspended not)) ifFalse: [ ^ self ].

	self state: #suspended.
	self process suspend
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 4/28/2026 20:14'
}
SKExecuter >> terminate [

	(self state = #terminated) ifTrue: [ ^ self ].

	self process terminate. 
	self state: #terminated
]
