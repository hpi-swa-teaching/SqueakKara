"
SKWorkspace extends the pre-existing workspace to allow the user a way to write code which can then be executed and visualized within the SKGrid.
"
Class {
	#name : #SKWorkspace,
	#superclass : #Workspace,
	#instVars : [
		'kara'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 16:03'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/12/2024 18:43'
}
SKWorkspace class >> newWithKara: aKara [

	^self basicNew initializeWithKara: aKara.
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:43'
}
SKWorkspace >> close [

	self changed: #close
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'NR 7/5/2024 15:14'
}
SKWorkspace >> getExampleCode [
	
	^ '"
To solve this challenge use following functions:

COMMANDS: kara
	move, turn left/right
		
SENSOREN: kara
	onCloverleaf, trunkAhead
"
'


]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:13'
}
SKWorkspace >> initializeWithKara: aKara [
	
	super initialize.
	self buildAndOpen.
	self windowTitle: 'SKWorkspace'.
	
	self bindings at: #left put: 'left'.
	self bindings at: #right put: 'right'.
	self bindings at: #kara put: aKara.
	self contents: self getExampleCode

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:13'
}
SKWorkspace >> kara [

	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:13'
}
SKWorkspace >> kara: aKara [

	kara := aKara.
	self bindings at: #kara put: aKara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:13'
}
SKWorkspace >> userCode [
	
	|code|
	
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
