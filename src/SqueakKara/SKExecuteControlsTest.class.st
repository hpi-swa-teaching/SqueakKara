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
	#category : #setup,
	#'squeak_changestamp' : 'EB 7/12/2024 11:34'
}
SKExecuteControlsTest >> setUp [

	environment := (SKEnvironment newWithKaraAt: 1 @ 1).
	controls := environment executeControls.
]

{
	#category : #setup,
	#'squeak_changestamp' : 'JS 5/26/2026 17:24'
}
SKExecuteControlsTest >> tearDown [

	environment close
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 5/26/2026 17:25'
}
SKExecuteControlsTest >> testRun [

	environment workspace userCode: 'kara move'.
	controls actionRun.
	environment executer step.
	self assert: environment kara coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 5/26/2026 17:25'
}
SKExecuteControlsTest >> testRunPause [

	environment workspace userCode: 'kara move. kara move. kara move'.
	controls actionRun.
	environment executer step.
	controls actionRun.
	self assert: environment kara coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 5/26/2026 17:24'
}
SKExecuteControlsTest >> testSlider [
	
	controls sliderSpeedValueChanged: 10.
	self assert: environment executer speed = 10.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 5/26/2026 17:24'
}
SKExecuteControlsTest >> testStop [

	environment workspace userCode: 'kara move.'.
	controls actionRun.
	controls actionStop.
	self assert: environment executer state = #terminated.
]
