Class {
	#name : #SKBlockSource,
	#superclass : #Morph,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 03:45'
}
SKBlockSource >> handlesMouseDown: anEvent [
	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 04:19'
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
	#'squeak_changestamp' : 'FR 5/20/2026 03:44'
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
	#'squeak_changestamp' : 'FR 5/27/2026 04:16'
}
SKBlockSource >> populate [
	self addMorphBack: (SKActionBlock new label: 'move'; action: ['kara move']; category: #movement; yourself).
	self addMorphBack: (SKActionBlock new label: 'move';
		addIntegerPart: 'steps' withDefault: 3;
		action: [:steps | steps,' timesRepeat: [kara move]']; 
		category: #movement; yourself).
	"self addMorphBack: (SKActionBlock new label: 'if ';
		addBooleanPart: 'then:' withDefault: false;
		addActionPart: '' withDefault: '[]';
		action: [:condition :insert | condition, ' ifTrue: ', insert]; 
		category: #movement; yourself)."
	self addMorphBack: (SKActionBlock new label: 'turn left'; action: ['kara turn: left']; category: #movement; yourself).
	self addMorphBack: (SKActionBlock new label: 'turn right'; action: ['kara turn: right']; category: #movement; yourself).
	self addMorphBack: (SKCompoundActionBlock new label: 'if trunkAhead'; action: ['uh oh']; yourself).
	"self addMorphBack: (SKValueBlock new label: 'trunk ahead?'; ""type: #Boolean;"" value: ['kara trunkAhead']; category: #sensing; yourself).
	self addMorphBack: (SKValueBlock new label: 'on cloverleaf?'; ""type: #Boolean;"" value: ['kara onCloverleaf']; category: #sensing; yourself)."
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 03:47'
}
SKBlockSource >> startDrag: anEvent [
	| hit |
	(hit := self targetMorphAt: anEvent) ifNil:[^self].
	anEvent hand grabMorph: (hit duplicate leftSource: true)
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 03:46'
}
SKBlockSource >> targetMorphAt: anEvent [
	| hits |
	hits := self morphsAt: anEvent cursorPoint.
	hits := hits select:[:m| m owner == self].
	(hits isEmpty or:[hits size >1]) ifTrue:[^nil].
	^hits first

]
