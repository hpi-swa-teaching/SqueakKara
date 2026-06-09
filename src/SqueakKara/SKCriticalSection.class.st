"
A SKCriticalSection is a field which is part of a group. If a kara locks a field with a critical section, all critical section of the same group will be locked.

Instance Variables
	group:		Group of the critical section

group
	- Symbol to identify groups

"
Class {
	#name : #SKCriticalSection,
	#superclass : #SKGridObject,
	#instVars : [
		'group'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'LM 6/8/2026 22:49'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 6/5/2026 13:04'
}
SKCriticalSection >> color: aColor [
	
	super color: aColor.
	self scaleToFactor
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LM 6/9/2026 18:46'
}
SKCriticalSection >> defaultColor [

	"Color of texture lines with transparency"
	^ (Color white alpha: 199 / 255)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 6/5/2026 12:35'
}
SKCriticalSection >> group [

	^ group
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 6/5/2026 13:13'
}
SKCriticalSection >> group: aSymbol [

	group := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 6/5/2026 13:16'
}
SKCriticalSection >> isCriticalSection [

	^ true
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LM 6/8/2026 22:19'
}
SKCriticalSection >> order [

	^ 0
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LM 6/5/2026 13:12'
}
SKCriticalSection >> scaleToFactor [
	
	super scaleToFactor.
	self updateColor
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LM 6/5/2026 12:57'
}
SKCriticalSection >> textureFilename [

	^ 'critical-section.png'
]
