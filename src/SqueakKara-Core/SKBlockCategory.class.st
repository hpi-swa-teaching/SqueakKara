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
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> addBlock: aBlock [

	self content addMorphBack: aBlock.
	^ aBlock
]

{
	#category : #building,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> buildContent [

	^ Morph new
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		cellPositioning: #topLeft;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		layoutInset: 0;
		cellGap: 10;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> buildHeader [

	| row |
	disclosure := StringMorph new contents: self disclosureLabel.
	titleLabel := StringMorph new contents: self title; emphasis: 1.
	row := Morph new
		color: SKStylesheet colorBeige;
		borderColor: SKStylesheet colorOrange;
		borderWidth: 1;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapCentering: #center;
		cellPositioning: #leftCenter;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		layoutInset: 4;
		cellGap: 6;
		on: #mouseDown send: #toggle to: self;
		yourself.
	row addMorphBack: disclosure;
		addMorphBack: titleLabel.
	^ row
]

{
	#category : #expansion,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> collapse [

	expanded := false.
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
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> expand [

	expanded := true.
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
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> header [

	^ header ifNil: [header := self buildHeader]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> initialize [

	super initialize.
	
	self color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		cellPositioning: #topLeft;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		layoutInset: 0;
		cellGap: 4.
	self addMorphBack: self header.
	self addMorphBack: self content
]

{
	#category : #building,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> refreshDisclosure [

	disclosure ifNotNil: [disclosure contents: self disclosureLabel]
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
