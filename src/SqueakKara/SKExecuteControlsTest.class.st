Class {
	#name : #SKExecuteControlsTest,
	#superclass : #TestCase,
	#instVars : [
		'environment',
		'controls'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 7/12/2024 11:34'
}
SKExecuteControlsTest >> setUp [

	environment := (SKEnvironment newWithKaraAt: 1 @ 1).
	controls := environment executeControls.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 7/12/2024 11:45'
}
SKExecuteControlsTest >> tearDown [

	environment close
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 5/21/2026 22:18'
}
SKExecuteControlsTest >> testMaxNumberRandomKaraSpawn [
	
	| karaCount |
	
	karaCount:= environment karas size.
	
	SKKara defaultColors size + 5 timesRepeat: [ controls actionSpawnKara ].

	self assert: environment karas size == (environment maxNumberOfKaras)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 5/25/2026 18:16'
}
SKExecuteControlsTest >> testRandomKaraSpawn [
	
	| karaCount |
	
	karaCount := environment karas size.
	
	controls actionSpawnKara.

	self assert: environment karas size == (karaCount + 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LM 5/7/2026 23:11'
}
SKExecuteControlsTest >> testRun [

	environment workspace userCode: 'kara move'.
	controls actionRun.
	
	"Busy waiting until execution done."
	environment executer waitUntilTerminated.
	
	self assert: environment karas first coordinates = (2 @ 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LM 5/7/2026 23:09'
}
SKExecuteControlsTest >> testRunPause [

	environment workspace userCode: 'kara move. kara move. kara move'.

	controls actionRun.
	(Delay forMilliseconds: 1) wait.

	controls actionRun.

	self assert: environment executer state = #suspended.
	self assert: (environment executer processes anySatisfy: [ :process |
		process isSuspended ])
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 7/12/2024 11:42'
}
SKExecuteControlsTest >> testSlider [
	
	controls sliderSpeedValueChanged: 10.
	self assert: environment executer speed = 10.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 7/12/2024 11:51'
}
SKExecuteControlsTest >> testStop [

	environment workspace userCode: 'kara move.'.
	controls actionRun.
	controls actionStop.
	self assert: environment executer state = #terminated.
]
