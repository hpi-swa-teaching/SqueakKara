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
	#'squeak_changestamp' : 'SLH 5/28/2026 09:43'
}
SKCompoundActionBlock >> command [

	| args |
	
	args := self blockParts collect: [:each | each value contents asString].
	args addFirst: self actionGap command.
	
	^ self action valueWithArguments: args asArray.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 5/27/2026 11:11'
}
SKCompoundActionBlock >> initialize [

	|insertWrapper sidebar|
	
	super initialize.
	self listDirection: #topToBottom;
    		cellPositioning: #topLeft;
		cellGap: -10;
		color: Color transparent;
		borderWidth: 0;
		blockParts: OrderedCollection new;
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
	#'squeak_changestamp' : 'SLH 5/27/2026 10:22'
}
SKCompoundActionBlock >> label: aString [
	
	self label contents: aString.
	
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
	#'squeak_changestamp' : 'SLH 5/28/2026 09:50'
}
SKCompoundActionBlock >> topBlock [

	^ topBlock ifNil: [topBlock := SKActionBlock new
		removeAllMorphs;
		addMorph: self label;
		hResizing: #spaceFill;
		tabOffsetBottom: 26;
		yourself].
]
