"
SKWorkspace extends the pre-existing workspace to allow the user a way to write code which can then be executed and visualized within the SKGrid.
"
Class {
	#name : #SKWorkspace,
	#superclass : #Workspace,
	#instVars : [
		'executer'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 16:03'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LM 5/7/2026 21:15'
}
SKWorkspace class >> newWithExecuter: anExecuter [

	^ self new
		executer: anExecuter;
		yourself
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:43'
}
SKWorkspace >> close [

	self changed: #close
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/7/2026 21:14'
}
SKWorkspace >> evaluateExpression: aCode [
	self executer execute: aCode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 21:09'
}
SKWorkspace >> executer [

	^ executer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 21:10'
}
SKWorkspace >> executer: anExecuter [

	executer := anExecuter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/29/2026 12:01'
}
SKWorkspace >> getExampleCode [
	^ '"
To solve this challenge use following functions:

COMMANDS: kara
	move, turn left/right
        
SENSORS: kara
	onCloverleaf, trunkAhead

INFO:
	You might run code by using the <do it> command [CTRL+D]. If you find yourself stuck in an infinite loop (Squeak might get unresponsive), just press [ALT+.] to interrupt the code execution.
"
'
]

{
	#category : #binding,
	#'squeak_changestamp' : 'LM 5/7/2026 21:17'
}
SKWorkspace >> hasBindingOf: aString [
	^ aString = 'kara' or: [ super hasBindingOf: aString ]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/7/2026 21:12'
}
SKWorkspace >> initialize [
	
	super initialize.
	self buildAndOpen.
	self windowTitle: 'SKWorkspace'.
	
	self bindings at: #left put: SKDirection rotateLeft.
	self bindings at: #right put: SKDirection rotateRight.
	self contents: self getExampleCode

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 16:57'
}
SKWorkspace >> userCode [
	
	| code |
	
	code := self contents.
	^ code
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/18/2024 11:10'
}
SKWorkspace >> userCode: aString [
	
	"to be used only for testing"
	
	self contents: aString
	
]
