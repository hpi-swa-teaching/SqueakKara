Class {
	#name : #SKWorkspace,
	#superclass : #Workspace,
	#instVars : [
		'kara'
	],
	#category : #'SqueakKara-Core'
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
	#'squeak_changestamp' : 'KD 6/12/2024 18:29'
}
SKWorkspace >> getExampleCode [
	
	^'[kara onCloverleaf not]
	whileTrue: [
		kara trunkAhead 
			ifTrue: [kara turn: right]
			ifFalse: [kara move]]'

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'KD 6/12/2024 18:41'
}
SKWorkspace >> initializeWithKara: aKara [
	
	super initialize.
	self buildAndOpen.
	self windowTitle: 'SKWorkspace'.
	
	"replace, when kara turn method is updated"
	"self bindings at: #left put: SKDirection left."
	self bindings at: #left put: 'left'.
	self bindings at: #right put: 'right'.
	self bindings at: #kara put: aKara.
	self contents: self getExampleCode.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:35'
}
SKWorkspace >> kara [

	^kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 11:37'
}
SKWorkspace >> kara: aKara [

	kara := aKara.
	self bindings at: #kara put: aKara.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/18/2024 11:09'
}
SKWorkspace >> userCode [
	
	"user code with appended other stuff"
	
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
