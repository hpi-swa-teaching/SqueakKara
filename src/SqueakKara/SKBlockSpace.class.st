Class {
	#name : #SKBlockSpace,
	#superclass : #AlignmentMorph,
	#instVars : [
		'kara',
		'environment',
		'start'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 15:21'
}
SKBlockSpace class >> newWithKara: aKara [
	^ self basicNew initializeWithKara: aKara.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/6/2026 00:14'
}
SKBlockSpace >> acceptDroppingMorph: aMorph event: anEvent [
	|response| "dont know if theres any but its too late"
	response := super acceptDroppingMorph: aMorph event: anEvent.
	self updateCode.
	^response
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 16:22'
}
SKBlockSpace >> addStartBlock [
	self start: (SKBlock new label: 'Start of Script').
	self addMorph: self start.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 23:39'
}
SKBlockSpace >> environment [
	^ environment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 23:39'
}
SKBlockSpace >> environment: anObject [
	environment := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/6/2026 00:56'
}
SKBlockSpace >> initializeWithKara: aKara [
	super initialize.
	self listDirection: #topToBottom;
	hResizing: #spaceFill;
	wrapCentering: #center;
	width: 500;
	height: 500;
	vResizing: #spaceFill;
	kara: aKara;
	openInWindowLabeled: 'SKBlockSpace'.
	SKBlockSource new.
	self addStartBlock

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 15:17'
}
SKBlockSpace >> kara [
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 15:17'
}
SKBlockSpace >> kara: anObject [
	kara := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 22:28'
}
SKBlockSpace >> objectHeight [
	^40
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 23:42'
}
SKBlockSpace >> start [
	^ start
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 23:42'
}
SKBlockSpace >> start: anObject [
	start := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/11/2026 18:07'
}
SKBlockSpace >> updateCode [
	"this is obviously temporary"
	| code behind |
	code:= ''.
	behind := false.
	self flag: #temp.
	self submorphsBehind: self start do: [:each | behind
		ifFalse: [ each action ifNotNil: [code:= code, each command, '.',  String cr]]].
	self environment workspace userCode: code.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/6/2026 00:51'
}
SKBlockSpace >> wantsDroppedMorph: aMorph event: anEvent [
	self flag: #toBeExtended.
	^(aMorph class = SKBlock) or: [SKBlock subclasses includes: aMorph class]
	 
]
