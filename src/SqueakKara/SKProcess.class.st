Class {
	#name : #SKProcess,
	#superclass : #Object,
	#instVars : [
		'compiler',
		'context',
		'scheduler',
		'code'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:42'
}
SKProcess class >> newWithCompiler: aCompiler scheduler: aScheduler [

	^ (self new
			compiler: aCompiler;
			scheduler: aScheduler
			yourself)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:13'
}
SKProcess >> code [

	^ code
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:13'
}
SKProcess >> code: aCode [

	code := aCode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:06'
}
SKProcess >> compiler [

	^ compiler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:06'
}
SKProcess >> compiler: aCompiler [

	compiler := aCompiler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:06'
}
SKProcess >> context [

	^ context
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:06'
}
SKProcess >> context: aContext [

	context := aContext
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:55'
}
SKProcess >> isSuspended [

	self subclassResponsibility
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:55'
}
SKProcess >> isTerminated [

	self subclassResponsibility
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:12'
}
SKProcess >> priority [

	^ Processor userBackgroundPriority
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:56'
}
SKProcess >> resume [

	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:35'
}
SKProcess >> scheduler [

	^ scheduler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:41'
}
SKProcess >> scheduler: aScheduler [

	scheduler := aScheduler
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:05'
}
SKProcess >> startWithCode: aCode context: aContext [

	self subclassResponsibility
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 08:56'
}
SKProcess >> suspend [

	self subclassResponsibility
]

{
	#category : #interface,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:05'
}
SKProcess >> terminate [

	self subclassResponsibility
]
