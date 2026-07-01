Class {
	#name : #SKBlockEditor,
	#superclass : #Morph,
	#instVars : [
		'startBlock',
		'window',
		'functionStarts',
		'isWatchingChanges',
		'blockMax'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/24/2026 20:00'
}
SKBlockEditor >> blockMax [

	^ blockMax ifNil:[^ 15]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/24/2026 20:00'
}
SKBlockEditor >> blockMax: aNumber [

	blockMax := aNumber
]

{
	#category : #'submorphs - tracking',
	#'squeak_changestamp' : 'FR 6/9/2026 23:09'
}
SKBlockEditor >> nextAvailableFunctionNameFor: aString [

	| counter newKey |
	
	counter := 1.
	newKey := aString, ' ', counter asString.
	[self functionStarts includesKey: newKey] whileTrue: [
		counter := counter + 1.
		newKey := aString, ' ', counter asString.
	].
	^ newKey
]

{
	#category : #resizing,
	#'squeak_changestamp' : 'FR 6/24/2026 19:35'
}
SKBlockEditor >> ownerChanged [

	super ownerChanged.
	self isWatchingChanges ifTrue: [self expandIfNeededToInclude: self owner innerBounds. self refreshBlockCount]
	
]

{
	#category : #'submorphs - tracking',
	#'squeak_changestamp' : 'FR 6/29/2026 20:40'
}
SKBlockEditor >> refreshBlockCount [

	| result |
	
	result := self startBlock blockCount - 1.
	self functionStarts keysDo: [:key | result := (self functionStartWithName: key) blockCount + result].
	self setBlockCountDisplay: result
	
]

{
	#category : #'submorphs - tracking',
	#'squeak_changestamp' : 'FR 6/29/2026 20:40'
}
SKBlockEditor >> setBlockCountDisplay: aNumber [
	
	aNumber > self blockMax ifTrue:[(self startBlock blockParts at: 2) defaultUIEntry color: Color red]
		ifFalse:[(self startBlock blockParts at: 2) defaultUIEntry color: Color black].
	(self startBlock blockParts at: 2) setDefaultUIText: aNumber asString, ' / ', self blockMax asString
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/24/2026 19:56'
}
SKBlockEditor >> startBlock [

	^ startBlock ifNil: [startBlock := SKActionBlock new
		addLabel: 'Start of Script';
		addStringPartWithText: '0 / 15';
		isStart: true;
		leftSource: false;
		yourself]
]

{
	#category : #'dropping/grabbing',
	#'squeak_changestamp' : 'FR 6/24/2026 19:34'
}
SKBlockEditor >> wantsDroppedMorph: aMorph event: anEvent [

	^ ((aMorph class = SKBlock) or: [aMorph class inheritsFrom: SKBlock])
]
