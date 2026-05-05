Class {
	#name : #SKBlockSource,
	#superclass : #Morph,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 22:56'
}
SKBlockSource >> handlesMouseDown: evt [
	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/6/2026 01:12'
}
SKBlockSource >> initialize [
	|m|
	super initialize.
	self color: Color transparent.
	self flag: #joinked. "have to change dis but not right now"
	m := RectangleMorph new extent: 100@300.
	m color: Color transparent.
	m layoutPolicy: TableLayout new.
	self layoutPolicy: TableLayout new.
	self listDirection: #topToBottom;
		wrapCentering: #center;
		hResizing: #spaceFill;
	 	vResizing: #spaceFill.
	self addMorph: (SKBlock new contents: 'end').
	self addMorph: (SKBlock new contents: 'turn: left').
	self addMorph: (SKBlock new contents: 'turn: right').
	self addMorph: (SKGapBlock new contents: 'move ').
	self addMorph: (SKBlock new contents: 'move').
	m addMorph: self.
	m openInWindowLabeled: 'SKBlockSource'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 22:57'
}
SKBlockSource >> mouseDown: evt [ 
	"Do nothing upon mouse-down except inform the hand to watch for a
	drag: message. Don't even do that if there are no submorphs"
	self flag: #joinked.
	(self targetMorphAt: evt)
		ifNotNil: [evt hand
				waitForClicksOrDrag: self
				event: evt
				selectors: {nil. nil. nil. #startDrag:}
				threshold: HandMorph dragThreshold]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 23:11'
}
SKBlockSource >> startDrag: evt [
"someone is trying to drag a submorph; find which one and attach it to the event's hand"
	| hit |
	self flag: #joinked.
	(hit := self targetMorphAt: evt) ifNil:[^self].

	evt hand grabMorph: (hit duplicate leftSource: true)
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/5/2026 22:57'
}
SKBlockSource >> targetMorphAt: evt [
"find the submorph clicked on, if any"
	| hits |
	self flag: #joinked.
	hits := self morphsAt: evt cursorPoint.

	"if there are no hits or more than one, fuggedaboudit. filter the list to only direct submorphs"
	hits := hits select:[:m| m owner == self].
	(hits isEmpty or:[hits size >1]) ifTrue:[^nil].
	^hits first

]
