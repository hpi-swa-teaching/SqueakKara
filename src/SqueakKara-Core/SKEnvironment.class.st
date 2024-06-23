Class {
	#name : #SKEnvironment,
	#superclass : #Object,
	#instVars : [
		'grid',
		'workspace',
		'executer',
		'kara',
		'executeControls'
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
	#'squeak_changestamp' : 'EB 6/22/2024 14:11'
}
SKEnvironment >> executeControls [
	^ executeControls
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 14:11'
}
SKEnvironment >> executeControls: anObject [
	executeControls := anObject
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
	#'squeak_changestamp' : 'EB 6/22/2024 14:16'
}
SKEnvironment >> executerState [

	^ self executer state.
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
	#'squeak_changestamp' : 'KD 6/23/2024 20:56'
}
SKEnvironment >> initializeWithChallenge1 [


	self grid: (SKGrid newWithExtent: 7 @ 7).
	self kara: self grid challenge1.
	self workspace: (SKWorkspace newWithKara: self kara).
	self executer: (SKExecuter new).
	(self executer kara) kara: self kara.
	self executeControls: SKExecuteControls new.
	executeControls environment: self.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'KD 6/23/2024 20:56'
}
SKEnvironment >> initializeWithChallenge2 [


	self grid: (SKGrid newWithExtent: 9 @ 2).
	self kara: self grid challenge2.
	self workspace: (SKWorkspace newWithKara: self kara).
	self executer: (SKExecuter new).
	(self executer kara) kara: self kara.
	self executeControls: SKExecuteControls new.
	executeControls environment: self.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'KD 6/23/2024 20:57'
}
SKEnvironment >> initializeWithChallenge3 [


	self grid: (SKGrid newWithExtent: 9 @ 3).
	self kara: self grid challenge3.
	self workspace: (SKWorkspace newWithKara: self kara).
	self executer: (SKExecuter new).
	(self executer kara) kara: self kara.
	self executeControls: SKExecuteControls new.
	executeControls environment: self.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'EB 6/22/2024 14:11'
}
SKEnvironment >> initializeWithKaraAt: aPoint [


	self grid: (SKGrid newWithExtent: 7 @ 7).
	self kara: (SKKara newInGrid: self grid at: aPoint).
	self workspace: (SKWorkspace newWithKara: self kara).
	self executer: (SKExecuter new).
	(self executer kara) kara: self kara.
	self executeControls: SKExecuteControls new.
	executeControls environment: self.
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
	#category : #commands,
	#'squeak_changestamp' : 'EB 6/22/2024 14:30'
}
SKEnvironment >> stop [
	
	self executer terminate.
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
