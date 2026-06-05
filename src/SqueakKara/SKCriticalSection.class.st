Class {
	#name : #SKCriticalSection,
	#superclass : #SKGridObject,
	#instVars : [
		'group'
	],
	#category : #SqueakKara
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
	#'squeak_changestamp' : 'LM 6/5/2026 13:12'
}
SKCriticalSection >> defaultColor [

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
