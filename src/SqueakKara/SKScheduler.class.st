"
A SKScheduler is a custom Scheduler for scheduling action grouped by type.

Instance Variables
	activeActors:		<Object>
	executer:			<Object>
	releaseLocks:		<Object>
	scheduledSteps:		<Object>
	stepLock:		<Object>

activeActors
	- xxxxx

executer
	- xxxxx

releaseLocks
	- xxxxx

scheduledSteps
	- xxxxx

stepLock
	- xxxxx

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
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'LM 5/10/2026 20:31'
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
	#'squeak_changestamp' : 'LM 5/27/2026 21:40'
}
SKScheduler >> finishActor: anActor [

	self stepLock critical: [
		self activeActors remove: anActor.
		self releaseLocks removeKey: anActor.
		self scheduledSteps removeKey: anActor ifAbsent: [].
		
		self activeActors isEmpty ifTrue: [
			self scheduledSteps removeAll.
			self releaseAll.
			self executer state: #terminated.
			self executer onFinish ].

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
	#'squeak_changestamp' : 'LM 5/27/2026 21:40'
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
	#'squeak_changestamp' : 'LM 5/28/2026 10:34'
}
SKScheduler >> step [

	| busyStep |
	busyStep := false.

	busyStep := self stepForType: #move.
	
	busyStep ifTrue: [ self delayStep ]
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LM 5/27/2026 21:38'
}
SKScheduler >> stepForType: aType [

	| gotStatus busyStep result |
	
	gotStatus := false.
	busyStep := true.
	
	self scheduledSteps valuesDo: [ :actions |
		actions do: [ :action | action type = aType ifTrue: [
			result := action action value.
				
			result isBoolean ifTrue: [
				gotStatus := true.
				result ifTrue: [ busyStep := true. ^ busyStep ]]]]].
	
	gotStatus ifTrue: [ busyStep := false ].
	
	^ busyStep
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
	#'squeak_changestamp' : 'LM 5/8/2026 17:56'
}
SKScheduler >> waitFor: anActor [

	(releaseLocks at: anActor) wait
]
