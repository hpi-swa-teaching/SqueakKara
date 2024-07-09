"
SKExecuter provides a way to run the code step by step. It uses the pre-existing Compiler class and adds the feature that each move or turn call on the SKKara-object ist executed on its own beat as well as the ability to pause, stop or restart execution.
"
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
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:45'
}

{
	#category : #execution,
	#'squeak_changestamp' : 'KD 7/9/2024 15:26'
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
	#'squeak_changestamp' : 'JJG 7/1/2024 15:09'
}
SKExecuter >> execute: aCode [

	self codeString: aCode.
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
	#'squeak_changestamp' : 'NR 7/5/2024 11:53'
}
SKExecuter >> initialize [

	self kara: SKKaraDecorator new.
	self kara executer: self.
	self compiler: Compiler new.
	self speed: 25.
	self state: #terminated.
	^ self
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
	#'squeak_changestamp' : 'JJG 7/6/2024 17:52'
}
SKExecuter >> resumeExecution [
	
	(self process isTerminated) ifFalse: [
		self state: #running.
		self process resume.]
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
	#'squeak_changestamp' : 'JJG 7/6/2024 17:49'
}
SKExecuter >> state [

	(self process isNil) 
	ifTrue: [
		self state: #terminated
		]
	ifFalse: [
		(self process isTerminated) ifTrue: [
		self state: #terminated]
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
	#'squeak_changestamp' : 'JJG 7/6/2024 17:47'
}
SKExecuter >> suspendExecution [

	((self process isTerminated not) and: (self process isSuspended not)) ifTrue: [
		self state: #suspended.
		self process suspend.
	].
]

{
	#category : #execution,
	#'squeak_changestamp' : 'JJG 7/6/2024 17:54'
}
SKExecuter >> terminate [

	(self state = #terminated) ifFalse: [
		self process terminate. 
		self state: #terminated]
]
