Class {
	#name : #SKEnvironmentTest,
	#superclass : #TestCase,
	#instVars : [
		'environment'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/18/2024 11:14'
}
SKEnvironmentTest >> environment [

 	^ environment
]

{
	#category : #setup,
	#'squeak_changestamp' : 'JJG 6/18/2024 11:33'
}
SKEnvironmentTest >> setUp [

	environment := (SKEnvironment newWithKaraAt: 1 @ 1)
]

{
	#category : #setup,
	#'squeak_changestamp' : 'JJG 6/18/2024 11:55'
}
SKEnvironmentTest >> tearDown [

	self environment grid abandon.
	"self environment workspace close."
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 11:40'
}
SKEnvironmentTest >> testCreation [

	self assert: self environment kara coordinates = (1 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 12:17'
}
SKEnvironmentTest >> testMove [

	self environment workspace userCode: 'kara move'.
	self environment run.
	self environment executer step.
	self assert: self environment kara coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 12:17'
}
SKEnvironmentTest >> testMoveTwice [

	self environment workspace userCode: 'kara move. kara move'.
	self environment run.
	self environment executer step.
	self environment executer step.
	self assert: self environment kara coordinates = (3 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 12:20'
}
SKEnvironmentTest >> testTurnRightMove [

	self environment workspace userCode: 'kara turn: right. kara move'.
	self environment run.
	self environment executer step.
	self environment executer step.
	self assert: self environment kara coordinates = (1 @ 2)
]
