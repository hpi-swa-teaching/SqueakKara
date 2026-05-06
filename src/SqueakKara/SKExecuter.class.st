"
SKExecuter provides a way to run the code step by step. It uses the pre-existing Compiler class and adds the feature that each move or turn call on the SKKara-object ist executed on its own beat as well as the ability to pause, stop or restart execution.
"
Class {
	#name : #SKExecuter,
	#superclass : #Object,
	#instVars : [
		'karas',
		'codeString',
		'compiler',
		'processes',
		'speed',
		'state',
		'environment'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:45'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'LM 5/6/2026 18:39'
}
SKExecuter class >> newWithEnvironment: anEnvironment [
	
	| executer |
	executer := self new.

	"karaDecorator := SKKaraDecorator new.
	karaDecorator kara: aKara.
	karaDecorator executer: executer."

	executer
		karas: OrderedCollection new;
		environment: anEnvironment.

	^ executer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 18:40'
}
SKExecuter >> addKara: aKara [
	
	self karas add: aKara
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/6/2026 19:00'
}
SKExecuter >> codeContext [

	^ (SKExecuteContext new kara: self kara)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:37'
}
SKExecuter >> codeString [
	
	^ codeString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:37'
}
SKExecuter >> codeString: anObject [
	
	codeString := anObject
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
	#'squeak_changestamp' : 'LM 5/6/2026 20:08'
}
SKExecuter >> execute: aCode [

	| lock |

	self codeString: aCode.
	self state: #running.
	Transcript showln: self karas.
	lock := Semaphore forMutualExclusion.
	
	self processes: (self karas collect: [ :kara |
		| decorator context priority |
		priority := Processor userBackgroundPriority.
		decorator := SKKaraDecorator newWith: kara lock: lock executer: self.
		context := (SKExecuteContext new kara: decorator).
		[ self compiler evaluate: aCode for: context ] fork
	]).
	Transcript showln: self processes.
	
	"self processes: (self karas collect: [ :kara | [ SKKaraDecorator runWith: kara ] fork ]).
	Transcript showln: self processes
	self process: [self executeBlock: aCode] fork"
	
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/6/2026 18:58'
}
SKExecuter >> executeBlock: aBlock [
	
	self compiler evaluate: aBlock for: (self codeContext).
	self state: #terminated.
	self environment onFinish
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/6/2026 20:11'
}
SKExecuter >> initialize [

	super initialize.
	self compiler: Compiler new.
	self speed: 25.
	self processes: OrderedCollection new.
	self state: #terminated.
	^ self 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 18:37'
}
SKExecuter >> karas [
	
	^ karas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 18:37'
}
SKExecuter >> karas: aCollection [
	
	karas := aCollection
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
	#'squeak_changestamp' : 'KD 6/12/2024 12:05'
}
SKExecuter >> speed [
	
	^ speed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 12:05'
}
SKExecuter >> speed: aSpeed [
	
	speed := aSpeed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 20:14'
}
SKExecuter >> state [

	"(self process isNil) 
		ifTrue: [ self state: #terminated ]
		ifFalse: [(self process isTerminated) 
			ifTrue: [ self state: #terminated ]].
	^ state"
	(self processes allSatisfy: [ :process | process isTerminated ])
		ifTrue: [ ^ #terminated ].
	
	^ state
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 14:07'
}
SKExecuter >> state: anObject [
	state := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/6/2026 19:08'
}
SKExecuter >> step [

	self stepTime > 0
		ifTrue: [(Delay forMilliseconds: self stepTime) wait ]
	
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
	#'squeak_changestamp' : 'LM 5/6/2026 20:17'
}
SKExecuter >> suspendExecution [

	self processes do: [ :process |
		Transcript showln: process isTerminated not.
		Transcript showln: process isSuspended not.
		((process isTerminated not) and: (process isSuspended not)) ifTrue: [ Transcript showln: 'Suspending'. process suspend ]].
	
	self state: #suspended
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/6/2026 19:48'
}
SKExecuter >> terminate [

	(self state = #terminated) ifTrue: [ ^ self ].

	self processes do: [ :process | process terminate ]. 
	self state: #terminated
]
