"
A SKScheduleActor represents the class that manages locking and provides implementation templates for children.

Instance Variables
	scheduler:		<SKScheduler>

scheduler
	- Reference to the scheduler in order to schedule new actions.

"
Class {
	#name : #SKScheduleActor,
	#superclass : #Object,
	#instVars : [
		'scheduler'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'LM 5/29/2026 13:06'
}

{
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/23/2026 13:57'
}
SKScheduleActor >> isLocked: aPoint [

	^ self subclassResponsibility
]

{
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/23/2026 13:57'
}
SKScheduleActor >> lockAt: aPoint [

	^ self subclassResponsibility
]

{
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/23/2026 13:56'
}
SKScheduleActor >> lockNextField [

	^ self subclassResponsibility
]

{
	#category : #scheduling,
	#'squeak_changestamp' : 'LM 5/23/2026 13:54'
}
SKScheduleActor >> schedule: anAction [

	self scheduler scheduleAction: anAction for: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:40'
}
SKScheduleActor >> scheduler [

	^ scheduler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:40'
}
SKScheduleActor >> scheduler: aScheduler [

	scheduler := aScheduler
]

{
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/23/2026 13:59'
}
SKScheduleActor >> unlockAt: aPoint [

	^ self subclassResponsibility
]
