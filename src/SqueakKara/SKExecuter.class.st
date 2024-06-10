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
	#'squeak_changestamp' : 'KD 6/10/2024 08:21'
}
SKExecuter >> execute: aCode [

	process := (self executeBlock: aCode) fork.
	
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
	#'squeak_changestamp' : 'KD 6/10/2024 08:44'
}
SKExecuter >> initialize [

	compiler:=Compiler new.
	stepTime := 33.
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
	#'squeak_changestamp' : 'KD 6/10/2024 08:33'
}
SKExecuter >> step [

	[stepTime > 0]
	ifTrue: [process pause. (Delay forMilliseconds: stepTime) wait. process resume.]
	
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
