Class {
	#name : #SKBlockRow,
	#superclass : #Morph,
	#instVars : [
		'block',
		'isGap'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 09:15'
}
SKBlockRow >> addBlockPart: aBlockPart [

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
	#'squeak_changestamp' : 'SLH 6/3/2026 12:25'
}
SKBlockRow >> connectionPoint [

	^ self bottomLeft + ((self block tabOffsetOuter + self block slantWidth + (self block tabWidth / 2)) @ 0).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 17:06'
}
SKBlockRow >> initialize [
	
	super initialize.	
	
	self hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapCentering: #center;
    		cellPositioning: #center;
		color: Color transparent;
		height: 30.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 11:36'
}
SKBlockRow >> isGap [

	^ isGap ifNil: [isGap := false].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 11:36'
}
SKBlockRow >> isGap: aBoolean [

	isGap := aBoolean.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 13:13'
}
SKBlockRow >> layoutInset [
	
	^(Rectangle left: 8 right: 8 top: 8 bottom: 8).
]
