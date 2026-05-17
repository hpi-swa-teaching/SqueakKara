Class {
	#name : #SKWindowManager,
	#superclass : #Morph,
	#instVars : [
		'openWindows'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 5/16/2026 12:21'
}
SKWindowManager >> actionCloseAllWindows [
	self openWindows do: [:a | a delete].
]

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 5/12/2026 18:54'
}
SKWindowManager >> addWindow: aWindow [
	self openWindows add: aWindow.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 5/16/2026 12:50'
}
SKWindowManager >> buildConfirmationWindow [
	
	self addWindow:
		(SKCloseConfirmationWindow new openInWorld; 
			windowManager: self; 
			buildWidgets).
]

{
	#category : #initialization,
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
