Class {
	#name : #SKTextSlotPart,
	#superclass : #SKInputSlotPart,
	#instVars : [
		'type'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 18:56'
}
SKTextSlotPart >> defaultValue [

	type = #Integer ifTrue: [^ defaultUI firstSubmorph contents string asInteger].
	^ defaultUI firstSubmorph contents string
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 01:20'
}
SKTextSlotPart >> initialize [
	
	
	super initialize.
	
	self color: Color white;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapCentering: #center;
		borderWidth: SKBlockStyle borderWidth // 2;
		cellPositioning: #center;
		layoutInset: SKBlockStyle unit * 3 @ SKBlockStyle unit;
		cornerStyle: #rounded;
		cornerRadius: SKBlockStyle blockPartHeight // 2;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		defaultUI: self makeDefaultUI;
		addMorphBack: self defaultUI;
		adjustLayoutBounds;
		minWidth: self width
	
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 19:02'
}
SKTextSlotPart >> makeDefaultUI [

	| defaultEntry entryContainer |
	
	entryContainer := Morph new layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		listCentering: #center;
		wrapCentering: #center;
		cellPositioning: #center;
		layoutInset: 0;
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
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 19:20'
}
SKTextSlotPart >> setDefaultUIEntry: aString [

	self defaultUI firstSubmorph contents: aString; adjustLayoutBounds.
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
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 19:07'
}
SKTextSlotPart >> updateUIType [

	self defaultUI firstSubmorph numericOnly: (self type = #Integer).
]
