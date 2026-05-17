Class {
	#name : #SKCloseConfirmationWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'windowManager',
		'confirmationButton',
		'abortButton'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 12:17'
}
SKCloseConfirmationWindow >> abortButton [
	^ abortButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 12:17'
}
SKCloseConfirmationWindow >> abortButton: anObject [
	abortButton := anObject
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 5/16/2026 12:54'
}
SKCloseConfirmationWindow >> buildAbortButton [
	self buildButtonWithLabel: 'NO' 
		andWidth: self buttonWidth 
		andHeight: self buttonHeight 
		andSelector: 'closeOnlyConfirmationWindow' 
		andCenterXOffset: self buttonXOffset
		andCenterYOffset: self buttonYOffset
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 5/16/2026 12:53'
}
SKCloseConfirmationWindow >> buildButtonWithLabel: aLabel andWidth: aWidth andHeight: aHeight andSelector: aSelector andCenterXOffset: aXOffset andCenterYOffset: aYOffset [
	self confirmationButton: (SimpleButtonMorph new
		label: aLabel;
		target: self;
		actionSelector: aSelector;
		color: SKStylesheet secondaryColor;
		width: aWidth;
		height: aHeight).
	self addMorph: self confirmationButton.
	self confirmationButton center:  (self center x + aXOffset) @ (self center y + aYOffset).
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 5/16/2026 12:55'
}
SKCloseConfirmationWindow >> buildConfirmationButton [
	self buildButtonWithLabel: 'YES' 
		andWidth: self buttonWidth 
		andHeight: self buttonHeight 
		andSelector: 'closeAllWindows' 
		andCenterXOffset: (self buttonXOffset * -1)
		andCenterYOffset: self buttonYOffset
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 5/17/2026 12:13'
}
SKCloseConfirmationWindow >> buildMessage [
	self buildMessageWithText: self messageFirstLine 
		andColour: Color black 
		andFontSize:  self messageFontSize 
		andCenter:  self center x @ (self center y - self messageYOffset).
	self buildMessageWithText: self messageSecondLine 
		andColour: Color black 
		andFontSize:  self messageFontSize 
		andCenter:  self center x @ (self center y - (self messageYOffset - self messageTextSpacing)).
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 5/17/2026 12:11'
}
SKCloseConfirmationWindow >> buildMessageWithText: aText andColour: aColor andFontSize: aSize andCenter: aCenter [
	self addMorph: (StringMorph new 
		contents: aText;
		color: aColor;
		emphasis: TextEmphasis bold emphasisCode;
		font: ((TextStyle named: #BitstreamVeraSans) addNewFontSize: aSize);
		center: aCenter)
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 5/17/2026 11:55'
}
SKCloseConfirmationWindow >> buildWidgets [
	self scaleWindow; 
		centerWindowInWorld;
		buildMessage;
		buildConfirmationButton;
		buildAbortButton.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 12:46'
}
SKCloseConfirmationWindow >> buttonHeight [
	^ 30
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 12:46'
}
SKCloseConfirmationWindow >> buttonWidth [
	^ 100
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 12:54'
}
SKCloseConfirmationWindow >> buttonXOffset [
	^ 75
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 12:54'
}
SKCloseConfirmationWindow >> buttonYOffset [
	^ 30
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 5/16/2026 12:08'
}
SKCloseConfirmationWindow >> centerWindowInWorld [
	self center: self owner center.
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 5/16/2026 12:30'
}
SKCloseConfirmationWindow >> closeAllWindows [
	self windowManager actionCloseAllWindows
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 5/16/2026 12:30'
}
SKCloseConfirmationWindow >> closeOnlyConfirmationWindow [
	self delete
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 12:17'
}
SKCloseConfirmationWindow >> confirmationButton [
	^ confirmationButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 12:17'
}
SKCloseConfirmationWindow >> confirmationButton: anObject [
	confirmationButton := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 5/16/2026 12:26'
}
SKCloseConfirmationWindow >> initialize [
	super initialize.
	self 
		setLabel: self windowLabel;
		setWindowColor: SKStylesheet primaryColor.


]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/17/2026 12:06'
}
SKCloseConfirmationWindow >> messageFirstLine [
	^ 'All you progress will be lost.'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/17/2026 12:00'
}
SKCloseConfirmationWindow >> messageFontSize [
	^ 12
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/17/2026 12:06'
}
SKCloseConfirmationWindow >> messageSecondLine [
	^ 'Are you sure you want to close all windows?'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/17/2026 12:04'
}
SKCloseConfirmationWindow >> messageTextSpacing [
	^ self messageFontSize + 6
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/17/2026 12:01'
}
SKCloseConfirmationWindow >> messageYOffset [
	^ 30
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JS 5/16/2026 12:31'
}
SKCloseConfirmationWindow >> scaleWindow [
	self extent: self windowWidth @ self windowHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 12:26'
}
SKCloseConfirmationWindow >> windowHeight [
	^ 180
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 11:55'
}
SKCloseConfirmationWindow >> windowLabel [
	^ 'Confirmation'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 11:46'
}
SKCloseConfirmationWindow >> windowManager [
	^ windowManager
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 11:46'
}
SKCloseConfirmationWindow >> windowManager: anObject [
	windowManager := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/16/2026 12:26'
}
SKCloseConfirmationWindow >> windowWidth [
	^ 360
]
