"
The SKSlider extends the SimpleSliderMorph for the usage as a speedSlider in the executionControls.

Instance Variables
	scaleFactor:	 		<Number>
	executeControls:		<SKExecuteControls>

scaleFactor
	- The factor which is used to scale the sliderMorph.
	
executeControls
	- The owner of the slider. 
"
Class {
	#name : #SKSlider,
	#superclass : #SimpleSliderMorph,
	#instVars : [
		'scaleFactor',
		'executeControls'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'ND 7/5/2026 12:47'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:46'
}
SKSlider >> defaultSliderSize [
	
	^ 100 @ 20
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:48'
}
SKSlider >> environment [

	^ self executeControls environment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:53'
}
SKSlider >> executeControls [

	^ executeControls
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:18'
}
SKSlider >> executeControls: anExecuteControls [

	executeControls := anExecuteControls
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 7/4/2026 11:50'
}
SKSlider >> initialize [

	super initialize.
	self bounds: (0 @ 0 extent: self defaultSliderSize);
		minVal: 0;
		maxVal: 50;
		setNumericValue: 25;
		orientation: #horizontal;
		target: self;
		actionSelector: #sliderSpeedValueChanged:
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ND 6/25/2026 21:19'
}
SKSlider >> resizeByFactor: aNumber [
	
	| sliderSize |
	
	sliderSize := self defaultSliderSize * aNumber.
	
	self extent: sliderSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:50'
}
SKSlider >> scaleFactor [

	^ scaleFactor ifNil: [ 1 ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:51'
}
SKSlider >> scaleFactor: aNumber [

	self resizeByFactor: aNumber.
	
	^ scaleFactor := aNumber
]

{
	#category : #execution,
	#'squeak_changestamp' : 'ND 6/16/2026 23:46'
}
SKSlider >> sliderSpeedValueChanged: aValue [
	
	self environment executionSpeed: aValue
]
