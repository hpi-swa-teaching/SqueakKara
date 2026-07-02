"
SKCloseConfirmationWindow provides a simple window asking for the users confirmation to allow the window manager to close all registered windows.
"
Class {
	#name : #SKCloseConfirmationWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'windowManager',
		'confirmationButton',
		'abortButton',
		'layout'
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
	#'squeak_changestamp' : 'JS 7/2/2026 03:04'
}
SKCloseConfirmationWindow >> addButtonsToLayout [

	| buttonRow |
	
	buttonRow := AlignmentMorph newRow. 
	buttonRow 
		hResizing: #spaceFill; 
		cellPositioning: #center; 
		cellInset: 20;
		color: Color transparent.
		
	buttonRow 
		addMorph: self buildAbortButton; 
		addMorph: self buildConfirmationButton.
		
	self layout addMorph: buttonRow
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 7/2/2026 03:11'
}
SKCloseConfirmationWindow >> addLayoutToWindow [

	| layoutMargin |
	
	layoutMargin := (40@60).
	self addMorph: self layout frame: (0@0  corner: 1@1).
	self extent: self layout fullBounds extent + layoutMargin
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 7/2/2026 03:02'
}
SKCloseConfirmationWindow >> addTextToLayout [

	| textWidth |
	
	textWidth := 320.
	
	self layout addMorph: (TextMorph new 
		contents: self messageSecondLine; 
		wrapFlag: true;
		width: textWidth;
		lock). 
	
	self layout addMorph: (TextMorph new 
		contents: self messageFirstLine; 
		wrapFlag: true;
		width: textWidth;
		lock)
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
	#'squeak_changestamp' : 'JS 7/2/2026 02:55'
}
SKCloseConfirmationWindow >> buildLayout [

	self layout: AlignmentMorph newColumn. 
	self layout 
		hResizing: #spaceFill;
		vResizing: #spaceFill; 
		cellPositioning: #center; 
		layoutInset: 20; 
		cellInset: 10;
		color: Color transparent
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 7/2/2026 03:05'
}
SKCloseConfirmationWindow >> buildWidgets [ 

	self 
		buildLayout;
		addButtonsToLayout;
		addTextToLayout;
		addLayoutToWindow;
		centerWindowInWorld
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
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/2/2026 02:47'
}
SKCloseConfirmationWindow >> layout [
	^ layout
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/2/2026 02:47'
}
SKCloseConfirmationWindow >> layout: anObject [
	layout := anObject
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
