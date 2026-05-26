Class {
	#name : #SKProgrammingUI,
	#superclass : #Object,
	#instVars : [
		'code'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:53'
}
SKProgrammingUI >> close [

	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:05'
}
SKProgrammingUI >> code [

	^ code
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:05'
}
SKProgrammingUI >> code: aCode [

	code := aCode
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:53'
}
SKProgrammingUI >> getCode [

	self subclassResponsibility
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:53'
}
SKProgrammingUI >> open [

	self subclassResponsibility
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:43'
}
SKProgrammingUI >> setCode: aCode [

	self subclassResponsibility
]
