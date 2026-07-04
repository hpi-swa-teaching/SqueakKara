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
		'buttonSpawnKara',
		'buttonNextChallenge',
		'sliderSpeed',
		'scaleFactor',
		'buttonReset'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:42'
}

{
	#category : #widgets,
	#'squeak_changestamp' : 'ND 6/18/2026 21:53'
}
SKExecuteControls >> addAllWidgets [
	
	self addButtonRun.
	self addButtonStop.
	self addSliderSpeed.
	self createButtonNextChallenge.
	self addButtonSpawnKara.
	self addButtonReset.
	
	self layoutChanged
]

{
	#category : #texture,
	#'squeak_changestamp' : 'ND 6/17/2026 00:10'
}
SKExecuteControls >> addButtonNextChallenge [

	self addMorphBack: self buttonNextChallenge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:16'
}
SKExecuteControls >> addButtonReset [

	self buttonReset: SKButtonReset new.
    	self buttonReset executeControls: self.
    	self addMorphBack: self buttonReset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:16'
}
SKExecuteControls >> addButtonRun [

	self buttonRun: SKButtonRun new.
	self buttonRun executeControls: self.
	self addMorphBack: self buttonRun
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 22:22'
}
SKExecuteControls >> addButtonSpawnKara [

	self buttonSpawnKara: SKButtonSpawnKara new.
	self buttonSpawnKara executeControls: self.
	self addMorphBack: self buttonSpawnKara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:20'
}
SKExecuteControls >> addButtonStop [

	self buttonStop: SKButtonStop new.
	self buttonStop executeControls: self.
	self addMorphBack: self buttonStop
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:54'
}
SKExecuteControls >> addSliderSpeed [

	self sliderSpeed: SKSlider new.
	self sliderSpeed executeControls: self.
	self addMorphBack: self sliderSpeed
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
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 6/3/2026 18:52'
}
SKExecuteControls >> buttonNextChallenge [
	
	^ buttonNextChallenge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 6/3/2026 18:52'
}
SKExecuteControls >> buttonNextChallenge: aMorph [
	
	buttonNextChallenge := aMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 6/29/2026 16:46'
}
SKExecuteControls >> buttonReset [

	^ buttonReset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:20'
}
SKExecuteControls >> buttonReset: aButton [

	buttonReset := aButton
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
	#'squeak_changestamp' : 'ND 6/25/2026 21:21'
}
SKExecuteControls >> buttonRun: aButton [
	
	buttonRun := aButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 5/14/2026 12:07'
}
SKExecuteControls >> buttonSpawnKara [
	
	^ buttonSpawnKara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:21'
}
SKExecuteControls >> buttonSpawnKara: aButton [
	
	buttonSpawnKara := aButton
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
	#'squeak_changestamp' : 'ND 6/25/2026 21:21'
}
SKExecuteControls >> buttonStop: aButton [
	
	buttonStop := aButton
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 7/4/2026 11:32'
}
SKExecuteControls >> createButtonNextChallenge [

	self buttonNextChallenge: (SKButtonNextChallenge new executeControls: self)
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
	#'squeak_changestamp' : 'JJG 7/1/2024 14:59'
}
SKExecuteControls >> environment [
	
	^ environment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/29/2026 12:41'
}
SKExecuteControls >> environment: anEnvironment [
	
	environment := anEnvironment
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
	#'squeak_changestamp' : 'LM 4/29/2026 12:34'
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
	#category : #widgets,
	#'squeak_changestamp' : 'ND 6/25/2026 21:17'
}
SKExecuteControls >> resizeWidgetByFactor: aNumber [
	
	| controlSize |
	
	controlSize := self defaultBounds extent * aNumber.
	
	self extent: controlSize.
	
	self submorphsDo: [ :subMorph | subMorph scaleFactor: aNumber ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/29/2026 12:43'
}
SKExecuteControls >> scaleFactor [

	^ scaleFactor ifNil: [ 1 ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 22:43'
}
SKExecuteControls >> scaleFactor: aNumber [

	self resizeWidgetByFactor: aNumber.
	
	^ scaleFactor := aNumber
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
	#'squeak_changestamp' : 'ND 6/17/2026 00:03'
}
SKExecuteControls >> sliderSpeed: aSlider [
	
	 sliderSpeed := aSlider
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'ND 6/29/2026 16:44'
}
SKExecuteControls >> updateTextures [

	self buttonRun updateTextures
]
