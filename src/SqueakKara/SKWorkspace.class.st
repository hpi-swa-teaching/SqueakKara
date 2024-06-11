Class {
	#name : #SKWorkspace,
	#superclass : #Workspace,
	#instVars : [
		'textMorph'
	],
	#category : #SqueakKara
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 5/29/2024 15:12'
}
SKWorkspace >> getExampleCode [
	
	^'kara move.'

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 5/29/2024 15:15'
}
SKWorkspace >> getSetupCode [
	
	^'
| kara |
	
kara = SKKaraObject new.
'

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 6/10/2024 22:41'
}
SKWorkspace >> getUserCode [
	"user code with appended other stuff"
	|code|
	
	code := self contents.
	^ code
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 5/29/2024 15:21'
}
SKWorkspace >> initialize [
	
	super initialize.
	self buildAndOpen.
	self windowTitle: 'SKWorkspace'.
	self bindings at: #kara put: 'KARA!'.
	self contents: self getExampleCode.

]
