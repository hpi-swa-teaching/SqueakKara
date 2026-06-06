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
	#'squeak_changestamp' : 'SLH 6/6/2026 00:54'
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
		populate.
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
	#'squeak_changestamp' : 'SLH 6/6/2026 01:10'
}
SKBlockSource >> populate [
	
	self addMorphBack: (SKActionBlock new
		addLabel: 'move';
		action: ['kara move'];
		category: #movement;
		updateLayout;
		yourself).
		
	self addMorphBack: (SKActionBlock new
		addLabel: 'move';
		addBlockRow: (SKBlockRow new);
		addLabel: 'move 2';
		action: ['kara move'];
		category: #movement;
		updateLayout;
		yourself).
		
	self addMorphBack: (SKActionBlock new
		addLabel: 'if';
		addBooleanPart;
		addLabel: 'then';
		addBlockGap;
		action: [:body :condition | condition,' ifTrue: [', body, '].'];
		updateLayout;
		yourself).
	
	self addMorphBack: (SKActionBlock new
		addLabel: 'if';
		addBooleanPart;
		addLabel: 'then';
		addBlockGap;
		addLabel: 'else';
		addBlockGap;
		action: [:body :condition | condition,' ifTrue: [', body, '].'];
		updateLayout;
		yourself).

	self addMorphBack: (SKActionBlock new
		addLabel: 'move';
		addIntegerPart;
		addLabel: 'steps';
		action: [:steps | steps,' timesRepeat: [kara move]']; 
		category: #movement;
		updateLayout;
		yourself).

	self addMorphBack: (SKActionBlock new
		addLabel: 'turn left';
		action: ['kara turn: left'];
		category: #movement;
		updateLayout;
		yourself).

	self addMorphBack: (SKActionBlock new
		addLabel: 'turn right';
		action: ['kara turn: right'];
		category: #movement;
		updateLayout;
		yourself).

	"self addMorphBack: (SKCompoundActionBlock new
		addLabel: 'if';
		addBooleanPart;
		addLabel: 'then';
		action: [:body :condition | condition,' ifTrue: [', body, '].'];
		yourself).

	self addMorphBack: (SKCompoundActionBlock new
		addLabel: 'repeat';
		addIntegerPart;
		addLabel: 'times';
		action: [:body :times | times,' timesRepeat: [', body, '].'];
		yourself)."

	self addMorphBack: (SKBooleanBlock new
		addLabel: 'trunk ahead';
		value: ['kara trunkAhead'];
		category: #sensing;
		updateLayout;
		yourself).

	self addMorphBack: (SKBooleanBlock new
		addLabel: 'on cloverleaf';
		value: ['kara onCloverleaf'];
		category: #sensing;
		updateLayout;
		yourself).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/6/2026 01:13'
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
