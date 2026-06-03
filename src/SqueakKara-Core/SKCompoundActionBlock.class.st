Class {
	#name : #SKCompoundActionBlock,
	#superclass : #SKActionBlock,
	#instVars : [
		'actionGap',
		'topBlock',
		'bottomBlock'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 5/27/2026 14:42'
}
SKCompoundActionBlock >> actionGap [
	^ actionGap ifNil: [actionGap := SKActionGap new].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/27/2026 03:55'
}
SKCompoundActionBlock >> actionGap: anObject [
	actionGap := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/28/2026 09:49'
}
SKCompoundActionBlock >> addBlockPart: aBlockPart [

	self blockParts add: aBlockPart.
	
	self topBlock
		addMorph: aBlockPart;
		addMorph: aBlockPart label.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/3/2026 05:22'
}
SKCompoundActionBlock >> bottomBlock [

	^ bottomBlock ifNil: [bottomBlock := SKActionBlock new
		removeAllMorphs;
		tabOffsetTop: SKBlockStyle tabOffset + self sidebarWidth;
		width: SKBlockStyle tabOffset + self sidebarWidth + (2*self tabWidth);
		height: self minHeight;
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
	#'squeak_changestamp' : 'FR 6/3/2026 05:27'
}
SKCompoundActionBlock >> initialize [

	|insertWrapper sidebar|
	
	super initialize.
	self listDirection: #topToBottom;
    		cellPositioning: #topLeft;
		cellInset: 0;		
		color: Color transparent;
		borderWidth: 0;
		blockParts: OrderedCollection new;
		removeAllMorphs;
		cellGap: -1*SKBlockStyle tabHeight "border should have no effect".
	
	insertWrapper := (Morph new
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		cellPositioning: #topLeft;
		cellGap: 0;
		cellInset: 0;
		borderWidth: 0;
		height: self minHeight;
		minWidth: 50;
		minHeight: self minHeight;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap).
	sidebar := (Morph new
		width: self sidebarWidth;
		height: self minHeight;
		vResizing: #spaceFill;
		color: self colorFromCategory;
		borderColor: self borderColorFromCategory;
		borderWidth: SKBlockStyle borderWidth).
	
	insertWrapper addMorphBack: sidebar.
	insertWrapper addMorphBack: (self actionGap height: self minHeight).
	
	self addMorphBack: self topBlock;
		addMorphBack: insertWrapper;
		addMorphBack: self bottomBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/2/2026 23:28'
}
SKCompoundActionBlock >> label: aString [
	
	self label contents: aString
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/3/2026 03:39'
}
SKCompoundActionBlock >> layoutInset [
	
	^0
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/3/2026 05:08'
}
SKCompoundActionBlock >> sidebarWidth [

	^SKBlockStyle tabOffset + (SKBlockStyle tabHeight)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/3/2026 05:22'
}
SKCompoundActionBlock >> topBlock [

	^ topBlock ifNil: [topBlock := SKActionBlock new
		removeAllMorphs;
		addSpacing;
		addMorph: self label;
		hResizing: #shrinkWrap;
		tabOffsetBottom: SKBlockStyle tabOffset + self sidebarWidth;
		yourself].
]
