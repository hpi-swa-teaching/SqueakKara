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
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 20:20'
}
SKExecuteControlsTest >> environment [

	^ environment
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/12/2024 11:34'
}
SKExecuteControlsTest >> setUp [

	environment := (SKEnvironment newWithKaraAt: 1 @ 1).
	controls := environment executeControls.
]

{
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/12/2024 11:45'
}
SKExecuteControlsTest >> tearDown [

	environment close
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 20:18'
}
SKExecuteControlsTest >> testRun [

	self environment programmingUI setCode: 'kara move'.
	controls actionRun.
	
	"Busy waiting until execution done."
	environment executer waitUntilTerminated.
	
	self assert: environment karas first coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:45'
}
SKExecuteControlsTest >> testRunPause [

	self environment programmingUI setCode: 'kara move. kara move. kara move'.

	controls actionRun.
	(Delay forMilliseconds: 1) wait.

	controls actionRun.

	self assert: environment executer state = #suspended.
	self assert: (environment executer processes anySatisfy: [ :process |
		process isSuspended ])
]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/12/2024 11:42'
}
SKExecuteControlsTest >> testSlider [
	
	controls sliderSpeedValueChanged: 10.
	self assert: environment executer speed = 10.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:45'
}
SKExecuteControlsTest >> testStop [

	self environment programmingUI setCode: 'kara move.'.
	controls actionRun.
	controls actionStop.
	self assert: environment executer state = #terminated.
]
