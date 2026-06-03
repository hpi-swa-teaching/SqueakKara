Class {
	#name : #SKCompoundActionBlock,
	#superclass : #SKActionBlock,
	#instVars : [
		'topBlock',
		'bottomBlock',
		'innerNextBlock'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 10:33'
}
SKCompoundActionBlock >> addBlockPart: aBlockPart [

	aBlockPart block: self.
	self blockParts add: aBlockPart.
	
	self topBlock addMorphBack: aBlockPart.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 11:18'
}
SKCompoundActionBlock >> availableSnapConnectionPoints [

	^ {#bottom -> self bottomConnectionPoint.
		#inner -> self innerConnectionPoint}.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 09:50'
}
SKCompoundActionBlock >> bottomBlock [

	^ bottomBlock ifNil: [bottomBlock := SKActionBlock new
		removeAllMorphs;
		hResizing: #spaceFill;
		tabOffsetTop: 26;
		yourself].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/2/2026 17:48'
}
SKCompoundActionBlock >> getCode [

	| args |
	
	args := self blockParts collect: [:each | each value contents asString].
	args addFirst: self actionGap getCode.
	
	^ self action valueWithArguments: args asArray.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 12:00'
}
SKCompoundActionBlock >> initialize [

	|insertWrapper sidebar|
	
	super initialize.
	self listDirection: #topToBottom;
    		cellPositioning: #topLeft;
		cellGap: -10;
		color: Color transparent;
		borderWidth: 0;
		removeAllMorphs.
	
	insertWrapper := (Morph new
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		cellPositioning: #topLeft;
		minWidth: 50;
		minHeight: 32;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap).
	sidebar := (Morph new
		vResizing: #spaceFill;
		width: 16;
		color: self colorFromCategory;
		borderColor: self borderColorFromCategory;
		borderWidth: 2).
	
	insertWrapper addMorphBack: sidebar.
	insertWrapper addMorphBack: self actionGap.
	
	self addMorphBack: self topBlock;
		addMorphBack: insertWrapper;
		addMorphBack: self bottomBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 10:46'
}
SKCompoundActionBlock >> innerConnectionPoint [

	^ self topLeft + ((self topBlock tabOffsetBottom + self slantWidth + (self tabWidth / 2)) @ (self topBlock height)).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/27/2026 11:05'
}
SKCompoundActionBlock >> layoutInset [
	
	^(Rectangle left: -2 right: -2 top: 0 bottom: 0).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 05:12'
}
SKCompoundActionBlock >> topBlock [

	^ topBlock ifNil: [topBlock := SKActionBlock new
		removeAllMorphs;
		hResizing: #spaceFill;
		tabOffsetBottom: 26;
		yourself].
]
