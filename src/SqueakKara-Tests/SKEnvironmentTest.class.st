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
	#'squeak_changestamp' : 'LM 5/7/2026 23:02'
}
SKEnvironmentTest >> setUp [

	environment := (SKEnvironment newWithKaraAt: 1 @ 1).
	environment executer testMode: true
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
	#'squeak_changestamp' : 'LM 5/7/2026 22:43'
}
SKEnvironmentTest >> testCreation [

	self assert: self environment karas first coordinates = (1 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:44'
}
SKEnvironmentTest >> testDetectCloverleaf [

	self environment programmingUI setCode: 'kara onCloverleaf ifTrue: [kara move]'.
	SKCloverleaf newInGrid: self environment grid at: 1 @ 1.

	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: (self environment karas first coordinates = (2 @ 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:44'
}
SKEnvironmentTest >> testDetectNoCloverleaf [

	self environment programmingUI setCode: 'kara onCloverleaf ifTrue: [kara move]'.
	
	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: self environment karas first coordinates = (1 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:44'
}
SKEnvironmentTest >> testDetectNoTrunk [

	self environment programmingUI setCode: 'kara trunkAhead ifTrue: [kara turn: right. kara move]'.
	
	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: self environment karas first coordinates = (1 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:45'
}
SKEnvironmentTest >> testDetectTrunk [

	self environment programmingUI setCode: 'kara trunkAhead ifTrue: [kara turn: right. kara move]'.
	SKTrunk newInGrid: self environment grid at: 2 @ 1.
	
	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: self environment karas first coordinates = (1 @ 2)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:45'
}
SKEnvironmentTest >> testMove [

	self environment programmingUI setCode: 'kara move'.
	
	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: self environment karas first coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 5/7/2026 23:08'
}
SKEnvironmentTest >> testMoveTwice [

	self environment workspace userCode: 'kara move. kara move'.
	
	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.

	self assert: self environment karas first coordinates = (3 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:45'
}
SKEnvironmentTest >> testTurnLeftMove [

	self environment karas first coordinates: (2 @ 2).
	self environment programmingUI setCode: 'kara turn: left. kara move'.
	
	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: self environment karas first coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:45'
}
SKEnvironmentTest >> testTurnRightMove [

	self environment programmingUI setCode: 'kara turn: right. kara move'.
	
	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: self environment karas first coordinates = (1 @ 2)
]
