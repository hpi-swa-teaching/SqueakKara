Class {
	#name : #SKSelectionModel,
	#superclass : #Object,
	#instVars : [
		'wrapper',
		'items',
		'selectedIndex',
		'type',
		'popUp'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:11'
}
SKSelectionModel class >> newWithType: aType andItems: aItemCollection [

	^ (self new
		type: aType;
		items: aItemCollection;
		yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars 7/7/2026 10:46'
}
SKSelectionModel class >> newWithType: aType andItems: aItemCollection andPopUp: aPopUp [

	^ (self new
		type: aType;
		items: aItemCollection;
		popUp:  aPopUp;
		yourself)
]

{
	#category : #events,
	#'squeak_changestamp' : 'Lars 7/7/2026 10:50'
}
SKSelectionModel >> itemSelectedAtIndex: aNumber [

	self selectedIndex: aNumber;
		changed: #selectedIndex.
	self popUp itemClicked: (self items at: aNumber) byType: self type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:02'
}
SKSelectionModel >> items [
	
	^ items
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:02'
}
SKSelectionModel >> items: aItemCollection [

	items := aItemCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars 7/7/2026 10:45'
}
SKSelectionModel >> popUp [

	^ popUp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars 7/7/2026 10:45'
}
SKSelectionModel >> popUp: aPopUp [

	popUp := aPopUp 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/24/2026 11:40'
}
SKSelectionModel >> selectedIndex [

	^ selectedIndex ifNil: [selectedIndex := 0]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/24/2026 11:40'
}
SKSelectionModel >> selectedIndex: aNumber [

	selectedIndex := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/24/2026 11:40'
}
SKSelectionModel >> selectedValue [

	self selectedIndex = 0 ifTrue: [^''].
	^ self items at: self selectedIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:08'
}
SKSelectionModel >> type [

	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 16:08'
}
SKSelectionModel >> type: aType [

	type := aType
]
