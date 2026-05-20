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
	#'squeak_changestamp' : 'EB 7/12/2024 11:47'
}
SKExecuteControlsTest >> testRun [

	environment workspace userCode: 'kara move'.
	controls actionRun.
	environment executer step.
	self assert: environment kara coordinates = (2 @ 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'EB 7/12/2024 11:50'
}
SKExecuteControlsTest >> testRunPause [

	environment workspace userCode: 'kara move. kara move. kara move'.
	controls actionRun.
	environment executer step.
	controls actionRun.
	self assert: environment kara coordinates = (2 @ 1)
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
