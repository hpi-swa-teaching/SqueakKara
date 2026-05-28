Class {
	#name : #SKBlockSource,
	#superclass : #Morph,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:13'
}
SKBlockSource >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:12'
}
SKBlockSource >> initialize [

	super initialize.
	
	self color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		layoutInset: 10;
		hResizing: #spaceFill;
	 	vResizing: #spaceFill;
		cellPositioning: #topLeft;
		cellGap: 10;
		populate
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:12'
}
SKBlockSource >> mouseDown: anEvent [ 

	(self targetMorphAt: anEvent)
		ifNotNil: [anEvent hand
				waitForClicksOrDrag: self
				event: anEvent
				selectors: {nil. nil. nil. #startDrag:}
				threshold: HandMorph dragThreshold]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 10:10'
}
SKBlockSource >> populate [

	self addMorphBack: (SKActionBlock new
		label: 'move';
		action: ['kara move'];
		category: #movement;
		yourself).

	self addMorphBack: (SKActionBlock new
		label: 'move';
		addIntegerPart: 'steps' withDefault: 3;
		action: [:steps | steps,' timesRepeat: [kara move]']; 
		category: #movement;
		yourself).

	self addMorphBack: (SKActionBlock new
		label: 'turn left';
		action: ['kara turn: left'];
		category: #movement;
		yourself).

	self addMorphBack: (SKActionBlock new
		label: 'turn right';
		action: ['kara turn: right'];
		category: #movement;
		yourself).

	self addMorphBack: (SKCompoundActionBlock new
		label: 'if';
		addBooleanPart: 'then' withDefault: '';
		action: [:body :condition | condition,' ifTrue: [', body, '].'];
		yourself).

	self addMorphBack: (SKCompoundActionBlock new
		label: 'repeat';
		addIntegerPart: 'times' withDefault: '3';
		action: [:body :times | times,' timesRepeat: [', body, '].'];
		yourself).

	self addMorphBack: (SKBooleanBlock new
		label: 'trunk ahead?';
		value: ['kara trunkAhead'];
		category: #sensing;
		yourself).

	self addMorphBack: (SKBooleanBlock new
		label: 'on cloverleaf?';
		value: ['kara onCloverleaf'];
		category: #sensing;
		yourself).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:12'
}
SKBlockSource >> startDrag: anEvent [

	| hit |
	
	(hit := self targetMorphAt: anEvent) ifNil:[^self].
	anEvent hand grabMorph: (hit duplicate leftSource: true)
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:12'
}
SKBlockSource >> targetMorphAt: anEvent [

	| hits |
	
	hits := self morphsAt: anEvent cursorPoint.
	hits := hits select:[:m| m owner == self].
	(hits isEmpty or:[hits size >1]) ifTrue:[^nil].
	^hits first

]
