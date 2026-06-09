"
SKExecuter provides a way to run the code step by step. It uses the pre-existing Compiler class and adds the feature that each move or turn call on the SKKara-object ist executed on its own beat as well as the ability to pause, stop or restart execution.
"
Class {
	#name : #SKExecuter,
	#superclass : #Object,
	#instVars : [
		'codeString',
		'compiler',
		'processes',
		'speed',
		'state',
		'environment',
		'scheduler',
		'testMode'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:45'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'LM 5/7/2026 22:59'
}
SKExecuter class >> newWithEnvironment: anEnvironment [
	
	^ self new
		testMode: false;
		environment: anEnvironment;
		stateWithoutUpdate: #terminated;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 18:40'
}
SKExecuter >> addKara: aKara [
	
	self karas add: aKara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:37'
}
SKExecuter >> compiler [
	
	^ compiler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:37'
}
SKExecuter >> compiler: anObject [
	
	compiler := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 4/30/2026 17:36'
}
SKExecuter >> environment [
	
	^ environment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/4/2026 12:36'
}
SKExecuter >> environment: anEnvironment [
	
	environment := anEnvironment
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 16:50'
}
SKExecuter >> execute: aCode [

	| decorators process |
	
	self terminate.
	
	decorators := self karas collect: [ :kara |
		SKKaraProxy newWith: kara ].
	
	self scheduler: (SKScheduler
		newWithActors: decorators
		executer: self).
	
	self processes: (decorators collect: [ :decorator |
		| context |
		decorator scheduler: self scheduler.
		context := SKExecuteContext new kara: decorator.
		process := self environment programmingConcept buildProcessWithCompiler: (self compiler) scheduler: (self scheduler).
		process startWithCode: aCode context: context.
		process ]).
	
	self state: #running
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/7/2026 22:44'
}
SKExecuter >> initialize [

	super initialize.
	self compiler: Compiler new.
	self speed: 25.
	self processes: OrderedCollection new.
	^ self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 21:50'
}
SKExecuter >> karas [
	
	^ self environment karas
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/7/2026 22:13'
}
SKExecuter >> onFinish [

	self environment onFinish
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 18:37'
}
SKExecuter >> processes [
	
	^ processes
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 18:37'
}
SKExecuter >> processes: aCollection [
	
	processes := aCollection
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/6/2026 20:19'
}
SKExecuter >> resumeExecution [
	
	self processes do: [ :process | process isTerminated ifFalse: [ process resume ]].
	self state: #running
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/10/2026 20:46'
}
SKExecuter >> scheduler [

	^ scheduler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/10/2026 20:46'
}
SKExecuter >> scheduler: aScheduler [

	scheduler := aScheduler
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
	#'squeak_changestamp' : 'LM 5/11/2026 21:43'
}
SKExecuter >> speed: aSpeed [
	
	speed := aSpeed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 16:31'
}
SKExecuter >> state [

	(self processes allSatisfy: [ :process | process isTerminated ])
		ifTrue: [ ^ #terminated ].
	
	^ state
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 22:29'
}
SKExecuter >> state: aSymbol [

	state := aSymbol.
	self environment updateTextures
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 21:34'
}
SKExecuter >> stateWithoutUpdate: aSymbol [

	state := aSymbol
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/10/2026 20:58'
}
SKExecuter >> step [
	
	self scheduler step
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 23:00'
}
SKExecuter >> stepTime [

	self testMode ifTrue: [ ^ 0 ].

	(self speed = 0) ifTrue: [ ^ 5000 ].
	^ 5000 / self speed
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/6/2026 21:33'
}
SKExecuter >> suspendExecution [

	self processes do: [ :process |
		((process isTerminated not) and: (process isSuspended not)) ifTrue: [ process suspend ]].
	
	self state: #suspended
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/7/2026 21:43'
}
SKExecuter >> terminate [

	(self state = #terminated) ifTrue: [ ^ self ].

	self processes do: [ :process | process terminate ].
	self state: #terminated
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 22:59'
}
SKExecuter >> testMode [

	^ testMode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 22:59'
}
SKExecuter >> testMode: aBoolean [

	testMode := aBoolean
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/7/2026 23:08'
}
SKExecuter >> waitUntilTerminated [

	"Busy waiting until all karas reach their end state."
	[ self state = #terminated ] whileFalse: [
		(Delay forMilliseconds: 1) wait ]
]
