Class {
	#name : #SKExecuteControlsTest,
	#superclass : #TestCase,
	#instVars : [
		'environment',
		'controls'
	],
	#category : #SqueakKaraTests
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
	#'squeak_changestamp' : 'LM 6/4/2026 09:25'
}
SKExecuteControlsTest >> tearDown [

	environment close
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/25/2026 21:21'
}
SKExecuteControlsTest >> testMaxNumberRandomKaraSpawn [
	
	| karaCount |
	
	karaCount := environment karas size.
	
	controls addButtonSpawnKara.
	SKKara defaultColors size + 5 timesRepeat: [ controls buttonSpawnKara action ].

	self assert: environment karas size == (environment maxNumberOfKaras)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 7/1/2026 16:20'
}
SKExecuteControlsTest >> testNextChallenge [
	
	| world testEnvironment testEnvironmentNew |
	
	testEnvironment := SKEnvironment new initializeWithChallenge1.
	world := testEnvironment owner.
	testEnvironment executeControls addButtonNextChallenge.
	
	self assert: (world submorphs includes: (testEnvironment)).
	
	testEnvironmentNew := testEnvironment executeControls buttonNextChallenge action.
	
	self deny: (world submorphs includes: (testEnvironment)).
	
	testEnvironmentNew close
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/18/2026 21:58'
}
SKExecuteControlsTest >> testRandomKaraSpawn [
	
	| karaCount |
	
	karaCount := environment karas size.
	controls addButtonSpawnKara.
	
	controls buttonSpawnKara action.

	self assert: environment karas size == (karaCount + 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/18/2026 21:59'
}
SKExecuteControlsTest >> testRun [

	environment firstWorkspace userCode: 'kara move'.
	controls addButtonRun.
	controls buttonRun action.
	
	"Busy waiting until execution done."
	environment executer waitUntilTerminated.
	
	self assert: environment karas first coordinates = (2 @ 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/18/2026 21:59'
}
SKExecuteControlsTest >> testRunPause [

	environment firstWorkspace userCode: 'kara move. kara move. kara move'.

	controls addButtonRun.
	controls buttonRun action.
	(Delay forMilliseconds: 1) wait.

	controls buttonRun action.

	self assert: environment executer state = #suspended.
	self assert: (environment executer processes anySatisfy: [ :process |
		process isSuspended ])
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/18/2026 22:00'
}
SKExecuteControlsTest >> testSlider [
	
	controls addSliderSpeed.
	controls sliderSpeed sliderSpeedValueChanged: 10.
	self assert: environment executer speed = 10.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 7/2/2026 13:57'
}
SKExecuteControlsTest >> testStop [

	environment firstWorkspace userCode: 'kara move.'.
	controls addButtonRun.
	controls addButtonStop.
	controls buttonRun action.
	controls buttonStop action.
	self assert: environment executer state = #terminated.
]
