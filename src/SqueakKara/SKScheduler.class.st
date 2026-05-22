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
	#'squeak_changestamp' : 'LM 5/8/2026 17:55'
}
SKScheduler >> finishActor: anActor [

	self stepLock critical: [
		self activeActors remove: anActor.
		self releaseLocks removeKey: anActor.
		
		self activeActors isEmpty ifTrue: [
			self executer state: #terminated.
			self executer onFinish ].

		self scheduledSteps size = self activeActors size ifTrue: [
			self scheduledSteps isEmpty ifFalse: [
				self step.
				self scheduledSteps removeAll.
				self releaseAll ]]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AB 5/21/2026 19:41'
}
SKScheduler >> gridCoordinator [

	^ self executer environment grid gridCoordinator
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/22/2026 11:50'
}
SKScheduler >> isLocked: aPoint for: anActor [

	^ self gridCoordinator isLocked: aPoint for: anActor kara

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/22/2026 11:53'
}
SKScheduler >> lockFor: anActor [

	(self isLocked: (anActor nextField) for: anActor) ifTrue: [ ^ self ].
	(self gridCoordinator lockAt: (anActor nextField) for: anActor kara) ifTrue: [
		self unlockAt: anActor coordinates ]
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
	#'squeak_changestamp' : 'AB 5/21/2026 20:35'
}
SKScheduler >> scheduleAction: anAction for: anActor [

	self stepLock critical: [
		| actions |
		
		actions := self scheduledSteps at: anActor ifAbsent: [ OrderedCollection new ].
		actions add: anAction.
		(anAction type = #move) ifTrue: [ self lockFor: anActor ].
		self scheduledSteps at: anActor put: actions.
		
		self scheduledSteps size = self activeActors size ifTrue: [
			self step.
			self scheduledSteps removeAll.
			self releaseAll ]]
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
	#'squeak_changestamp' : 'AB 5/21/2026 19:03'
}
SKScheduler >> step [

	"self delayStep."
	self stepForType: #move.
	self delayStep
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LM 5/7/2026 10:42'
}
SKScheduler >> stepForType: aType [

	self scheduledSteps valuesDo: [ :actions |
		actions do: [ :action | action type = aType ifTrue: [
                action action value ]]]
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
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/22/2026 11:53'
}
SKScheduler >> unlockAt: aPoint [

	self gridCoordinator unlockAt: aPoint
]

{
	#category : #scheduling,
	#'squeak_changestamp' : 'LM 5/8/2026 17:56'
}
SKScheduler >> waitFor: anActor [

	(releaseLocks at: anActor) wait
]
