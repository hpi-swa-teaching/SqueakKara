Class {
	#name : #SKProgrammingUICode,
	#superclass : #SKProgrammingUI,
	#instVars : [
		'workspace'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:57'
}
SKProgrammingUICode >> close [
	
	self workspace delete
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:07'
}
SKProgrammingUICode >> getCode [
	
	self workspace ifNotNil: [ self code: self workspace userCode ].
	^ self code
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 18:57'
}
SKProgrammingUICode >> initialize [

	self workspace: Workspace new
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:05'
}
SKProgrammingUICode >> open [
	
	self workspace: Workspace open
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:07'
}
SKProgrammingUICode >> setCode: aCode [

	self workspace ifNotNil: [ self workspace userCode: aCode ].
	self code: aCode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 17:50'
}
SKProgrammingUICode >> workspace [

	^ workspace
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 17:51'
}
SKProgrammingUICode >> workspace: aWorkspace [

	workspace := aWorkspace
]
