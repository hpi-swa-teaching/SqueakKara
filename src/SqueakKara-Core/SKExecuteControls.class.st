"
SKExecuteControls creates a user interface to control the execution: a button to start and stop the execution of written code as well as a slider with which the user can control the execution speed.
"
Class {
	#name : #SKExecuteControls,
	#superclass : #Morph,
	#instVars : [
		'environment',
		'buttonRun',
		'buttonStop',
		'stopTexture',
		'runTexture',
		'pauseTexture',
		'sliderSpeed'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:42'
}

{
	#category : #widgets,
	#'squeak_changestamp' : 'LM 4/28/2026 22:22'
}
SKExecuteControls >> actionRun [

	self environment run.
	self buttonRunSetTexture: self currentRunButtonTexture
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'LM 4/28/2026 21:19'
}
SKExecuteControls >> actionStop [

	self environment stop.
	self buttonRunSetTexture: self runTexture
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'LM 4/28/2026 22:18'
}
SKExecuteControls >> addAllWidgets [

	self loadTextures.
	
	self buttonRun: self buildButtonRun.
	self sliderSpeed: self buildSliderSpeed.
	self buttonStop: self buildButtonStop.
	
	self buttonRunSetTexture: self runTexture.
	self buttonStopSetTexture.
	
	self addMorphBack: self buttonRun.
	self addMorphBack: self sliderSpeed.
	self addMorphBack: self buttonStop.
	
	self layoutChanged
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'LM 4/28/2026 22:26'
}
SKExecuteControls >> addWidgetCentered: aWidget atXPosition: aXValue [ 

	| verticalCenter widgetCenter |

	self addMorph: aWidget.
	verticalCenter := (self extent y) / 2.
	widgetCenter := (aWidget extent y) / 2.
	aWidget position: (aXValue @ (verticalCenter - widgetCenter)).
	
	^ aXValue + aWidget extent x
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'LM 4/28/2026 21:00'
}
SKExecuteControls >> buildButtonRun [
	
	^ IconicButton new
		target: self;
		actionSelector: #actionRun;
		color: SKStylesheet secondaryColor;
		yourself
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'LM 4/28/2026 20:07'
}
SKExecuteControls >> buildButtonStop [

	^ IconicButton new
		target: self;
		actionSelector: #actionStop;
		color: SKStylesheet secondaryColor;
		yourself
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'LM 4/28/2026 21:43'
}
SKExecuteControls >> buildSliderSpeed [

	^ SimpleSliderMorph new
		bounds: (0 @ 0 extent: self defaultSliderSize);
		minVal: 0;
		maxVal: 50;
		setNumericValue: 25;
		orientation: #horizontal;
		target: self;
		actionSelector: #sliderSpeedValueChanged:;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:58'
}
SKExecuteControls >> buttonRun [
	
	^ buttonRun
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:58'
}
SKExecuteControls >> buttonRun: anObject [
	
	buttonRun := anObject
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 4/28/2026 21:19'
}
SKExecuteControls >> buttonRunSetTexture: aForm [

	self buttonRun labelGraphic: aForm	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:58'
}
SKExecuteControls >> buttonStop [
	
	^ buttonStop
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:58'
}
SKExecuteControls >> buttonStop: anObject [
	
	buttonStop := anObject
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 4/28/2026 21:15'
}
SKExecuteControls >> buttonStopSetTexture [

	self buttonStop labelGraphic: self stopTexture
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 4/28/2026 22:23'
}
SKExecuteControls >> currentRunButtonTexture [

	self environment executerState = #running
		ifTrue: [ ^ self pauseTexture ].

	^ self runTexture
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 4/28/2026 22:28'
}
SKExecuteControls >> defaultBounds [

	^ 0 @ 0 extent: 250 @ 45
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 21:04'
}
SKExecuteControls >> defaultIconicButtonSize [

	^ 34 @ 34
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 21:43'
}
SKExecuteControls >> defaultSliderSize [
	^ 100 @ 20
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:59'
}
SKExecuteControls >> environment [
	
	^ environment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:59'
}
SKExecuteControls >> environment: anObject [
	
	environment := anObject
]

{
	#category : #texture,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:59'
}
SKExecuteControls >> getTexture: aFilename [

	^ SKTextureLoader new getTexture: aFilename
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 4/28/2026 22:27'
}
SKExecuteControls >> initialize [

	super initialize.
	self bounds: self defaultBounds;
		color: SKStylesheet primaryColor;
		borderWidth: 1 px;
		borderColor: SKStylesheet secondaryColor;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		cellPositioning: #center;
		cellInset: 5;
		hResizing: #rigid;
		vResizing: #rigid;
		addAllWidgets;
		openInWorld
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 4/28/2026 21:17'
}
SKExecuteControls >> loadTextures [
	self
		stopTexture: (self getTexture: self stopTextureFilename);
		runTexture: (self getTexture: self runTextureFilename);
		pauseTexture: (self getTexture: self pauseTextureFilename)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 21:14'
}
SKExecuteControls >> pauseTexture [

	^ pauseTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 21:14'
}
SKExecuteControls >> pauseTexture: aForm [

	^ pauseTexture := aForm
]

{
	#category : #texture,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:59'
}
SKExecuteControls >> pauseTextureFilename [

	^ 'pause.png'
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'LM 4/28/2026 22:14'
}
SKExecuteControls >> resizeWidgetByFactor: aNumber [
	
	| buttonSize iconSize controlSize sliderSize |
	controlSize := self defaultBounds extent * aNumber.
	buttonSize := self defaultIconicButtonSize * aNumber.
	iconSize := (self defaultIconicButtonSize - (10@10)) * aNumber.
	sliderSize := self defaultSliderSize * aNumber.
	
	self extent: controlSize.
	
	self buttonStop extent: buttonSize.
	self buttonStop labelGraphic: (self stopTexture scaledToSize: iconSize).
	
	self buttonRun extent: buttonSize.
	self buttonRun labelGraphic: (self currentRunButtonTexture scaledToSize: iconSize).
	
	self sliderSpeed extent: sliderSize.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 21:13'
}
SKExecuteControls >> runTexture [

	^ runTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 21:13'
}
SKExecuteControls >> runTexture: aForm [

	^ runTexture := aForm
]

{
	#category : #texture,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:59'
}
SKExecuteControls >> runTextureFilename [

	^ 'play.png'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:59'
}
SKExecuteControls >> sliderSpeed [
	
	^ sliderSpeed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 21:14'
}
SKExecuteControls >> sliderSpeed: aNumber [
	
	^ sliderSpeed := aNumber
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'EB 7/11/2024 14:40'
}
SKExecuteControls >> sliderSpeedValueChanged: aValue [
	
	self environment executionSpeed: aValue.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 21:13'
}
SKExecuteControls >> stopTexture [

	^ stopTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 21:13'
}
SKExecuteControls >> stopTexture: aForm [

	^ stopTexture := aForm
]

{
	#category : #texture,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:00'
}
SKExecuteControls >> stopTextureFilename [

	^ 'stop.png'
]
