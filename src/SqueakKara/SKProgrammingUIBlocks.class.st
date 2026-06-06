Class {
	#name : #SKProgrammingUIBlocks,
	#superclass : #SKProgrammingUI,
	#instVars : [
		'blockEditor'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/6/2026 15:09'
}
SKProgrammingUIBlocks >> blockEditor [

	^ blockEditor.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/6/2026 15:09'
}
SKProgrammingUIBlocks >> blockEditor: aBlockEditor [

	blockEditor := aBlockEditor.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'SLH 6/6/2026 15:25'
}
SKProgrammingUIBlocks >> build [

	self blockEditor: SKBlockEditor new.
	self environment windowManager addWindow: (self blockEditor open).
]

{
	#category : #actions,
	#'squeak_changestamp' : 'SLH 6/6/2026 15:09'
}
SKProgrammingUIBlocks >> getCode [

	^ self blockEditor getCode
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:21'
}
SKProgrammingUIBlocks >> setCode: aCode [

	"it is also possile to generate Blocks out of given code"
	self code: aCode
]
