Class {
	#name : #SKBlockCategory,
	#superclass : #Morph,
	#instVars : [
		'title',
		'header',
		'content',
		'disclosure',
		'titleLabel',
		'expanded'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/23/2026 23:02'
}
SKBlockCategory >> addBlock: aBlock [

	self content addMorphBack: aBlock.
	self layoutChanged.
	^ aBlock
]

{
	#category : #building,
	#'squeak_changestamp' : 'FR 6/23/2026 23:01'
}
SKBlockCategory >> buildContent [

	^ Morph new
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		cellPositioning: #topLeft;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		layoutInset: 0;
		cellGap: SKBlockStyle unit * 2;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'SLH 6/16/2026 20:40'
}
SKBlockCategory >> buildHeader [

	| row |

	disclosure := StringMorph new contents: self disclosureLabel.
	titleLabel := StringMorph new contents: self title; emphasis: 1.
	row := self buildRow.
	row addMorphBack: disclosure;
		addMorphBack: titleLabel.
	^ row
]

{
	#category : #building,
	#'squeak_changestamp' : 'FR 6/23/2026 19:28'
}
SKBlockCategory >> buildRow [

	^ Morph new
		color: SKStylesheet colorBeige;
		borderColor: SKStylesheet colorOrange;
		borderWidth: SKBlockStyle borderWidth;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapCentering: #center;
		cellPositioning: #leftCenter;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		layoutInset: SKBlockStyle unit * 2;
		cellGap: SKBlockStyle unit * 2;
		on: #mouseDown send: #toggle to: self;
		yourself.
]

{
	#category : #expansion,
	#'squeak_changestamp' : 'FR 6/24/2026 02:56'
}
SKBlockCategory >> collapse [

	self fullBounds.
	self expanded: false.
	self content owner == self ifTrue: [self content delete].
	self refreshDisclosure.
	self layoutChanged
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> content [

	^ content ifNil: [content := self buildContent]
]

{
	#category : #building,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> disclosureLabel [

	^ self expanded ifTrue: ['[-]'] ifFalse: ['[+]']
]

{
	#category : #expansion,
	#'squeak_changestamp' : 'SLH 6/16/2026 20:39'
}
SKBlockCategory >> expand [

	self expanded: true.
	self content owner == self ifFalse: [self addMorphBack: self content].
	self refreshDisclosure.
	self layoutChanged
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> expanded [

	^ expanded ifNil: [expanded := true]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/16/2026 20:38'
}
SKBlockCategory >> expanded: aBoolean [

	expanded := aBoolean
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> header [

	^ header ifNil: [header := self buildHeader]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/23/2026 22:56'
}
SKBlockCategory >> initialize [

	super initialize.
	
	self color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		cellPositioning: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		layoutInset: 0;
		cellGap: SKBlockStyle unit * 2.
	self addMorphBack: self header.
	self addMorphBack: self content.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/23/2026 23:00'
}
SKBlockCategory >> minWidth [

	Transcript show: self asString.
	^ self content fullBounds width max: self header width
]

{
	#category : #building,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> refreshDisclosure [

	disclosure ifNotNil: [disclosure contents: self disclosureLabel]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/23/2026 19:27'
}
SKBlockCategory >> setColorsToMatchCategory: aSymbol [

	self header color: (SKBlockStyle colorByCategory at: aSymbol);
		borderColor: (SKBlockStyle borderColorByCategory at: aSymbol).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> title [

	^ title ifNil: [title := '']
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> title: aString [

	title := aString.
	titleLabel ifNotNil: [titleLabel contents: aString]
]

{
	#category : #expansion,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> toggle [

	self expanded ifTrue: [self collapse] ifFalse: [self expand]
]
