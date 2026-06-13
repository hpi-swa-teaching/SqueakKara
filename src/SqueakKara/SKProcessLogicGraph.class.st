Class {
	#name : #SKProcessLogicGraph,
	#superclass : #SKProcess,
	#instVars : [
		'runner'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 16:17'
}
SKProcessLogicGraph >> isSuspended [

	^ self process isSuspended
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 16:18'
}
SKProcessLogicGraph >> isTerminated [

	^ self process isTerminated
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 12:44'
}
SKProcessLogicGraph >> resume [

	self process resume
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 16:38'
}
SKProcessLogicGraph >> runner [

	^ runner
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 16:38'
}
SKProcessLogicGraph >> runner: aRunner [

	runner := aRunner
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 16:49'
}
SKProcessLogicGraph >> startWithCode: aCode context: aContext [

	| process |

	self process ifNotNil: [ self process terminate ].
	self code: aCode;
		context: aContext.

	self runner: (SKLogicRunner newWithExecutionContext: self context).	
	self runner attachToGraph: aCode.
	process := [[ self runner executeLogicGraph ] ensure: [ 
			self scheduler finishActor: self context kara ]] forkAt: self priority.
	self process: process.
	^ process
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 12:44'
}
SKProcessLogicGraph >> suspend [

	self process suspend
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 12:44'
}
SKProcessLogicGraph >> terminate [

	self process terminate
]
