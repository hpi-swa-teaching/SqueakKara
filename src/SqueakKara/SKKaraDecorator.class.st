"
SKKaraDecorator is a decorator for SKKara used to add the necessary step calls to the turn and move methods and modify the SKKara methods so that they can be used by the SKExecuter.
"
Class {
	#name : #SKKaraDecorator,
	#superclass : #Object,
	#instVars : [
		'kara',
		'executer',
		'lock'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 16:00'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'LM 5/6/2026 19:33'
}
SKKaraDecorator class >> newWith: aKara lock: aSemaphore executer: anExecuter [

	| decorator |
	Transcript showln: 'success'.
	decorator := self new.
	decorator kara: aKara; lock: aSemaphore; executer: anExecuter.
	
	^ decorator
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
SKKaraDecorator >> executer [
	
	^ executer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraDecorator >> executer: anObject [
	
	executer := anObject
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
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 19:05'
}
SKKaraDecorator >> lock [

	^ lock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 19:05'
}
SKKaraDecorator >> lock: aSemaphore [

	lock := aSemaphore
]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'LM 5/6/2026 19:50'
}
SKKaraDecorator >> move [

	self lock critical: [
		Transcript showln: 'Entering move critical section for ', self kara.
		self kara move.
		self executer step ].
	Processor yield
]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'LM 5/6/2026 19:38'
}
SKKaraDecorator >> onCloverleaf [

	self lock critical: [ ^ self kara onCloverleaf ]

]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'LM 5/6/2026 19:38'
}
SKKaraDecorator >> trunkAhead [

	self lock critical: [ ^ self kara trunkAhead ]

]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'LM 5/6/2026 19:56'
}
SKKaraDecorator >> turn: aDirection [

	self lock critical: [
		Transcript showln: 'Entering turn critical section for ', self kara.
		self kara turn: aDirection.
		self executer step ]
]
