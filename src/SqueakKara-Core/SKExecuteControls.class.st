Class {
	#name : #SKExecuteControls,
	#superclass : #Morph,
	#instVars : [
		'environment',
		'buttonRun',
		'sliderSpeed',
		'buttonStop'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #widgets,
	#'squeak_changestamp' : 'EB 6/22/2024 15:05'
}
SKExecuteControls >> actionRun [
	|dict label texture|
	dict := Dictionary new.
	dict at: #terminated put:[self environment run. label := 'pause'. texture := self pauseTextureFilename].
	dict at: #suspended put:[self environment resume. label := 'pause'. texture := self pauseTextureFilename].
	dict at: #running put:[self environment pause. label := 'resume'. texture := self runTextureFilename].
	(dict at: self environment executerState) value.
	self buttonRun label: label.
	self buttonRunSetTexture: texture.
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
	#'squeak_changestamp' : 'EB 6/22/2024 15:00'
}
SKExecuteControls >> addAllWidgets [

	| verticalSpace|

	self buttonRun: self buildButtonRun.
	self sliderSpeed: self buildSliderSpeed.
	self buttonStop: self buildButtonStop.
	self buttonRunSetTexture: self runTextureFilename.
	self buttonStopSetTexture.
	verticalSpace := self addWidgetCentered: self buttonRun atXPosition: self widgetMargin.
	verticalSpace := self addWidgetCentered: self sliderSpeed atXPosition: verticalSpace + self widgetMargin.
	verticalSpace := self addWidgetCentered: self buttonStop atXPosition: verticalSpace + self widgetMargin.
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'EB 6/22/2024 13:59'
}
SKExecuteControls >> addWidgetCentered: aWidget atXPosition: aXValue [ 

	|verticalCenter widgetCenter|

	self addMorph: aWidget.
	verticalCenter := (self extent y)/2.
	widgetCenter := (aWidget extent y)/2.
	aWidget position: (aXValue @ (verticalCenter-widgetCenter)).
	^ aXValue + aWidget extent x.
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'EB 6/22/2024 15:00'
}
SKExecuteControls >> buildButtonRun [
	
	^IconicButton new
		label: 'run';
		target: self;
		actionSelector: #actionRun;
		color: Color lightGray.
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'EB 6/22/2024 15:00'
}
SKExecuteControls >> buildButtonStop [

	^ IconicButton new
		    label: 'stop';
		    target: self;
		    actionSelector: #actionStop;
		    color: Color lightGray
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'EB 6/22/2024 14:41'
}
SKExecuteControls >> buildSliderSpeed [

	^ SimpleSliderMorph new
		bounds: (0@0 extent: 100@20);
		minVal: 0;
		maxVal: 50;
		setNumericValue: 25;
		orientation: #horizontal;
		target: self;
		actionSelector: #sliderSpeedValueChanged:.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 13:53'
}
SKExecuteControls >> buttonRun [
	^ buttonRun
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 13:53'
}
SKExecuteControls >> buttonRun: anObject [
	buttonRun := anObject
]

{
	#category : #texture,
	#'squeak_changestamp' : 'EB 6/22/2024 14:58'
}
SKExecuteControls >> buttonRunSetTexture: aFilename [

	self buttonRun labelGraphic: (self getTexture: aFilename).	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 13:53'
}
SKExecuteControls >> buttonStop [
	^ buttonStop
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 13:53'
}
SKExecuteControls >> buttonStop: anObject [
	buttonStop := anObject
]

{
	#category : #texture,
	#'squeak_changestamp' : 'EB 6/22/2024 15:04'
}
SKExecuteControls >> buttonStopSetTexture [

	self buttonStop labelGraphic: (self getTexture: self stopTextureFilename).	
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'EB 6/22/2024 14:06'
}
SKExecuteControls >> defaultBounds [

	^0@0 extent: 250@50
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 13:53'
}
SKExecuteControls >> environment [
	^ environment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 13:53'
}
SKExecuteControls >> environment: anObject [
	environment := anObject
]

{
	#category : #texture,
	#'squeak_changestamp' : 'EB 6/22/2024 14:50'
}
SKExecuteControls >> getTexture [

	^ SKTextureLoader new getTexture: self textureFilename.
]

{
	#category : #texture,
	#'squeak_changestamp' : 'EB 6/22/2024 14:57'
}
SKExecuteControls >> getTexture: aFilename [

	^ SKTextureLoader new getTexture: aFilename.
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'EB 6/22/2024 14:03'
}
SKExecuteControls >> initialize [

	super initialize.
	self bounds: self defaultBounds.
	self color: Color white.
	self addAllWidgets.
	self openInWorld.
]

{
	#category : #texture,
	#'squeak_changestamp' : 'KD 6/23/2024 19:51'
}
SKExecuteControls >> pauseTextureFilename [

	^'Kara-FacingUp.png'
]

{
	#category : #texture,
	#'squeak_changestamp' : 'KD 6/23/2024 19:51'
}
SKExecuteControls >> runTextureFilename [

	^'Cloverleaf.png'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 13:53'
}
SKExecuteControls >> sliderSpeed [
	^ sliderSpeed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 13:53'
}
SKExecuteControls >> sliderSpeed: anObject [
	sliderSpeed := anObject
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'EB 6/22/2024 14:41'
}
SKExecuteControls >> sliderSpeedValueChanged: aValue [
	
	self environment executionSpeed: aValue.
	Transcript showln: aValue.
]

{
	#category : #texture,
	#'squeak_changestamp' : 'EB 6/22/2024 15:02'
}
SKExecuteControls >> stopTextureFilename [

	^'Trunk.png'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 14:47'
}
SKExecuteControls >> textureFilename [

	^'Trunk.png'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 14:06'
}
SKExecuteControls >> widgetMargin [
	^20
]
