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
	#'squeak_changestamp' : 'JS 7/6/2026 10:56'
}
SKProgrammingUIBlocks >> build [

	self blockEditor: SKBlockEditor new.
	self environment windowManager addWindow: (self blockEditor open).
]

{
	#category : #actions,
	#'squeak_changestamp' : 'FR 6/10/2026 00:08'
}
SKProgrammingUIBlocks >> getCode [

	^ self blockEditor getCode
]
