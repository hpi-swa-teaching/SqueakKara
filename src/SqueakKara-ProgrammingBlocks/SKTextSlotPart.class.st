"
A SKTextSlotPart is a Gap that by default allows text to be entered to change its value. This can be either only numeric when (#Integer) or any String.

Instance Variables
	type:		<Object>

type
	- the type of Text expected (and accepted) - also affects the type of blocks that can be placed into this Slot

"
Class {
	#name : #SKTextSlotPart,
	#superclass : #SKInputSlotPart,
	#instVars : [
		'type'
	],
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:36'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 19:47'
}
SKTextSlotPart >> defaultUIEntry [

	^ self defaultUI firstSubmorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 03:05'
}
SKTextSlotPart >> defaultValue [

	self type = #Integer ifTrue: [^ self defaultUIEntry contents string asInteger].
	^ self defaultUIEntry contents string
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 7/3/2026 03:01'
}
SKTextSlotPart >> initialize [
	
	
	super initialize.
	
	self color: Color white;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapCentering: #center;
		borderWidth: SKBlockStyle borderWidth // 2;
		cellPositioning: #center;
		layoutInset: 0;
		cornerStyle: #rounded;
		cornerRadius: SKBlockStyle blockPartHeight // 3;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		defaultUI: self makeDefaultUI;
		addMorphBack: self defaultUI;
		adjustLayoutBounds;
		minWidth: self width
	
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/29/2026 21:15'
}
SKTextSlotPart >> makeDefaultUI [

	| defaultEntry entryContainer |
	
	entryContainer := Morph new layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		listCentering: #center;
		wrapCentering: #center;
		cellPositioning: #center;
		layoutInset: SKBlockStyle unit * 3 @ SKBlockStyle unit;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		color: Color transparent.
	
	defaultEntry := SKTextEntry new contents: '30'; numericOnly: (self type = #Integer).
	defaultEntry on: #keyStroke send: #updateLayout to: self.
	
	entryContainer addMorphFront: defaultEntry;
		addMorphBack: (Morph new extent: defaultEntry width @ 0);
		adjustLayoutBounds.
		
	defaultEntry contents: '5'.
	^ entryContainer
	
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'FR 6/9/2026 19:48'
}
SKTextSlotPart >> setDefaultUIText: aString [

	self defaultUIEntry contents: aString; adjustLayoutBounds.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 18:55'
}
SKTextSlotPart >> type [

	^ type ifNil: [type := #String. ^ #String]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 19:06'
}
SKTextSlotPart >> type: anObject [

	type := anObject.
	self updateUIType
]

{
	#category : #updating,
	#'squeak_changestamp' : 'FR 6/29/2026 21:05'
}
SKTextSlotPart >> updateLayout [

	super updateLayout.
	self type = #Integer ifTrue:[self cornerRadius: self height // 2].
]

{
	#category : #updating,
	#'squeak_changestamp' : 'FR 6/29/2026 21:19'
}
SKTextSlotPart >> updateUIType [

	self defaultUIEntry numericOnly: (self type = #Integer).
	self updateLayout
]
