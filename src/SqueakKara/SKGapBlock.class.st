Class {
	#name : #SKGapBlock,
	#superclass : #SKBlock,
	#instVars : [
		'gap'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/6/2026 00:43'
}
SKGapBlock >> command [
	^'1 to: ', self gap contents, ' do: [:i | kara move]'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/6/2026 00:29'
}
SKGapBlock >> gap [
	^ gap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/6/2026 00:29'
}
SKGapBlock >> gap: anObject [
	gap := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/6/2026 01:11'
}
SKGapBlock >> initialize [
	super initialize.
	self layoutPolicy: TableLayout new;
		listDirection: #rightToLeft;
		gap: (TextMorph new contents: '3');
		addMorph: self gap;
		addMorph: (StringMorph new contents: ' steps');
		hResizing: #shrinkWrap.
	
]
