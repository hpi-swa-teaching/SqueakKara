Class {
	#name : #SKEnvironmentTest,
	#superclass : #TestCase,
	#instVars : [
		'environment'
	],
	#category : #SqueakKaraTests
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
	#'squeak_changestamp' : 'LM 5/7/2026 23:06'
}
SKEnvironmentTest >> testDetectCloverleaf [

	self environment workspace userCode: 'kara onCloverleaf ifTrue: [kara move]'.
	SKCloverleaf newInGrid: self environment grid at: 1 @ 1.

	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: (self environment karas first coordinates = (2 @ 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 5/7/2026 23:06'
}
SKEnvironmentTest >> testDetectNoCloverleaf [

	self environment workspace userCode: 'kara onCloverleaf ifTrue: [kara move]'.
	
	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: self environment karas first coordinates = (1 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 5/7/2026 23:06'
}
SKEnvironmentTest >> testDetectNoTrunk [

	self environment workspace userCode: 'kara trunkAhead ifTrue: [kara turn: right. kara move]'.
	
	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: self environment karas first coordinates = (1 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 5/7/2026 23:06'
}
SKEnvironmentTest >> testDetectTrunk [

	self environment workspace userCode: 'kara trunkAhead ifTrue: [kara turn: right. kara move]'.
	SKTrunk newInGrid: self environment grid at: 2 @ 1.
	
	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: self environment karas first coordinates = (1 @ 2)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 5/7/2026 23:06'
}
SKEnvironmentTest >> testMove [

	self environment workspace userCode: 'kara move'.
	
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
	#'squeak_changestamp' : 'LM 5/7/2026 23:02'
}
SKEnvironmentTest >> testTurnLeftMove [

	self environment karas first coordinates: (2 @ 2).
	self environment workspace userCode: 'kara turn: left. kara move'.
	
	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: self environment karas first coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 5/7/2026 23:08'
}
SKEnvironmentTest >> testTurnRightMove [

	self environment workspace userCode: 'kara turn: right. kara move'.
	
	self environment run.
	
	"Busy waiting until execution done."
	self environment executer waitUntilTerminated.
	
	self assert: self environment karas first coordinates = (1 @ 2)
]
