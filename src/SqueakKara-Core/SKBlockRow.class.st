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
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:15'
}
SKBlockRow >> addBlockPart: aBlockPart [

	self addMorphBack: aBlockPart.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 11:57'
}
SKBlockRow >> block [

	^ block.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 11:57'
}
SKBlockRow >> block: aBlock [

	block := aBlock.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/3/2026 12:25'
}
SKBlockRow >> connectionPoint [

	^ self bottomLeft + ((self block tabOffsetOuter + self block slantWidth + (self block tabWidth / 2)) @ 0).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'SLH 6/6/2026 15:13'
}
SKBlockRow >> initialize [
	
	super initialize.	
	
	self hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapCentering: #center;
    		cellPositioning: #center;
		cellGap: 8;
		color: Color transparent;
		"borderWidth: 1;
		borderColor: Color black;"
		height: 20.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 11:36'
}
SKBlockRow >> isGap [

	^ isGap ifNil: [isGap := false].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 11:36'
}
SKBlockRow >> isGap: aBoolean [

	isGap := aBoolean.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'SLH 6/5/2026 21:54'
}
SKBlockRow >> layoutInset [
	
	^self isGap ifTrue: [0] ifFalse: [(Rectangle left: 8 right: 8 top: 8 bottom: 8)].
]
