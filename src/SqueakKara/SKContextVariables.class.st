Class {
	#name : #SKContextVariables,
	#superclass : #Dictionary,
	#instVars : [
		'dictionary'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:59'
}
SKContextVariables >> at: aKey [

	(self dictionary includesKey: aKey) ifFalse: [
			self dictionary at: aKey put: nil.
			Transcript show: '[ContextVariables] Key not found'; cr].
		
	^ self dictionary at: aKey
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 21:44'
}
SKContextVariables >> at: aKey put: aValue [

	self dictionary at: aKey put: aValue
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 21:41'
}
SKContextVariables >> dictionary [

	^ dictionary ifNil: [dictionary := Dictionary new]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:26'
}
SKContextVariables >> includes: aKey [

	^ self dictionary includes: aKey
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 22:27'
}
SKContextVariables >> includesKey: aKey [

	^ self dictionary includesKey: aKey
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/5/2026 21:41'
}
SKContextVariables >> reset [
	
	dictionary := nil 
]
