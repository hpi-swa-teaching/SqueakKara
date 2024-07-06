"
SKExecuteControls creates a user interface to control the execution: a button to start and stop the execution of written code as well as a slider with which the user can control the execution speed.
"
Class {
	#name : #SKExecuteControls,
	#superclass : #Morph,
	#instVars : [
		'environment',
		'buttonRun',
		'sliderSpeed',
		'buttonStop'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:42'
}

{
	#category : #widgets,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:56'
}
SKExecuteControls >> actionRun [

	|dict texture|
	
	dict := Dictionary new.
	dict at: #terminated put: [self environment run. texture := self pauseTextureFilename].
	dict at: #suspended put: [self environment resume. texture := self pauseTextureFilename].
	dict at: #running put: [self environment pause. texture := self runTextureFilename].
	(dict at: self environment executerState) value.
	self buttonRunSetTexture: texture
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'EB 6/22/2024 15:06'
}
SKExecuteControls >> actionStop [

	self environment stop.
	self buttonRunSetTexture: self runTextureFilename
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JJG 7/6/2024 17:26'
}
SKExecuteControls >> addAllWidgets [

	self buttonRun: self buildButtonRun.
	self sliderSpeed: self buildSliderSpeed.
	self buttonStop: self buildButtonStop.
	self buttonRunSetTexture: self runTextureFilename.
	self buttonStopSetTexture.
	self positionWidgets
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JJG 7/6/2024 17:24'
}
SKExecuteControls >> addWidgetCentered: aWidget atXPosition: aXValue [ 

	|verticalCenter widgetCenter|

	self addMorph: aWidget.
	verticalCenter := (self extent y) / 2.
	widgetCenter := (aWidget extent y) / 2.
	aWidget position: (aXValue @ (verticalCenter - widgetCenter)).
	
	^ aXValue + aWidget extent x
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:58'
}
SKExecuteControls >> buildButtonRun [
	
	^ IconicButton new
		target: self;
		actionSelector: #actionRun;
		color: Color lightGray
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'EB 6/23/2024 19:42'
}
SKExecuteControls >> buildButtonStop [

	^ IconicButton new
		    target: self;
		    actionSelector: #actionStop;
		    color: Color lightGray
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JJG 7/6/2024 17:24'
}
SKExecuteControls >> buildSliderSpeed [

	^ SimpleSliderMorph new
		bounds: (0 @ 0 extent: 100 @ 20);
		minVal: 0;
		maxVal: 50;
		setNumericValue: 25;
		orientation: #horizontal;
		target: self;
		actionSelector: #sliderSpeedValueChanged:
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
	#'squeak_changestamp' : 'JJG 7/1/2024 14:58'
}
SKExecuteControls >> buttonRunSetTexture: aFilename [

	self buttonRun labelGraphic: (self getTexture: aFilename)	
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
	#'squeak_changestamp' : 'JJG 7/1/2024 14:58'
}
SKExecuteControls >> buttonStopSetTexture [

	self buttonStop labelGraphic: (self getTexture: self stopTextureFilename)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 14:59'
}
SKExecuteControls >> defaultBounds [

	^ 0 @ 0 extent: 250 @ 50
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
SKExecuteControls >> getTexture [

	^ SKTextureLoader new getTexture: self textureFilename
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
	#'squeak_changestamp' : 'JJG 7/6/2024 17:32'
}
SKExecuteControls >> initialize [

	super initialize.
	self bounds: self defaultBounds;
		color: SKStylesheet primaryColor;
		borderWidth: 1 px;
		borderColor: SKStylesheet secondaryColor;
		addAllWidgets;
		openInWorld
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
	#'squeak_changestamp' : 'JJG 7/6/2024 17:26'
}
SKExecuteControls >> positionWidgets [

	| verticalSpace|

	verticalSpace := self addWidgetCentered: self buttonRun atXPosition: self widgetMargin.
	verticalSpace := self addWidgetCentered: self sliderSpeed atXPosition: verticalSpace + self widgetMargin.
	verticalSpace := self addWidgetCentered: self buttonStop atXPosition: verticalSpace + self widgetMargin
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
	#'squeak_changestamp' : 'JJG 7/1/2024 15:00'
}
SKExecuteControls >> sliderSpeed: anObject [
	
	sliderSpeed := anObject
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:00'
}
SKExecuteControls >> sliderSpeedValueChanged: aValue [
	
	self environment executionSpeed: aValue.
	Transcript showln: aValue
]

{
	#category : #texture,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:00'
}
SKExecuteControls >> stopTextureFilename [

	^ 'stop.png'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:00'
}
SKExecuteControls >> textureFilename [

	^ 'Trunk.png'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:00'
}
SKExecuteControls >> widgetMargin [
	
	^ 20
]
