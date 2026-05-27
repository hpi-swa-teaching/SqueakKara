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
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:49'
}
SKProgrammingUICode >> build [

	self workspace: (SKWorkspace newWithExecuter: (self executer))
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 20:17'
}
SKProgrammingUICode >> close [
	
	self workspace close
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:48'
}
SKProgrammingUICode >> getCode [
	
	^ self workspace userCode
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:40'
}
SKProgrammingUICode >> open [
	

]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 19:49'
}
SKProgrammingUICode >> setCode: aCode [

	self workspace userCode: aCode
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
