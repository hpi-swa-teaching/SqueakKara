Class {
	#name : #SKWorkspace,
	#superclass : #Workspace,
	#instVars : [
		'kara'
	],
	#category : #SqueakKara
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/12/2024 11:52'
}
SKWorkspace >> close [

	self abandon.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 5/29/2024 15:12'
}
SKWorkspace >> getExampleCode [
	
	^'kara move.'

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/12/2024 13:27'
}
SKWorkspace >> initialize [
	
	super initialize.
	self buildAndOpen.
	self windowTitle: 'SKWorkspace'.
	
	"replace, when kara turn method is updated"
	"self bindings at: #left put: SKDirection left."
	self bindings at: #left put: 'left'.
	self bindings at: #right put: 'right'.
	self contents: self getExampleCode.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/12/2024 11:35'
}
SKWorkspace >> kara [

	^kara
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/12/2024 11:37'
}
SKWorkspace >> kara: aKara [

	kara := aKara.
	self bindings at: #kara put: aKara.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/12/2024 12:07'
}
SKWorkspace >> userCode [
	"user code with appended other stuff"
	|code|
	
	code := self contents.
	^ code
]
