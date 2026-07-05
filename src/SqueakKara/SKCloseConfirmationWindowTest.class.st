Class {
	#name : #SKCloseConfirmationWindowTest,
	#superclass : #TestCase,
	#instVars : [
		'manager',
		'confirmation',
		'sysWindow'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'FR 7/3/2026 14:11'
}
SKCloseConfirmationWindowTest >> setUp [

	manager := SKWindowManager new.
	sysWindow := SKChallengeWindow new windowManager: manager.
	sysWindow openInWorld.
	manager addWindow: sysWindow.
	manager buildConfirmationWindow.
	confirmation := manager openWindows last
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:40'
}
SKCloseConfirmationWindowTest >> tearDown [
	manager openWindows do: [:w | w delete].
	manager delete
]

{
	#category : #'ui testing',
	#'squeak_changestamp' : 'SSP 5/26/2026 13:42'
}
SKCloseConfirmationWindowTest >> testButtonDimensions [
	" to be honest - this is just UI and I don't know if we need to test that."
	self assert: confirmation buttonWidth = 100.
	self assert: confirmation buttonHeight = 30
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:45'
}
SKCloseConfirmationWindowTest >> testCloseAllWindowsDeletesChallengeWindow [
	confirmation closeAllWindows.
	self assert: sysWindow owner isNil
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:45'
}
SKCloseConfirmationWindowTest >> testCloseAllWindowsDeletesConfirmationWindow [
	confirmation closeAllWindows.
	self assert: confirmation owner isNil
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:44'
}
SKCloseConfirmationWindowTest >> testCloseOnlyConfirmationWindowDeletesSelf [
	self assert: confirmation owner notNil.
	confirmation closeOnlyConfirmationWindow.
	self assert: confirmation owner isNil
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:45'
}
SKCloseConfirmationWindowTest >> testCloseOnlyConfirmationWindowKeepsOtherWindows [
	confirmation closeOnlyConfirmationWindow.
	self assert: sysWindow owner notNil
]

{
	#category : #'ui testing',
	#'squeak_changestamp' : 'SSP 5/26/2026 13:41'
}
SKCloseConfirmationWindowTest >> testExtentMatchesWindowDimensions [
	self assert: confirmation extent = (confirmation windowWidth @ confirmation windowHeight)
]

{
	#category : #'ui testing',
	#'squeak_changestamp' : 'SSP 5/26/2026 13:43'
}
SKCloseConfirmationWindowTest >> testMessageTextSpacing [
	self assert: confirmation messageTextSpacing = (confirmation messageFontSize + 6)
]

{
	#category : #'ui testing',
	#'squeak_changestamp' : 'SSP 5/26/2026 13:40'
}
SKCloseConfirmationWindowTest >> testWindowManagerAccessor [
	self assert: confirmation windowManager == manager
]
