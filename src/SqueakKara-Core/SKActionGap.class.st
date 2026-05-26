Class {
	#name : #SKActionGap,
	#superclass : #SKBlockSpace,
	#instVars : [
		'command'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/26/2026 21:46'
}
SKActionGap >> updateCode [
	"this is obviously temporary"
	| code |
	code:= ''.
	self flag: #temp.
	self submorphsBehind: (self firstSubmorph) do: [:each | each action ifNotNil: [code:= code, each command, '.',  String cr]].
	self command: code.
]
