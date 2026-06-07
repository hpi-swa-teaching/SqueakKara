"
SKButtonStack is a reusable, dynamically container of buttons
"
Class {
	#name : #SKButtonStack,
	#superclass : #AlignmentMorph,
	#instVars : [
		'buttons',
		'selectedButton',
		'selectedColor',
		'buttonColors',
		'buttonExtent'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'SS 6/7/2026 15:18'
}

{
	#category : #building,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> addButton: aButton [

	self buttons add: aButton.
	buttonColors at: aButton put: aButton color.
	self buttonExtent ifNotNil: [:e | aButton extent: e].
	self addMorphBack: aButton.
	^ aButton
]

{
	#category : #building,
	#'squeak_changestamp' : 'SSP 6/7/2026 13:50'
}
SKButtonStack >> addButtonWithLabel: aLabel target: aTarget selector: aSelector [
	^ self addButton: (SimpleButtonMorph new
		label: aLabel;
		target: aTarget;
		actionSelector: aSelector)
]

{
	#category : #building,
	#'squeak_changestamp' : 'SSP 6/7/2026 13:50'
}
SKButtonStack >> addButtonWithLabel: aLabel target: aTarget selector: aSelector arguments: anArray [
	^ self addButton: (SimpleButtonMorph new
		label: aLabel;
		target: aTarget;
		actionSelector: aSelector;
		arguments: anArray)
]

{
	#category : #building,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> addButtonWithLabel: aLabel target: aTarget selector: aSelector arguments: anArray color: aColor [

	^ self addButton: (SimpleButtonMorph new
		label: aLabel;
		target: aTarget;
		actionSelector: aSelector;
		arguments: anArray;
		color: aColor;
		yourself)
]

{
	#category : #building,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> addButtonWithLabel: aLabel target: aTarget selector: aSelector color: aColor [

	^ self addButtonWithLabel: aLabel target: aTarget selector: aSelector arguments: #() color: aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> buttonExtent [

	^ buttonExtent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> buttonExtent: aPoint [

	buttonExtent := aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> buttons [

	^ buttons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> defaultSpacing [

	^ 6
]

{
	#category : #orientation,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> horizontal [

	self listDirection: #leftToRight
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> initialize [

	super initialize.
	self listDirection: #topToBottom;
		wrapCentering: #center;
		cellPositioning: #center;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		color: Color transparent;
		borderWidth: 0;
		cellInset: self defaultSpacing;
		layoutInset: self defaultSpacing.
	buttons := OrderedCollection new.
	buttonColors := IdentityDictionary new.
	selectedColor := SKStylesheet primaryColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 13:50'
}
SKButtonStack >> normalColor [
	^ normalColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 13:50'
}
SKButtonStack >> normalColor: aColor [
	normalColor := aColor.
	self refreshColors.
	^ self
]

{
	#category : #selection,
	#'squeak_changestamp' : 'SSP 6/7/2026 13:50'
}
SKButtonStack >> refreshColors [
	buttons ifNil: [^ self].
	buttons do: [:b |
		b color: (b == selectedButton ifTrue: [selectedColor] ifFalse: [normalColor])]
]

{
	#category : #selection,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> select: aButton [

	selectedButton := aButton.
	self buttons do: [:b |
		b color: (b == aButton
			ifTrue: [self selectedColor]
			ifFalse: [buttonColors at: b ifAbsent: [b color]])]
]

{
	#category : #selection,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> selectButtonAt: anIndex [

	^ self select: (self buttons at: anIndex)
]

{
	#category : #selection,
	#'squeak_changestamp' : 'SSP 6/7/2026 13:50'
}
SKButtonStack >> selectIndex: anIndex [
	^ self select: (self buttons at: anIndex)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> selectedButton [

	^ selectedButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> selectedColor [

	^ selectedColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> selectedColor: aColor [

	selectedColor := aColor
]

{
	#category : #orientation,
	#'squeak_changestamp' : 'SSP 6/7/2026 15:00'
}
SKButtonStack >> vertical [

	self listDirection: #topToBottom
]
