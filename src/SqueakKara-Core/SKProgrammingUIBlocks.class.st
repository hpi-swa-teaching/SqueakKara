Class {
	#name : #SKProgrammingUIBlocks,
	#superclass : #SKProgrammingUI,
	#instVars : [
		'code'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/2/2026 14:26'
}
SKProgrammingUIBlocks >> build [

	self environment windowManager addWindow: ((SKBlockSpace newWithController: self) window)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:19'
}
SKProgrammingUIBlocks >> code [

	^ code
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:19'
}
SKProgrammingUIBlocks >> code: aCode [

	code := aCode
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:20'
}
SKProgrammingUIBlocks >> getCode [

	^ code
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:21'
}
SKProgrammingUIBlocks >> setCode: aCode [

	"it is also possile to generate Blocks out of given code"
	self code: aCode
]
