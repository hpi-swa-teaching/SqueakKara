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
	#'squeak_changestamp' : 'JS 5/12/2026 19:01'
}
SKWorkspace >> delete [

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
	#'squeak_changestamp' : 'JS 7/6/2026 11:35'
}
SKWorkspace >> getExampleCode [
	^ '"
To solve this challenge use following functions. If you struggle with the syntax, use BLOCKS first.

COMMANDS: kara
	move, turn left/right, push
	
	Note, push only works on mushrooms and, if successful, also includes a move operation.
        
SENSORS: kara
	onCloverleaf, trunkAhead, mushroomAhead
	
FLOWCONTROL: 
	(amount) timesRepeat: [ (action) ].
	(condition) ifTrue: [ (action) ] ifFalse: [ (action) ].
	(condition) whileFalse: [ (action) ].
	
VARIABLES:
	Creation: | variableName | 
	Declaration: variableName := Value.
	Access: variableName
	
LOGIC:
	Comparison: 
		(value1) = (value2).
		(value1) > (value2).
		(value1) < (value2).
	And: (value1) and: (value2).
	Or: (value1) or: (value2).	

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
	#'squeak_changestamp' : 'JS 5/15/2026 22:23'
}
SKWorkspace >> resetKara: aKara [
	self bindings at: #kara put: aKara.
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
