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
	#'squeak_changestamp' : 'FR 6/9/2026 00:07'
}
SKBlockRow >> addBlockPart: aBlockPart [

	self addMorphBack: aBlockPart
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:07'
}
SKBlockRow >> block [

	^ block
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:07'
}
SKBlockRow >> block: aBlock [

	block := aBlock
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:07'
}
SKBlockRow >> connectionPoint [

	^ self bottomLeft + ((self block tabOffsetOuter + self block slantWidth + (self block tabWidth / 2)) @ 0)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 00:07'
}
SKBlockRow >> initialize [
	
	super initialize.	
	
	self hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapCentering: #center;
    		cellPositioning: #center;
		cellGap: SKBlockStyle unit * 3;
		color: Color transparent;
		"borderWidth: 1;
		borderColor: Color black;"
		height: SKBlockStyle tabHeight * 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:07'
}
SKBlockRow >> isGap [

	^ isGap ifNil: [isGap := false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/9/2026 00:07'
}
SKBlockRow >> isGap: aBoolean [

	isGap := aBoolean
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/9/2026 01:48'
}
SKBlockRow >> layoutInset [

	| hInset vInset |
	
	hInset := SKBlockStyle unit * 4 + SKBlockStyle borderWidth.
	vInset := SKBlockStyle tabHeight + SKBlockStyle borderWidth.
	^ self isGap ifTrue: [0] ifFalse: [(Rectangle left: hInset right: hInset top: vInset bottom: vInset)]
]
