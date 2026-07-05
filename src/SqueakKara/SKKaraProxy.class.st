"
SKKaraDecorator is a decorator for SKKara used to add the necessary step calls to the turn and move methods and modify the SKKara methods so that they can be used by the SKExecuter.
"
Class {
	#name : #SKKaraProxy,
	#superclass : #Object,
	#instVars : [
		'kara',
		'scheduler'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 16:00'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'LM 5/7/2026 16:53'
}
SKKaraProxy class >> newWith: aKara [

	^ self new
		kara: aKara;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 18:59'
}
SKKaraProxy >> codeContext [

	^ (SKExecuteContext new kara: self kara)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraProxy >> kara [
	
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraProxy >> kara: anObject [
	
	kara := anObject
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/7/2026 16:52'
}
SKKaraProxy >> move [

	self scheduler scheduleAction: (SKAction newWithType: #move action: [ self kara move ]) for: self.
	self scheduler waitFor: self
]

{
	#category : #commands,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/7/2026 23:14'
}
SKKaraProxy >> mushroomAhead [

	^ self kara mushroomAhead
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/6/2026 21:57'
}
SKKaraProxy >> onCloverleaf [

	^ self kara onCloverleaf
]

{
	#category : #commands,
	#'squeak_changestamp' : 'FR 6/17/2026 00:23'
}
SKKaraProxy >> push [

	self scheduler scheduleAction: (SKAction newWithType: #move action: [ self kara push ]) for: self.
	self scheduler waitFor: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:40'
}
SKKaraProxy >> scheduler [

	^ scheduler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:40'
}
SKKaraProxy >> scheduler: aScheduler [

	scheduler := aScheduler
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/7/2026 16:53'
}
SKKaraProxy >> trunkAhead [

	^ self kara trunkAhead
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/7/2026 10:29'
}
SKKaraProxy >> turn: aDirection [

	self kara turn: aDirection
]
