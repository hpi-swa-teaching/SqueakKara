"
A SKBlockCategory is the collapsable header of a group SKBlocks (usually) in the SKBlockSource.

Instance Variables
	content:		<Object>
	disclosure:		<Object>
	expanded:		<Object>
	header:		<Object>
	title:		<Object>
	titleLabel:		<Object>

content
	- the group of blocks assigned to this category

disclosure
	- the shown representation ('[+]') wether the category is currently expanded or collapsed

expanded
	- boolean describing wether the category is currently expanded

header
	- the Morph always displayed to represent this category

title
	- the Title of the category

titleLabel
	- the Morph used to display the title

"
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
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:19'
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
	#'squeak_changestamp' : 'FR 7/3/2026 03:07'
}
SKBlockCategory >> buildHeader [

	| row |

	self disclosure: (StringMorph new contents: self disclosureLabel).
	self titleLabel: (StringMorph new contents: self title; emphasis: 1).
	row := self buildRow.
	row addMorphBack: self disclosure;
		addMorphBack: self titleLabel.
	^ row
]

{
	#category : #building,
	#'squeak_changestamp' : 'FR 7/3/2026 02:27'
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
		yourself
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
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 03:05'
}
SKBlockCategory >> disclosure [
	^ disclosure
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 03:05'
}
SKBlockCategory >> disclosure: anObject [
	disclosure := anObject
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
	#'squeak_changestamp' : 'FR 7/3/2026 02:44'
}
SKBlockCategory >> minWidth [

	^ self content fullBounds width max: self header width
]

{
	#category : #building,
	#'squeak_changestamp' : 'FR 7/3/2026 03:07'
}
SKBlockCategory >> refreshDisclosure [

	self disclosure ifNotNil: [self disclosure contents: self disclosureLabel]
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
	#'squeak_changestamp' : 'FR 7/3/2026 03:08'
}
SKBlockCategory >> title: aString [

	title := aString.
	self titleLabel ifNotNil: [self titleLabel contents: aString]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 03:06'
}
SKBlockCategory >> titleLabel [

	^ titleLabel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 03:08'
}
SKBlockCategory >> titleLabel: aMorph [

	titleLabel := aMorph
]

{
	#category : #expansion,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockCategory >> toggle [

	self expanded ifTrue: [self collapse] ifFalse: [self expand]
]
