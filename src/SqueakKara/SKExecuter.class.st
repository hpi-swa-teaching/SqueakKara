Class {
	#name : #SKExecuter,
	#superclass : #Object,
	#instVars : [
		'kara',
		'codeString',
		'compiler',
		'process',
		'speed'
	],
	#category : #SqueakKara
}

{
	#category : #execution,
	#'squeak_changestamp' : 'KD 6/12/2024 12:29'
}
SKExecuter >> codeContext [

	^ (SKExecuteContext new kara: self kara).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/5/2024 17:28'
}
SKExecuter >> codeString [
	^ codeString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/5/2024 17:28'
}
SKExecuter >> codeString: anObject [
	codeString := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/5/2024 18:08'
}
SKExecuter >> compiler [
	^ compiler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/5/2024 18:08'
}
SKExecuter >> compiler: anObject [
	compiler := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'KD 6/10/2024 23:24'
}
SKExecuter >> execute: aCode [

	self codeString: aCode.
	self process: [self executeBlock: aCode] fork.
	
]

{
	#category : #execution,
	#'squeak_changestamp' : 'KD 6/12/2024 12:32'
}
SKExecuter >> executeBlock: aBlock [
	
	^ compiler evaluate: aBlock for: (self codeContext).
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KD 6/12/2024 12:14'
}
SKExecuter >> initialize [

	self kara: SKKaraDecorator new.
	self kara executer: self.
	self compiler: Compiler new.
	self speed: 5.
	^self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/11/2024 10:17'
}
SKExecuter >> kara [
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/11/2024 10:17'
}
SKExecuter >> kara: anObject [
	kara := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/10/2024 08:41'
}
SKExecuter >> process [
	^ process
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/10/2024 08:41'
}
SKExecuter >> process: anObject [
	process := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'KD 6/12/2024 13:32'
}
SKExecuter >> resumeExecution [
	
	(self process isTerminated not) ifTrue: [self process resume].
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
	#category : #execution,
	#'squeak_changestamp' : 'KD 6/12/2024 12:12'
}
SKExecuter >> step [

	self stepTime > 0
		ifTrue: [(Delay forMilliseconds: self stepTime) wait.]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 12:15'
}
SKExecuter >> stepTime [

	^ (1000 / self speed) floor.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/10/2024 08:41'
}
SKExecuter >> stepTime: anObject [
	stepTime := anObject
]

{
	#category : #execution,
	#'squeak_changestamp' : 'KD 6/12/2024 15:01'
}
SKExecuter >> suspendExecution [

	((self process isTerminated not) and: (self process isSuspended not)) ifTrue: [process suspend].
]
