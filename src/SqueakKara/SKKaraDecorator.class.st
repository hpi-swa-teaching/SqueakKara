"
SKKaraDecorator is a decorator for SKKara used to add the necessary step calls to the turn and move methods and modify the SKKara methods so that they can be used by the SKExecuter.
"
Class {
	#name : #SKKaraDecorator,
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
SKKaraDecorator class >> newWith: aKara [

	^ self new
		kara: aKara;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 18:59'
}
SKKaraDecorator >> codeContext [

	^ (SKExecuteContext new kara: self kara)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraDecorator >> kara [
	
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraDecorator >> kara: anObject [
	
	kara := anObject
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/7/2026 16:52'
}
SKKaraDecorator >> move [

	self scheduler scheduleAction: (SKAction newWithType: #move action: [ self kara move ]) for: self.
	self scheduler waitFor: self
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/6/2026 21:57'
}
SKKaraDecorator >> onCloverleaf [

	^ self kara onCloverleaf
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:40'
}
SKKaraDecorator >> scheduler [

	^ scheduler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 09:40'
}
SKKaraDecorator >> scheduler: aScheduler [

	scheduler := aScheduler
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/7/2026 16:53'
}
SKKaraDecorator >> trunkAhead [

	^ self kara trunkAhead
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/7/2026 10:29'
}
SKKaraDecorator >> turn: aDirection [

	self kara turn: aDirection
]
