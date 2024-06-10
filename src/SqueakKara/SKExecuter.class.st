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
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/5/2024 18:08'
}
SKExecuter >> ctxt [
	^ ctxt
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/5/2024 18:08'
}
SKExecuter >> ctxt: anObject [
	ctxt := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/10/2024 23:24'
}
SKExecuter >> execute: aCode [

	self codeString: aCode.
	self process: [self executeBlock: aCode] fork.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/10/2024 16:44'
}
SKExecuter >> executeBlock: aBlock [
	
	^ compiler evaluate: aBlock for: self
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/10/2024 23:26'
}
SKExecuter >> initialize [

	compiler:=Compiler new.
	stepTime := 500.
	^self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/5/2024 17:28'
}
SKExecuter >> kara [
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/5/2024 17:28'
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/10/2024 23:20'
}
SKExecuter >> resumeExecution [
	
	process resume.
]

{
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/10/2024 23:20'
}
SKExecuter >> suspendExecution [
	
	process suspend.
]
