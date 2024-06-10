Class {
	#name : #SKExecuter,
	#superclass : #Object,
	#instVars : [
		'kara',
		'codeString',
		'ctxt',
		'compiler',
		'process'
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
	#'squeak_changestamp' : 'EB 6/11/2024 00:06'
}
SKExecuter >> execute: aCode [

	self process: [self executeBlock: aCode] fork.
	[self process isTerminated not] whileTrue:[
		(Delay forSeconds: 2)  wait.
		(self process isSuspended and: [self process isTerminated not]) ifTrue: [self process resume.]
		].
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/10/2024 22:37'
}
SKExecuter >> executeBlock: aBlock [
	
	ctxt:=compiler evaluate: aBlock for: self.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 6/10/2024 22:24'
}
SKExecuter >> initialize [

	compiler:=Compiler new.
	kara := SKKara new.
	kara doneReceiver: self.
	ctxt:=compiler evaluate: 'Transcript show: ''Executer Init.'''.
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
	#'squeak_changestamp' : 'EB 6/11/2024 00:06'
}
SKExecuter >> karadone [
	(self process isSuspended) ifFalse: [self process suspend.].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/10/2024 22:32'
}
SKExecuter >> process [
	^ process
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/10/2024 22:32'
}
SKExecuter >> process: anObject [
	process := anObject
]
