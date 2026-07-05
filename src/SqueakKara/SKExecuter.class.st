"
SKExecuter contains  a compiler, processes, speed, state, environment, scheduler and a testMode. It provides a way to run the code step by step. It uses the pre-existing Compiler class and adds the feature that each move or turn call on the SKKara-object ist executed on its own beat as well as the ability to pause, stop or restart execution.

Instance Variables
	compiler:			<Object>
	processes:			<Dictionary>
	speed:				<Number>
	state:				<Symbol>
	environment:		<SKEnvironment>
	scheduler:			<SKScheduler>
	testMode:			<Boolean>

compiler
	- Compiles the code of the user in each workspace.

processes
	- The state of what the code currently does.
	
speed
	- Dictates how fast the code should be executed.
	
state
	- Tells if the process is still running.

environment
	- Calls the current game environment.
	
scheduler
	- Decides which in which order tasks should be done.
	
testMode
	- Tells if its just a test run. This is used, so that the tests run faster.





"
Class {
	#name : #SKExecuter,
	#superclass : #Object,
	#instVars : [
		'compiler',
		'processes',
		'speed',
		'state',
		'environment',
		'scheduler',
		'testMode'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'ND 7/5/2026 13:30'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'LM 5/29/2026 12:53'
}
SKExecuter class >> newWithEnvironment: anEnvironment [
	
	^ self new
		testMode: false;
		environment: anEnvironment;
		state: #terminated;
		yourself
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
	#'squeak_changestamp' : 'LM 7/4/2026 11:04'
}
SKExecuter >> defaultSpeed [

	^ 25
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 7/4/2026 11:07'
}
SKExecuter >> defaultStepTime [

	^ 5000
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
	#'squeak_changestamp' : 'ND 7/4/2026 11:58'
}
SKExecuter >> execute: aCode for: aKara [

	| proxy |
	
	self terminateFor: aKara.
	
	proxy := (SKKaraProxy newWith: aKara)
		scheduler: self scheduler; yourself.
	
	self scheduler addActor: proxy.
	
	self startExecutionOf: aCode for: aKara using: proxy.

	self stateWithUpdate: #running
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 7/4/2026 11:04'
}
SKExecuter >> initialize [

	super initialize.
	self compiler: Compiler new.
	self speed: self defaultSpeed.
	self processes: Dictionary new.
	self scheduler: (SKScheduler newWithExecuter: self).
	^ self
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
	#'squeak_changestamp' : 'LM 5/21/2026 10:01'
}
SKExecuter >> processes: aDictionary [
	
	processes := aDictionary
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/29/2026 12:54'
}
SKExecuter >> resumeExecution [
	
	self processes valuesDo: [ :process | process isTerminated ifFalse: [ process resume ]].
	self stateWithUpdate: #running
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
	#'squeak_changestamp' : 'LM 7/4/2026 12:07'
}
SKExecuter >> startExecutionOf: aCode for: aKara using: aProxy [

	| context |
	context := SKExecuteContext new kara: aProxy.
	self processes at: aKara put: (
		[[ self compiler evaluate: aCode for: context ]
			ensure: [ self scheduler finishActor: aProxy ]]
			forkAt: Processor userBackgroundPriority)
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
	#'squeak_changestamp' : 'LM 5/29/2026 12:53'
}
SKExecuter >> state: aSymbol [

	state := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:17'
}
SKExecuter >> stateWithUpdate: aSymbol [

	self state: aSymbol
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
	#'squeak_changestamp' : 'LM 7/4/2026 11:07'
}
SKExecuter >> stepTime [

	self testMode ifTrue: [ ^ 0 ].

	(self speed = 0) ifTrue: [ ^ self defaultStepTime ].
	^ self defaultStepTime / self speed
]

{
	#category : #execution,
	#'squeak_changestamp' : 'mr 7/4/2026 11:53'
}
SKExecuter >> suspendExecution [

	self processes valuesDo: [ :process |
		((process isTerminated not) and: [ process isSuspended not ]) ifTrue: [ process suspend ]].
	
	self stateWithUpdate: #suspended
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/29/2026 12:55'
}
SKExecuter >> terminate [

	(self state = #terminated) ifTrue: [ ^ self ].

	self processes keysDo: [ :kara | self terminateFor: kara ].
	self stateWithUpdate: #terminated
]

{
	#category : #execution,
	#'squeak_changestamp' : 'ND 6/29/2026 16:36'
}
SKExecuter >> terminateFor: aKara [

	(self state = #terminated or: [(self processes includesKey: aKara) not ]) ifTrue: [ ^ self ].

	(self processes at: aKara) terminate.
	self processes removeKey: aKara.
	self environment updateTextures
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
