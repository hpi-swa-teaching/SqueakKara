Class {
	#name : #SKProcessCode,
	#superclass : #SKProcess,
	#instVars : [
		'process'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:15'
}
SKProcessCode >> isSuspended [

	^ self process isSuspended
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:15'
}
SKProcessCode >> isTerminated [

	^ self process isTerminated
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:11'
}
SKProcessCode >> process [
	
	^ process
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:12'
}
SKProcessCode >> process: aProcess [

	process := aProcess
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:15'
}
SKProcessCode >> resume [

	self process resume
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:14'
}
SKProcessCode >> startWithCode: aCode context: aContext [

	| process |

	self process ifNotNil: [ self process terminate ].
	self code: aCode;
		context: aContext.
		
	process := [ self compiler evaluate: aCode for: aContext ] forkAt: self priority.
	self process: process.
	^ process
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:15'
}
SKProcessCode >> suspend [

	self process suspend
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:15'
}
SKProcessCode >> terminate [

	self process terminate
]
