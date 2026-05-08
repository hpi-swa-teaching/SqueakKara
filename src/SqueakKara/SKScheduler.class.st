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
	#category : #'SqueakKara-Core'
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
	#category : #stepping,
	#'squeak_changestamp' : 'LM 5/7/2026 16:28'
}
SKScheduler >> delayStep [

	self executer stepTime > 0
		ifTrue: [(Delay forMilliseconds: self executer stepTime) wait ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 10:13'
}
SKScheduler >> executer [

	^ executer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 10:13'
}
SKScheduler >> executer: anExecuter [

	executer := anExecuter
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'LM 5/8/2026 16:55'
}
SKScheduler >> finishDecorator: aDecorator [

	self stepLock critical: [
		self activeActors remove: aDecorator.
		self releaseLocks removeKey: aDecorator.
		
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
	#category : #scheduling,
	#'squeak_changestamp' : 'LM 5/7/2026 10:47'
}
SKScheduler >> releaseAll [
	self releaseLocks valuesDo: [ :semaphore | semaphore signal ]
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
	#'squeak_changestamp' : 'LM 5/8/2026 16:56'
}
SKScheduler >> scheduleAction: anAction for: aDecorator [

	stepLock critical: [
		| decoratorActions |
		
		decoratorActions := self scheduledSteps at: aDecorator ifAbsent: [ OrderedCollection new ].
		decoratorActions add: anAction.
		self scheduledSteps at: aDecorator put: decoratorActions.
		
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
	#'squeak_changestamp' : 'LM 5/7/2026 23:01'
}
SKScheduler >> step [

	self delayStep.
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
	#category : #scheduling,
	#'squeak_changestamp' : 'LM 5/7/2026 10:45'
}
SKScheduler >> waitFor: aDecorator [

	(releaseLocks at: aDecorator) wait
]
