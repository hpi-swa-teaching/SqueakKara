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
	#'squeak_changestamp' : 'SLH 6/3/2026 05:09'
}
SKIntegerSlotPart >> initialize [
	
	super initialize.
	
	self color: Color white;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapCentering: #center;
		cellPositioning: #center;
		layoutInset: 4@2;
		cornerStyle: #rounded;
		cornerRadius: 12;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap.
		
	self defaultUI: (TextMorph new contents: '3').
	
	self addMorphBack: self defaultUI.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 04:06'
}
SKIntegerSlotPart >> type [

	^ #Integer.
]
