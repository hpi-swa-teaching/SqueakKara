"
SKWorkspace extends the pre-existing workspace to allow the user a way to write code which can then be executed and visualized within the SKGrid.

Instance Variables
	executer:		<SKExecuter>
	kara:			<SKKara>
	color:			<Color>
	closeListener:	<Block>

executer
	- The corresponding executer of the workspace.
	
kara
	- A reference to the kara which is controlled by this workspace.

color
	- The color of the workspace. This is matched with the color of the kara.
	
closeListener
	- A Block of code that is being called without any arguments if the SKWorkspace is being closed.


"
Class {
	#name : #SKWorkspace,
	#superclass : #Workspace,
	#instVars : [
		'executer',
		'kara',
		'color',
		'closeListener'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'AB 7/5/2026 13:46'
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
	#category : #'instance creation',
	#'squeak_changestamp' : 'LM 5/21/2026 10:40'
}
SKWorkspace class >> newWithExecuter: anExecuter and: aKara [

	^ self new
		executer: anExecuter;
		kara: aKara;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 6/4/2026 09:20'
}
SKWorkspace >> canDiscardEdits [

	^ true
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/23/2026 18:26'
}
SKWorkspace >> close [

	self changed: #close.
	self kara delete
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/23/2026 18:42'
}
SKWorkspace >> closeListener [

	^ closeListener
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/23/2026 18:42'
}
SKWorkspace >> closeListener: aBlock [

	closeListener := aBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AB 5/21/2026 18:07'
}
SKWorkspace >> color [
	
	^ color ifNil: [ self defaultColor ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/23/2026 13:47'
}
SKWorkspace >> color: aColor [

	color := aColor.
	self changed: #windowColorToUse
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AB 5/21/2026 18:24'
}
SKWorkspace >> defaultColor [

	^ Color red
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/21/2026 10:00'
}
SKWorkspace >> evaluateExpression: aCode [

	self executer execute: aCode for: self kara
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
	#'squeak_changestamp' : 'ND 7/5/2026 12:18'
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
	#'squeak_changestamp' : 'LM 5/21/2026 09:57'
}
SKWorkspace >> kara [

	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AB 5/21/2026 18:13'
}
SKWorkspace >> kara: aKara [

	kara := aKara.
	self color: self kara color
]

{
	#category : #closing,
	#'squeak_changestamp' : 'LM 5/23/2026 18:15'
}
SKWorkspace >> superClose [

	self changed: #close
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/21/2026 21:42'
}
SKWorkspace >> windowColorToUse [

	 ^ self color
]

{
	#category : #closing,
	#'squeak_changestamp' : 'LM 5/23/2026 18:42'
}
SKWorkspace >> windowIsClosing [

	self kara superDelete.
	"Used for testing only"
	self closeListener value
]
