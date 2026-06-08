Class {
	#name : #SKProcessLogicGraph,
	#superclass : #SKProcess,
	#category : #'SqueakKara-Core'
}

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 12:44'
}
SKProcessLogicGraph >> isSuspended [

	self process isSuspended
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 12:44'
}
SKProcessLogicGraph >> isTerminated [

	self process terminate
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 12:44'
}
SKProcessLogicGraph >> resume [

	self process resume
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 12:53'
}
SKProcessLogicGraph >> startWithCode: aCode context: aContext [

	| process runner |

	self process ifNotNil: [ self process terminate ].
	self code: aCode;
		context: aContext.

	runner := SKLogicRunner newWithExecutionContext: self context.	
	runner attachToGraph: aCode.
	process := [[ runner executeLogicGraph ] ensure: [ 
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
