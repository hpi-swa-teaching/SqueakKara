Class {
	#name : #SKEnvironment,
	#superclass : #Object,
	#instVars : [
		'grid',
		'workspace',
		'executer',
		'kara'
	],
	#category : #SqueakKara
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:52'
}
SKEnvironment >> close [

	self workspace close.
	self grid abandon.

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:22'
}
SKEnvironment >> executer [
	^ executer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:22'
}
SKEnvironment >> executer: anObject [
	executer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 12:16'
}
SKEnvironment >> executionSpeed: aSpeed [

	self executer speed: aSpeed.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:22'
}
SKEnvironment >> grid [
	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:22'
}
SKEnvironment >> grid: anObject [
	grid := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:43'
}
SKEnvironment >> initialize [


	self grid: (SKGrid newWithExtent: 20@20).
	self kara: (SKKara newInGrid: grid).
	self workspace: (SKWorkspace new).
	self workspace kara: (self kara).
	self executer: (SKExecuter new).
	(self executer kara) setRealKara: self kara.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:28'
}
SKEnvironment >> kara [
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:28'
}
SKEnvironment >> kara: anObject [
	kara := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:56'
}
SKEnvironment >> pause [
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:56'
}
SKEnvironment >> resume [
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 12:08'
}
SKEnvironment >> run [
	|code|
	code :=  self workspace userCode.
	self executer execute: code.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:22'
}
SKEnvironment >> workspace [
	^ workspace
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:22'
}
SKEnvironment >> workspace: anObject [
	workspace := anObject
]
