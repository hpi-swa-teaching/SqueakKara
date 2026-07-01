Class {
	#name : #SKProgrammingUITest,
	#superclass : #SKProgrammingUI,
	#instVars : [
		'code'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 13:10'
}
SKProgrammingUITest >> build [

	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 13:15'
}
SKProgrammingUITest >> close [
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 13:11'
}
SKProgrammingUITest >> code [

	^ code
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 13:11'
}
SKProgrammingUITest >> code: aCode [

	code := aCode
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 13:11'
}
SKProgrammingUITest >> getCode [

	^ self code
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 13:11'
}
SKProgrammingUITest >> setCode: aCode [

	self code: aCode
]
