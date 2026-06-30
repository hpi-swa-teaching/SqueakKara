"
SKCloseConfirmationWindow provides a simple window asking for the users confirmation to allow the window manager to close all registered windows.
"
Class {
	#name : #SKCloseConfirmationWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'windowManager',
		'confirmationButton',
		'abortButton'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JS 5/26/2026 14:51'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:09'
}
SKCloseConfirmationWindow >> abortButton [

	^ abortButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:09'
}
SKCloseConfirmationWindow >> abortButton: anObject [

	abortButton := anObject
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 6/30/2026 12:49'
}
SKCloseConfirmationWindow >> buildAbortButton [

	^ self buildButtonWithLabel: 'NO' 
		selector: #closeOnlyConfirmationWindow
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 6/30/2026 12:48'
}
SKCloseConfirmationWindow >> buildButtonWithLabel: aLabel selector: aSelector [

	|button|
	
	button := (SimpleButtonMorph new
		label: aLabel;
		target: self;
		actionSelector: aSelector;
		color: SKStylesheet secondaryColor;
		width: self buttonWidth;
		height: self buttonHeight).
	^ button
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 6/30/2026 12:49'
}
SKCloseConfirmationWindow >> buildConfirmationButton [

	^ self buildButtonWithLabel: 'YES' 
		selector: #closeAllWindows
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 6/30/2026 13:49'
}
SKCloseConfirmationWindow >> buildWidgets [ 

	| layout buttonRow textWidth layoutMargin | 
		
	layout := AlignmentMorph newColumn. 
	layout 
		hResizing: #spaceFill;
		vResizing: #spaceFill; 
		cellPositioning: #center; 
		layoutInset: 20; 
		cellInset: 10;
		color: Color transparent.
	
	buttonRow := AlignmentMorph newRow. 
	buttonRow 
		hResizing: #shrinkWrap; 
		cellPositioning: #center; 
		cellInset: 20;
		color: Color transparent.
		
	buttonRow 
		addMorph: self buildAbortButton; 
		addMorph: self buildConfirmationButton. 
	
	textWidth := 320.
	
	layout addMorph: buttonRow. 
	layout addMorph: (TextMorph new 
		contents: self messageSecondLine; 
		wrapFlag: true;
		width: textWidth;
		lock). 
	
	layout addMorph: (TextMorph new 
		contents: self messageFirstLine; 
		wrapFlag: true;
		width: textWidth;
		lock).
	
	layoutMargin := (40@60).
	
	self addMorph: layout frame: (0 @ 0 corner: 1 @ 1).
	self extent: layout fullBounds extent + layoutMargin.

	self centerWindowInWorld
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:09'
}
SKCloseConfirmationWindow >> buttonHeight [

	^ 30
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:09'
}
SKCloseConfirmationWindow >> buttonWidth [

	^ 100
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:14'
}
SKCloseConfirmationWindow >> centerWindowInWorld [

	self center: self owner center
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:14'
}
SKCloseConfirmationWindow >> closeAllWindows [

	self windowManager actionCloseAllWindows
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:14'
}
SKCloseConfirmationWindow >> closeOnlyConfirmationWindow [

	self delete
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:09'
}
SKCloseConfirmationWindow >> confirmationButton [

	^ confirmationButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:09'
}
SKCloseConfirmationWindow >> confirmationButton: anObject [

	confirmationButton := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:09'
}
SKCloseConfirmationWindow >> initialize [

	super initialize.
	self 
		setLabel: self windowLabel;
		setWindowColor: SKStylesheet primaryColor


]

{
	#category : #messages,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:12'
}
SKCloseConfirmationWindow >> messageColor [

	^ Color black
]

{
	#category : #messages,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:10'
}
SKCloseConfirmationWindow >> messageFirstLine [

	^ 'All your progress will be lost.'
]

{
	#category : #messages,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:10'
}
SKCloseConfirmationWindow >> messageFontSize [

	^ 12
]

{
	#category : #messages,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:10'
}
SKCloseConfirmationWindow >> messageSecondLine [

	^ 'Are you sure you want to close all windows?'
]

{
	#category : #messages,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:10'
}
SKCloseConfirmationWindow >> messageTextSpacing [

	^ self messageFontSize + 6
]

{
	#category : #messages,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:10'
}
SKCloseConfirmationWindow >> messageYOffset [

	^ 30
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:14'
}
SKCloseConfirmationWindow >> scaleWindow [

	self extent: self windowWidth @ self windowHeight
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:10'
}
SKCloseConfirmationWindow >> windowHeight [

	^ 180
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:10'
}
SKCloseConfirmationWindow >> windowLabel [

	^ 'Confirmation'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:09'
}
SKCloseConfirmationWindow >> windowManager [

	^ windowManager
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:09'
}
SKCloseConfirmationWindow >> windowManager: anObject [

	windowManager := anObject
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:10'
}
SKCloseConfirmationWindow >> windowWidth [

	^ 360
]
