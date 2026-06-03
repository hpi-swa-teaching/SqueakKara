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
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:13'
}
SKCloseConfirmationWindow >> buildAbortButton [

	self buildButtonWithLabel: 'NO' 
		selector: #closeOnlyConfirmationWindow 
		centerXOffset: self buttonXOffset
		centerYOffset: self buttonYOffset
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:13'
}
SKCloseConfirmationWindow >> buildButtonWithLabel: aLabel selector: aSelector centerXOffset: aXOffset centerYOffset: aYOffset [

	self confirmationButton: (SimpleButtonMorph new
		label: aLabel;
		target: self;
		actionSelector: aSelector;
		color: SKStylesheet secondaryColor;
		width: self buttonWidth;
		height: self buttonHeight).
	self addMorph: self confirmationButton.
	self confirmationButton center:  (self center x + aXOffset) @ (self center y + aYOffset)
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:13'
}
SKCloseConfirmationWindow >> buildConfirmationButton [

	self buildButtonWithLabel: 'YES' 
		selector: 'closeAllWindows' 
		centerXOffset: (self buttonXOffset * -1)
		centerYOffset: self buttonYOffset
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:12'
}
SKCloseConfirmationWindow >> buildMessage [

	self buildMessageWithText: self messageFirstLine 
		center:  self center x @ (self center y - self messageYOffset).
	self buildMessageWithText: self messageSecondLine 
		center:  self center x @ (self center y - (self messageYOffset - self messageTextSpacing))
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:11'
}
SKCloseConfirmationWindow >> buildMessageWithText: aText center: aCenter [

	self addMorph: (StringMorph new 
		contents: aText;
		color: self messageColor;
		emphasis: TextEmphasis bold emphasisCode;
		font: ((TextStyle named: #BitstreamVeraSans) addNewFontSize: self messageFontSize);
		center: aCenter)
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:14'
}
SKCloseConfirmationWindow >> buildWidgets [

	self scaleWindow; 
		centerWindowInWorld;
		buildMessage;
		buildConfirmationButton;
		buildAbortButton
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
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:09'
}
SKCloseConfirmationWindow >> buttonXOffset [

	^ 75
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:09'
}
SKCloseConfirmationWindow >> buttonYOffset [

	^ 30
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
