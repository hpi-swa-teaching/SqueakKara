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
	#'squeak_changestamp' : 'JJG 6/18/2024 18:44'
}
SKEnvironmentTest >> tearDown [

	self environment close
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 5/2/2026 16:41'
}
SKEnvironmentTest >> testCreation [

	self assert: self environment karas first coordinates = (1 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 5/2/2026 18:59'
}
SKEnvironmentTest >> testDetectCloverleaf [

	self environment workspace contents: 'kara onCloverleaf ifTrue: [kara move]'.
	SKCloverleaf newInGrid: self environment grid at: 1 @ 1.
	"self environment executer speed: 0."
	self environment run.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self assert: (self environment karas first coordinates = (2 @ 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 5/2/2026 18:59'
}
SKEnvironmentTest >> testDetectNoCloverleaf [

	self environment workspace contents: 'kara onCloverleaf ifTrue: [kara move]'.
	self environment run.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self assert: self environment karas first coordinates = (1 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 5/2/2026 19:00'
}
SKEnvironmentTest >> testDetectNoTrunk [

	self environment workspace contents: 'kara trunkAhead ifTrue: [kara turn: right. kara move]'.
	self environment run.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self assert: self environment karas first coordinates = (1 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 5/2/2026 19:00'
}
SKEnvironmentTest >> testDetectTrunk [

	self environment workspace contents: 'kara trunkAhead ifTrue: [kara turn: right. kara move]'.
	SKTrunk newInGrid: self environment grid at: 2 @ 1.
	self environment run.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self assert: self environment karas first coordinates = (1 @ 2)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 5/2/2026 19:00'
}
SKEnvironmentTest >> testMove [

	self environment workspace contents: 'kara move'.
	self environment run.
	self environment executer step.
	self assert: self environment karas first coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 5/2/2026 19:00'
}
SKEnvironmentTest >> testMoveTwice [

	self environment workspace contents: 'kara move. kara move'.
	self environment run.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self assert: self environment karas first coordinates = (3 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 5/2/2026 19:00'
}
SKEnvironmentTest >> testTurnLeftMove [

	self environment karas first coordinates: (2 @ 2).
	self environment workspace contents: 'kara turn: left. kara move'.
	self environment run.
	self environment executer step.
	self environment executer step.
	self environment executer step.
	self assert: self environment karas first coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 5/2/2026 19:00'
}
SKEnvironmentTest >> testTurnRightMove [

	self environment workspace contents: 'kara turn: right. kara move'.
	self environment run.
	self environment executer step.
	self environment executer step.
	self assert: self environment karas first coordinates = (1 @ 2)
]
