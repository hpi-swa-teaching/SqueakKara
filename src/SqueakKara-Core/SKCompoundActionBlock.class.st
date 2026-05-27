Class {
	#name : #SKCompoundActionBlock,
	#superclass : #SKActionBlock,
	#instVars : [
		'actionGap'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/27/2026 03:55'
}
SKCompoundActionBlock >> actionGap [
	^ actionGap
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
	#'squeak_changestamp' : 'FR 5/27/2026 04:11'
}
SKCompoundActionBlock >> command [
	^'kara trunkAhead ifTrue: [',(self actionGap command),']'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 04:05'
}
SKCompoundActionBlock >> initialize [
	|insertWrapper sidebar|
	
	super initialize.
	self listDirection: #bottomToTop;
    		cellPositioning: #topLeft.
	
	insertWrapper := (Morph new color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #rightToLeft;
		cellPositioning: #topLeft;
		minWidth: 50;
		minHeight: 32;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap).
	sidebar := (Morph new color: Color orange;
		vResizing: #spaceFill;
		width: 8).
	self actionGap: SKActionGap new.
	insertWrapper addMorph: sidebar.
	insertWrapper addMorph: self actionGap.
	self "addMorph: SKCompoundActionBlockTop new;"
		addMorph: insertWrapper";"
		"addMorph: SKCompoundActionBlockBottom new".
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/27/2026 03:31'
}
SKCompoundActionBlock >> layoutInset [
	^0
]
