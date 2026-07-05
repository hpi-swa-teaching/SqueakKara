"
A SKScheduler is a custom Scheduler for scheduling action grouped by type.

Instance Variables
	activeActors:		<Dictionary>
	executer:			<SKExecuter>
	releaseLocks:		<Dictionary>
	scheduledSteps:	<Dictionary>
	stepLock:			<Dictionary>

activeActors
	- A dictionary of the active actors (kara proxys). 

executer
	- The coresponding executer of the scheduler.

releaseLocks
	- The dicitonary of the released locks.

scheduledSteps
	- The dictionary of the schedules steps.

stepLock
	- The dictionary of the steps which are locked.

"
Class {
	#name : #SKScheduler,
	#superclass : #Object,
	#instVars : [
		'executer',
		'stepLock',
		'activeActors',
		'releaseLocks',
		'scheduledSteps'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'ND 7/5/2026 12:59'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'LM 5/8/2026 16:56'
}
SKScheduler class >> newWithActors: aCollection executer: anExecuter [

	| scheduler |

	 scheduler := self new
		executer: anExecuter;
		activeActors: aCollection;
		releaseLocks: Dictionary new;
		stepLock: Semaphore forMutualExclusion;
		scheduledSteps: Dictionary new.
		
	aCollection do: [ :decorator |
		scheduler releaseLocks at: decorator put: Semaphore new ].
	
	^ scheduler
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'LM 5/21/2026 10:09'
}
SKScheduler class >> newWithExecuter: anExecuter [

	^ self new
		executer: anExecuter;
		activeActors: OrderedCollection new;
		releaseLocks: Dictionary new;
		stepLock: Semaphore forMutualExclusion;
		scheduledSteps: Dictionary new;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/8/2026 16:55'
}
SKScheduler >> activeActors [

	^ activeActors
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/8/2026 16:55'
}
SKScheduler >> activeActors: aDictionary [

	activeActors := aDictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/21/2026 10:11'
}
SKScheduler >> addActor: anActor [
	
	self activeActors add: anActor.
	self releaseLocks at: anActor put: Semaphore new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 7/4/2026 11:48'
}
SKScheduler >> clearActor: anActor [
	
	self activeActors remove: anActor.
	self releaseLocks removeKey: anActor.
	self scheduledSteps removeKey: anActor ifAbsent: []
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 7/4/2026 11:47'
}
SKScheduler >> clearUp [
	
	self scheduledSteps removeAll.
	self releaseAll.
	self executer stateWithUpdate: #terminated.
	self executer onFinish
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LM 5/7/2026 16:28'
}
SKScheduler >> delayStep [

	self executer stepTime > 0
		ifTrue: [(Delay forMilliseconds: self executer stepTime) wait ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/11/2026 21:47'
}
SKScheduler >> executer [

	^ executer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/11/2026 21:47'
}
SKScheduler >> executer: anExecuter [

	executer := anExecuter
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LM 7/4/2026 12:08'
}
SKScheduler >> finishActor: anActor [

	self stepLock critical: [
		self clearActor: anActor.
		self activeActors isEmpty ifTrue: [ self clearUp ].
		self stepOnEnd ]
]

{
	#category : #scheduling,
	#'squeak_changestamp' : 'LM 5/12/2026 21:01'
}
SKScheduler >> releaseAll [

	self releaseLocks valuesDo: [ 
		:semaphore | semaphore signal ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:29'
}
SKScheduler >> releaseLocks [

	^ releaseLocks
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:29'
}
SKScheduler >> releaseLocks: aDictionary [

	releaseLocks := aDictionary
]

{
	#category : #scheduling,
	#'squeak_changestamp' : 'JanWein 7/5/2026 13:57'
}
SKScheduler >> scheduleAction: anAction for: anActor [

	self stepLock critical: [
		| actions |
		
		actions := self scheduledSteps at: anActor ifAbsent: [ OrderedCollection new ].
		actions add: anAction.
		(anAction type = #move) ifTrue: [ anActor lockNextField ].
		self scheduledSteps at: anActor put: actions.
		
		self stepOnEnd ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 10:35'
}
SKScheduler >> scheduledSteps [

	^ scheduledSteps
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 10:35'
}
SKScheduler >> scheduledSteps: aDictionary [

	scheduledSteps := aDictionary
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LM 5/28/2026 10:35'
}
SKScheduler >> step [

	| busyStep |

	busyStep := self stepForType: #move.
	busyStep ifTrue: [ self delayStep ]
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'mr 7/4/2026 12:37'
}
SKScheduler >> stepForType: aType [

	| results actions |
	
	actions := OrderedCollection new.
	self scheduledSteps valuesDo: [ :step | actions addAll: step ].
	
	results := ((actions
		select: [ :action | action type = aType ])
		collect: [ :action | action action value ]
		thenSelect: [ :actionResult | actionResult isBoolean ]).
		
	^ results isEmpty or: [ results anySatisfy: [ :result | result ]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:29'
}
SKScheduler >> stepLock [

	^ stepLock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:29'
}
SKScheduler >> stepLock: aSemaphore [

	stepLock := aSemaphore
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LM 5/27/2026 21:30'
}
SKScheduler >> stepOnEnd [

	(self scheduledSteps size = self activeActors size) ifTrue: [
		self scheduledSteps isEmpty ifFalse: [
			self step.
			self scheduledSteps removeAll.
			self releaseAll ]]
]

{
	#category : #scheduling,
	#'squeak_changestamp' : 'LM 5/29/2026 12:53'
}
SKScheduler >> waitFor: anActor [

	(self releaseLocks at: anActor) wait
]
