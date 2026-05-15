Class {
	#name : #SKWindowManager,
	#superclass : #Morph,
	#instVars : [
		'openWindows',
		'closeButton'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/12/2026 18:54'
}
SKWindowManager >> addWindow: aWindow [
	self openWindows add: aWindow.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/12/2026 19:40'
}
SKWindowManager >> buildCloseButton [
	self closeButton: (IconicButton new
		target: self;
		actionSelector: #closeAllWindows;
		color: SKStylesheet secondaryColor).
	self addMorph: self closeButton.
	self closeButton center: self center
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/12/2026 19:00'
}
SKWindowManager >> closeAllWindows [
	self openWindows do: [:a | a delete].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/12/2026 19:21'
}
SKWindowManager >> closeButton [
	^ closeButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/12/2026 19:21'
}
SKWindowManager >> closeButton: anObject [
	closeButton := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/12/2026 19:26'
}
SKWindowManager >> initialize [
	super initialize.
	self
		color: Color transparent;
		openWindows: OrderedCollection new.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/12/2026 14:43'
}
SKWindowManager >> openWindows [
	^ openWindows
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/12/2026 14:43'
}
SKWindowManager >> openWindows: anObject [
	openWindows := anObject
]
