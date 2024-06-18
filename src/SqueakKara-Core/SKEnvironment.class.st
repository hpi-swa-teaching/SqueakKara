Class {
	#name : #SKEnvironment,
	#superclass : #Object,
	#instVars : [
		'grid',
		'workspace',
		'executer',
		'kara'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'JJG 6/18/2024 11:38'
}
SKEnvironment class >> newWithKaraAt: aPoint [

	^ self basicNew initializeWithKaraAt: aPoint
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:43'
}
SKEnvironment >> close [

	self workspace close.
	self grid abandon.

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:40'
}
SKEnvironment >> executer [
	
	^ executer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:40'
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
	#'squeak_changestamp' : 'JJG 6/17/2024 16:40'
}
SKEnvironment >> grid [
	
	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:40'
}
SKEnvironment >> grid: anObject [
	
	grid := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JJG 6/18/2024 11:32'
}
SKEnvironment >> initialize [

	"self initializeWithChallenge1"
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:47'
}
SKEnvironment >> initializeWithChallenge1 [


	self grid: (SKGrid newWithExtent: 7 @ 7).
	self kara: self grid challenge1.
	self workspace: (SKWorkspace newWithKara: self kara).
	self executer: (SKExecuter new).
	(self executer kara) kara: self kara.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:47'
}
SKEnvironment >> initializeWithKaraAt: aPoint [


	self grid: (SKGrid newWithExtent: 7 @ 7).
	self kara: (SKKara newInGrid: self grid at: aPoint).
	self workspace: (SKWorkspace newWithKara: self kara).
	self executer: (SKExecuter new).
	(self executer kara) kara: self kara.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:41'
}
SKEnvironment >> kara [
	
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:41'
}
SKEnvironment >> kara: anObject [
	
	kara := anObject
]

{
	#category : #commands,
	#'squeak_changestamp' : 'KD 6/12/2024 13:29'
}
SKEnvironment >> pause [

	executer suspendExecution.
]

{
	#category : #commands,
	#'squeak_changestamp' : 'KD 6/12/2024 13:29'
}
SKEnvironment >> resume [

	executer resumeExecution.
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:41'
}
SKEnvironment >> run [
	
	|code|
	
	code :=  self workspace userCode.
	self executer execute: code
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:41'
}
SKEnvironment >> workspace [
	
	^ workspace
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:41'
}
SKEnvironment >> workspace: anObject [
	
	workspace := anObject
]
