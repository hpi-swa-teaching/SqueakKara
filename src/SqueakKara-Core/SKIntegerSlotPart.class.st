Class {
	#name : #SKIntegerSlotPart,
	#superclass : #SKInputSlotPart,
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 01:34'
}
SKIntegerSlotPart >> defaultValue [

	^ defaultUI firstSubmorph contents string asInteger
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 01:20'
}
SKIntegerSlotPart >> initialize [
	
	
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
	#'squeak_changestamp' : 'FR 6/9/2026 01:10'
}
SKIntegerSlotPart >> keyStroke [

	self updateLayout
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 01:50'
}
SKIntegerSlotPart >> makeDefaultUI [

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
	
	defaultEntry := SKTextEntry new contents: '30'.
	defaultEntry on: #keyStroke send: #keyStroke to: self.
	
	entryContainer addMorphFront: defaultEntry;
		addMorphBack: (Morph new extent: defaultEntry width @ 0);
		adjustLayoutBounds.
		
	defaultEntry contents: '5'.
	^ entryContainer
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:06'
}
SKIntegerSlotPart >> type [

	^ #Integer
]
