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
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/26/2026 17:21'
}
SKEnvironmentTest >> environment: anObject [

 	environment := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'JS 5/26/2026 17:21'
}
SKEnvironmentTest >> setUp [

	self environment: (SKEnvironment newWithKaraAt: 1 @ 1)
]

{
	#category : #setup,
	#'squeak_changestamp' : 'JS 5/26/2026 16:08'
}
SKEnvironmentTest >> tearDown [

	(self environment) close
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SSP 5/25/2026 23:50'
}
SKEnvironmentTest >> testCreation [

	self assert: self environment kara coordinates = (1 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SSP 5/25/2026 23:51'
}
SKEnvironmentTest >> testDetectCloverleaf [
	self environment workspace userCode: 'kara onCloverleaf ifTrue: [kara move]'.
	SKCloverleaf newInGrid: self environment grid at: 1 @ 1.
	"self environment executer speed: 0."
	self environment run.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self assert: (self environment kara coordinates = (2 @ 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:18'
}
SKEnvironmentTest >> testDetectNoCloverleaf [

	self environment workspace userCode: 'kara onCloverleaf ifTrue: [kara move]'.
	self environment run.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self assert: self environment kara coordinates = (1 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:21'
}
SKEnvironmentTest >> testDetectNoTrunk [

	self environment workspace userCode: 'kara trunkAhead ifTrue: [kara turn: right. kara move]'.
	self environment run.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self assert: self environment kara coordinates = (1 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 19:04'
}
SKEnvironmentTest >> testDetectTrunk [

	self environment workspace userCode: 'kara trunkAhead ifTrue: [kara turn: right. kara move]'.
	SKTrunk newInGrid: self environment grid at: 2 @ 1.
	self environment run.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self assert: self environment kara coordinates = (1 @ 2)
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
	#'squeak_changestamp' : 'JJG 6/18/2024 19:06'
}
SKEnvironmentTest >> testMoveTwice [

	self environment workspace userCode: 'kara move. kara move'.
	self environment run.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self assert: self environment kara coordinates = (3 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 19:07'
}
SKEnvironmentTest >> testTurnLeftMove [

	self environment kara coordinates: (2 @ 2).
	self environment workspace userCode: 'kara turn: left. kara move'.
	self environment run.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self assert: self environment kara coordinates = (2 @ 1)
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
