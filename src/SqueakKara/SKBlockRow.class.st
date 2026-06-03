Class {
	#name : #SKBlockRow,
	#superclass : #Morph,
	#instVars : [
		'block',
		'blockParts'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 11:57'
}
SKBlockRow >> addBlockPart: aBlockPart [

	aBlockPart block: self block.
	self blockParts add: aBlockPart.
	
	self addMorphBack: aBlockPart.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 11:57'
}
SKBlockRow >> block [

	^ block.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 11:57'
}
SKBlockRow >> block: aBlock [

	block := aBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 11:55'
}
SKBlockRow >> blockParts [

	^ blockParts ifNil: [blockParts := OrderedCollection new].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 12:25'
}
SKBlockRow >> connectionPoint [

	^ self bottomLeft + ((self block tabOffsetOuter + self block slantWidth + (self block tabWidth / 2)) @ 0).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 13:12'
}
SKBlockRow >> initialize [
	
	super initialize.	
	
	self hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapCentering: #center;
    		cellPositioning: #center;
		cellInset: 2@0;
		layoutInset: 5@ 0;
		color: Color transparent.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 13:13'
}
SKBlockRow >> layoutInset [
	
	^(Rectangle left: 8 right: 8 top: 8 bottom: 8).
]
