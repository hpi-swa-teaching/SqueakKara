Class {
	#name : #SKIntegerSlotPart,
	#superclass : #SKInputSlotPart,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 04:05'
}
SKIntegerSlotPart >> defaultValue [

	^ defaultUI contents string asInteger
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 04:23'
}
SKIntegerSlotPart >> initialize [
	super initialize.
	
	"self color: Color white;
		borderWidth: 1;
		cornerStyle: #rounded;
		cornerRadius: 20;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap."
		
	self color: Color white;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		wrapCentering: #center;
		layoutInset: 3;
		cornerStyle: #rounded;
		cornerRadius: 12;
		vResizing: #shrinkWrap;
		cellPositioning: #center.
		
	self adjustLayoutBounds;
		minWidth: 24;
		hResizing: #shrinkWrap.
		
	self defaultUI: (TextMorph new contents: '3').
	
	self addMorphBack: defaultUI.
	
	
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 04:06'
}
SKIntegerSlotPart >> type [

	^ #Integer.
]
