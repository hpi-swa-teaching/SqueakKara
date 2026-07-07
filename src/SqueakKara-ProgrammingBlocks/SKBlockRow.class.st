"
A SKBlockRow is a Container for a Row of (usually) Block Parts inside a SKBlock as an SKBlock can visually represent a stack of multiple rows.

Instance Variables
	block:		<Object>
	isGap:		<Object>

block
	- the block this row is part of

isGap
	- wether this row should leave space to attach (usually) SKAction Blocks

"
Class {
	#name : #SKBlockRow,
	#superclass : #Morph,
	#instVars : [
		'block',
		'isGap'
	],
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:39'
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
	#'squeak_changestamp' : 'FR 7/3/2026 02:57'
}
SKBlockRow >> connectionPoint [

	^ self bottomLeft + ((self block tabOffsetOuter + self block slantWidth + (self block tabWidth // 2)) @ 0)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars 7/7/2026 10:16'
}
SKBlockRow >> initialize [
	
	super initialize.	
	
	self hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapCentering: #center;
    		cellPositioning: #center;
		cellGap:  SKStylesheet blockUnit * 3;
		color: Color transparent;
		height: SKStylesheet blockTabHeight * 3
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
	#'squeak_changestamp' : 'Lars 7/7/2026 10:16'
}
SKBlockRow >> layoutInset [

	| hInset vInset |
	
	hInset :=  SKStylesheet blockUnit * 4 +SKStylesheet blockBorderWidth.
	vInset := SKStylesheet blockTabHeight + SKStylesheet blockBorderWidth.
	^ self isGap ifTrue: [0] ifFalse: [(Rectangle left: hInset right: hInset top: vInset bottom: vInset)]
]
