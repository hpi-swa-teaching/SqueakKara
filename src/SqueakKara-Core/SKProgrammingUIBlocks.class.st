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
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:41'
}
SKProgrammingUIBlocks >> build [

	SKBlockSpace newWithController: self
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
