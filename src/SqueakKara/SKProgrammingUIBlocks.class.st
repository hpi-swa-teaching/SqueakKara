Class {
	#name : #SKProgrammingUIBlocks,
	#superclass : #SKProgrammingUI,
	#instVars : [
		'blockSpace'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/2/2026 16:14'
}
SKProgrammingUIBlocks >> blockSpace [
	^ blockSpace
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/2/2026 16:14'
}
SKProgrammingUIBlocks >> blockSpace: aBlockSpace [
	blockSpace := aBlockSpace
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/2/2026 14:26'
}
SKProgrammingUIBlocks >> build [

	self environment windowManager addWindow: ((SKBlockSpace newWithController: self) window)
]

{
	#category : #actions,
	#'squeak_changestamp' : 'FR 6/2/2026 17:48'
}
SKProgrammingUIBlocks >> getCode [

	^ self blockSpace getCode
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:21'
}
SKProgrammingUIBlocks >> setCode: aCode [

	"it is also possile to generate Blocks out of given code"
	self code: aCode
]
