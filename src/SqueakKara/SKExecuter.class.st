Class {
	#name : #SKExecuter,
	#superclass : #Object,
	#instVars : [
		'kara',
		'codeString',
		'compiler',
		'process',
		'stepTime'
	],
	#category : #SqueakKara
}

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
	#'squeak_changestamp' : 'EB 6/11/2024 10:17'
}
SKExecuter >> executeBlock: aBlock [
	
	^ compiler evaluate: aBlock for: self
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'EB 6/11/2024 10:18'
}
SKExecuter >> initialize [

	self kara: SKKaraDecorator new.
	self kara executer: self.
	self compiler: Compiler new.
	stepTime := 500.
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
	#'squeak_changestamp' : 'EB 6/11/2024 09:55'
}
SKExecuter >> resumeExecution [
	
	[self process isTerminated not] ifTrue: [self process resume].
]

{
	#category : #execution,
	#'squeak_changestamp' : 'KD 6/10/2024 23:25'
}
SKExecuter >> step [

	stepTime > 0
		ifTrue: [(Delay forMilliseconds: stepTime) wait.]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/10/2024 08:41'
}
SKExecuter >> stepTime [
	^ stepTime
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
	#'squeak_changestamp' : 'EB 6/11/2024 09:55'
}
SKExecuter >> suspendExecution [
	
	[self process isTerminated not and: [self process isSuspended]] ifTrue: [process suspend].
]
