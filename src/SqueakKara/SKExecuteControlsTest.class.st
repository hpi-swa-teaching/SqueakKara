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
	#'squeak_changestamp' : 'JS 5/26/2026 16:14'
}
SKExecuteControlsTest >> controls [

 	^ controls
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/26/2026 16:12'
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
	#'squeak_changestamp' : 'JS 5/26/2026 16:13'
}
SKExecuteControlsTest >> tearDown [

	(self environment) close
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 5/26/2026 16:14'
}
SKExecuteControlsTest >> testRun [

	self environment workspace userCode: 'kara move'.
	controls actionRun.
	environment executer step.
	self assert: self environment kara coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 5/26/2026 16:14'
}
SKExecuteControlsTest >> testRunPause [

	self environment workspace userCode: 'kara move. kara move. kara move'.
	controls actionRun.
	self environment executer step.
	controls actionRun.
	self assert: environment kara coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 5/26/2026 16:13'
}
SKExecuteControlsTest >> testSlider [
	
	controls sliderSpeedValueChanged: 10.
	self assert: self environment executer speed = 10.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JS 5/26/2026 16:14'
}
SKExecuteControlsTest >> testStop [

	self environment workspace userCode: 'kara move.'.
	controls actionRun.
	controls actionStop.
	self assert: self environment executer state = #terminated.
]
