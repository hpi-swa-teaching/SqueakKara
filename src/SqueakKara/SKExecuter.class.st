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
		'environment',
		'stepLock',
		'activeDecorators',
		'releaseLocks',
		'submittedSteps'
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
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/6/2026 22:05'
}
SKExecuter >> delayStep [

	self stepTime > 0
		ifTrue: [(Delay forMilliseconds: self stepTime) wait ]
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
	#'squeak_changestamp' : 'LM 5/7/2026 10:29'
}
SKExecuter >> execute: aCode [

	| priority scheduler decorators |

	self state: #running.
	priority := Processor userBackgroundPriority. 
	
	decorators := self karas collect: [ :kara |
		SKKaraDecorator newWith: kara ].
	
	scheduler := SKScheduler
		newWithDecorators: decorators 
		executer: self.
	
	"self initializeStepSchedulerFor: decorators."
	
	self processes: (decorators collect: [ :decorator |
		| context |
		decorator scheduler: scheduler.
		context := SKExecuteContext new kara: decorator.
		[[ self compiler evaluate: aCode for: context ] ensure: [
			scheduler finishDecorator: decorator ]] forkAt: priority ])
	
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/7/2026 09:22'
}
SKExecuter >> finishDecorator: aDecorator [

	stepLock critical: [
		activeDecorators remove: aDecorator.
		releaseLocks removeKey: aDecorator.
		
		activeDecorators isEmpty ifTrue: [
			self state: #terminated.
			self environment onFinish ].

		submittedSteps size = activeDecorators size ifTrue: [
			submittedSteps isEmpty ifFalse: [
				self playSubmittedStep.
				submittedSteps removeAll.
				self releaseAllKaras ]]]
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
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/7/2026 09:24'
}
SKExecuter >> initializeStepSchedulerFor: decorators [
	
	stepLock := Semaphore forMutualExclusion.
	releaseLocks := Dictionary new.
	submittedSteps := Dictionary new.
	activeDecorators := decorators asOrderedCollection.
	
	decorators do: [ :decorator |
		releaseLocks at: decorator put: Semaphore new ]
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
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/7/2026 10:23'
}
SKExecuter >> onFinish [
	self environment onFinish
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/6/2026 22:04'
}
SKExecuter >> playActionType: actionType [

	submittedSteps valuesDo: [ :actions |
		actions do: [ :entry | entry first = actionType ifTrue: [
                entry second value ]]]
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/6/2026 22:05'
}
SKExecuter >> playSubmittedStep [

	self playActionType: #turn.
	self delayStep.
	self playActionType: #move.
	self delayStep
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
	#'squeak_changestamp' : 'LM 5/6/2026 21:49'
}
SKExecuter >> releaseAllKaras [
	releaseLocks valuesDo: [ :semaphore | semaphore signal ]
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
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 21:33'
}
SKExecuter >> stepTime [

	(self speed = 0) ifTrue: [ ^ 5000 ].
	^ 5000 / self speed
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/6/2026 22:13'
}
SKExecuter >> submitStepActions: actions for: aDecorator [

	stepLock critical: [
		submittedSteps at: aDecorator put: actions.
		
		submittedSteps size = activeDecorators size ifTrue: [
			self playSubmittedStep.
			submittedSteps removeAll.
			self releaseAllKaras ]]
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
	#'squeak_changestamp' : 'LM 5/6/2026 19:48'
}
SKExecuter >> terminate [

	(self state = #terminated) ifTrue: [ ^ self ].

	self processes do: [ :process | process terminate ]. 
	self state: #terminated
]

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 5/6/2026 21:49'
}
SKExecuter >> waitForNextStepFor: aDecorator [

	(releaseLocks at: aDecorator) wait
]
