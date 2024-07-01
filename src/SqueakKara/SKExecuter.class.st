Class {
	#name : #SKExecuter,
	#superclass : #Object,
	#instVars : [
		'kara',
		'codeString',
		'compiler',
		'process',
		'speed',
		'state'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #execution,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:36'
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
	#category : #execution,
	#'squeak_changestamp' : 'EB 6/22/2024 14:28'
}
SKExecuter >> execute: aCode [

	self codeString: aCode.
	"self suspendExecution. geht gerade nicht aber wär schon wenn der aktuelle Prozess beendet würde bevor ein neuer ausgeführt wird"
	self state: #running.
	self process: [self executeBlock: aCode] fork
	
]

{
	#category : #execution,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:37'
}
SKExecuter >> executeBlock: aBlock [
	
	^ compiler evaluate: aBlock for: (self codeContext)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'EB 6/22/2024 14:13'
}
SKExecuter >> initialize [

	self kara: SKKaraDecorator new.
	self kara executer: self.
	self compiler: Compiler new.
	self speed: 5.
	self state: #terminated.
	^self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:37'
}
SKExecuter >> kara [
	
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:38'
}
SKExecuter >> kara: anObject [
	
	kara := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:38'
}
SKExecuter >> process [
	
	^ process
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:38'
}
SKExecuter >> process: anObject [
	
	process := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'EB 6/22/2024 14:10'
}
SKExecuter >> resumeExecution [
	
	(self process isTerminated not) ifTrue: [
		self state: #running.
		self process resume.
	]
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
	#'squeak_changestamp' : 'EB 6/22/2024 14:08'
}
SKExecuter >> state [

	(self process isNil) ifTrue: [
		self state: #terminated
	]
	ifFalse: [
		(self process isTerminated) ifTrue: [
		self state: #terminated
		]
	].
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
	#'squeak_changestamp' : 'JJG 6/17/2024 16:37'
}
SKExecuter >> step [

	self stepTime > 0
		ifTrue: [(Delay forMilliseconds: self stepTime) wait]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 14:42'
}
SKExecuter >> stepTime [

	(self speed = 0) ifTrue: [ ^ 5000].
	^ 5000 / self speed
]

{
	#category : #execution,
	#'squeak_changestamp' : 'EB 6/22/2024 14:09'
}
SKExecuter >> suspendExecution [

	((self process isTerminated not) and: (self process isSuspended not)) ifTrue: [
		self state: #suspended.
		process suspend.
	].
]

{
	#category : #execution,
	#'squeak_changestamp' : 'EB 6/22/2024 14:34'
}
SKExecuter >> terminate [

	(self state = #terminated) ifFalse: [self process terminate. self state: #terminated]
]
