Class {
	#name : #SKWindowManagerTest,
	#superclass : #TestCase,
	#instVars : [
		'manager'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:31'
}
SKWindowManagerTest >> setUp [
	manager := SKWindowManager new
]

{
	#category : #setup,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:31'
}
SKWindowManagerTest >> tearDown [
	manager openWindows do: [:w | w delete].
	manager delete
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:36'
}
SKWindowManagerTest >> testActionCloseAllWindows [
	| a b |
	a := SystemWindow new openInWorld.
	b := SystemWindow new openInWorld.
	manager addWindow: a.
	manager addWindow: b.
	manager actionCloseAllWindows.
	self assert: a owner isNil.
	self assert: b owner isNil
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:35'
}
SKWindowManagerTest >> testAddMultipleWindows [
	| a b |
	a := SystemWindow new.
	b := SystemWindow new.
	manager addWindow: a.
	manager addWindow: b.
	self assert: manager openWindows size = 2.
	self assert: (manager openWindows includes: a).
	self assert: (manager openWindows includes: b)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:35'
}
SKWindowManagerTest >> testAddWindow [
	| window |
	window := SystemWindow new.
	manager addWindow: window.
	self assert: (manager openWindows includes: window).
	self assert: manager openWindows size = 1
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:36'
}
SKWindowManagerTest >> testBuildConfirmationWindow [
	| sysWin confirmation |
	sysWin := SystemWindow new openInWorld.
	manager addWindow: sysWin.
	manager buildConfirmationWindow.
	confirmation := manager openWindows last.
	self assert: (confirmation isKindOf: SKCloseConfirmationWindow).
	self assert: confirmation windowManager == manager
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:37'
}
SKWindowManagerTest >> testBuildConfirmationWindowAddsToOpenWindows [
	| sysWin sizeBefore |
	sysWin := SystemWindow new openInWorld.
	manager addWindow: sysWin.
	sizeBefore := manager openWindows size.
	manager buildConfirmationWindow.
	self assert: manager openWindows size = (sizeBefore + 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SSP 5/26/2026 13:34'
}
SKWindowManagerTest >> testInitializeHasEmptyOpenWindows [
	self assert: manager openWindows isEmpty.
]
