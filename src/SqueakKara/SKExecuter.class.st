Class {
	#name : #SKExecuter,
	#superclass : #Object,
	#instVars : [
		'kara',
		'codeString',
		'ctxt',
		'compiler'
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
	#'squeak_changestamp' : 'KD 6/5/2024 17:30'
}
SKExecuter >> execute: aCode [

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/5/2024 18:11'
}
SKExecuter >> executeBlock: aBlock [
	
	|value|
	value:=compiler evaluate: aBlock in: ctxt to: self.
	ctxt:=value
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/5/2024 18:15'
}
SKExecuter >> initialize [

	compiler:=Compiler new.
	ctxt:=compiler evaluate: 'Transcript show: ''Executer Init'''.
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
