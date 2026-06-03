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
		'stopTexture',
		'runTexture',
		'pauseTexture',
		'karaTexture',
		'sliderSpeed',
		'scaleFactor',
		'nextChallengeTexture'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:42'
}

{
	#category : #widgets,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:43'
}
SKExecuteControls >> actionNextChallenge [

	SKEnvironment new perform: self environment nextChallenge.
	self environment close
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'LM 5/7/2026 21:41'
}
SKExecuteControls >> actionRun [

	self toggleExecutionState.
	self updateTextures
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'jawi 5/28/2026 18:28'
}
SKExecuteControls >> actionSpawnKara [

	| grid gridCoordinator freeList kara karaList karaPosition |
	
	grid := self environment grid.
	karaList := self environment karas.
	gridCoordinator := grid gridCoordinator.
	freeList := gridCoordinator findFreeFields.
	
	(freeList isEmpty or: self environment maxNumberOfKaras == karaList size) ifTrue: [ ^ self ].
	
	karaPosition := freeList atRandom.
	freeList remove: karaPosition.
	freeList isEmpty ifTrue: [ ^ self ].
	
	kara := SKKara newInGrid: grid at: karaPosition with: (freeList atRandom).
	kara randomDirection.
	
	self environment addKara: kara
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'LM 5/7/2026 21:28'
}
SKExecuteControls >> actionStop [

	self environment stop.
	self updateTextures
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:11'
}
SKExecuteControls >> addAllWidgets [

	self loadTextures.
	
	self addButtonRun.
	self addSliderSpeed.
	self addButtonStop.
	self addButtonSpawnKara.
	self createButtonNextChallenge.
	
	self layoutChanged
]

{
	#category : #texture,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:11'
}
SKExecuteControls >> addButtonNextChallenge [

	self addMorphBack: self buttonNextChallenge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:03'
}
SKExecuteControls >> addButtonRun [

	self buttonRun: self buildButtonRun.
	self buttonRunSetTexture: self runTexture.
	self addMorphBack: self buttonRun
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:05'
}
SKExecuteControls >> addButtonSpawnKara [

	self buttonSpawnKara: self buildButtonSpawnKara.
	self buttonSpawnKaraSetTexture: self karaTexture.
	self addMorphBack: self buttonSpawnKara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:04'
}
SKExecuteControls >> addButtonStop [

	self buttonStop: self buildButtonStop.
	self buttonStopSetTexture.
	self addMorphBack: self buttonStop
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:04'
}
SKExecuteControls >> addSliderSpeed [

	self sliderSpeed: self buildSliderSpeed.
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
	#category : #widgets,
	#'squeak_changestamp' : 'jawi 6/3/2026 18:54'
}
SKExecuteControls >> buildButtonNextChallenge [
	
	^ IconicButton new
		target: self;
		actionSelector: #actionNextChallenge;
		color: SKStylesheet secondaryColor;
		yourself
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
	#'squeak_changestamp' : 'jawi 5/14/2026 12:13'
}
SKExecuteControls >> buildButtonSpawnKara [
	
	^ IconicButton new
		target: self;
		actionSelector: #actionSpawnKara;
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
	#category : #texture,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:22'
}
SKExecuteControls >> buttonNextChallengeSetTexture: aForm [

	self buttonNextChallenge labelGraphic: aForm
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
	#'squeak_changestamp' : 'LM 4/29/2026 12:37'
}
SKExecuteControls >> buttonRun: aMorph [
	
	buttonRun := aMorph
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
	#'squeak_changestamp' : 'jawi 5/14/2026 12:07'
}
SKExecuteControls >> buttonSpawnKara [
	
	^ buttonSpawnKara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 5/14/2026 13:17'
}
SKExecuteControls >> buttonSpawnKara: aMorph [
	
	buttonSpawnKara := aMorph
]

{
	#category : #texture,
	#'squeak_changestamp' : 'jawi 5/14/2026 12:34'
}
SKExecuteControls >> buttonSpawnKaraSetTexture: aForm [

	self buttonSpawnKara labelGraphic: aForm
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
	#'squeak_changestamp' : 'LM 4/29/2026 12:37'
}
SKExecuteControls >> buttonStop: aMorph [
	
	buttonStop := aMorph
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 4/28/2026 21:15'
}
SKExecuteControls >> buttonStopSetTexture [

	self buttonStop labelGraphic: self stopTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:25'
}
SKExecuteControls >> createButtonNextChallenge [

	self buttonNextChallenge: self buildButtonNextChallenge.
	self buttonNextChallengeSetTexture: self nextChallengeTexture
]

{
	#category : #texture,
	#'squeak_changestamp' : 'jawi 6/3/2026 18:11'
}
SKExecuteControls >> currentRunButtonTexture [

	| iconSize |
	
	iconSize := (self defaultIconicButtonSize - (10@10)) * self scaleFactor.

	self environment executerState = #running
		ifTrue: [ ^ self pauseTexture scaledToSize: iconSize ].

	^ self runTexture scaledToSize: iconSize
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
	#'squeak_changestamp' : 'jawi 6/3/2026 18:11'
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
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 5/14/2026 12:35'
}
SKExecuteControls >> karaTexture [
	
	^ karaTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 5/14/2026 12:35'
}
SKExecuteControls >> karaTexture: aForm [
	
	karaTexture := aForm
]

{
	#category : #texture,
	#'squeak_changestamp' : 'jawi 5/14/2026 12:38'
}
SKExecuteControls >> karaTextureFilename [

	^ 'Kara-FacingUp.png'
]

{
	#category : #texture,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:27'
}
SKExecuteControls >> loadTextures [
	
	self
		stopTexture: (self getTexture: self stopTextureFilename);
		runTexture: (self getTexture: self runTextureFilename);
		pauseTexture: (self getTexture: self pauseTextureFilename);
		karaTexture: (self getTexture: self karaTextureFilename);
		nextChallengeTexture: (self getTexture: self nextChallengeTextureFilename)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:25'
}
SKExecuteControls >> nextChallengeTexture [
	
	^ nextChallengeTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:25'
}
SKExecuteControls >> nextChallengeTexture: aForm [
	
	nextChallengeTexture := aForm
]

{
	#category : #texture,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:33'
}
SKExecuteControls >> nextChallengeTextureFilename [

	^ 'arrow_next_challenge.png'
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
	#'squeak_changestamp' : 'jawi 6/3/2026 19:30'
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
	
	self buttonSpawnKara extent: buttonSize.
	self buttonSpawnKara labelGraphic: (self karaTexture scaledToSize: iconSize).
	
	self buttonNextChallenge extent: buttonSize.
	self buttonNextChallenge labelGraphic: (self nextChallengeTexture scaledToSize: iconSize).
	
	self sliderSpeed extent: sliderSize
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
	#'squeak_changestamp' : 'LM 4/29/2026 12:43'
}
SKExecuteControls >> scaleFactor [

	^ scaleFactor ifNil: [ 1 ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 6/3/2026 18:11'
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
	#'squeak_changestamp' : 'LM 4/28/2026 21:14'
}
SKExecuteControls >> sliderSpeed: aNumber [
	
	^ sliderSpeed := aNumber
]

{
	#category : #widgets,
	#'squeak_changestamp' : 'LM 5/7/2026 22:58'
}
SKExecuteControls >> sliderSpeedValueChanged: aValue [
	
	self environment executionSpeed: aValue
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

{
	#category : #widgets,
	#'squeak_changestamp' : 'jawi 6/3/2026 18:11'
}
SKExecuteControls >> toggleExecutionState [

	| state |
	
	state := self environment executerState.

	state = #terminated ifTrue: [ self environment run. ^ self ].
	state = #suspended ifTrue: [ self environment resume. ^ self ].
	state = #running ifTrue: [ self environment pause. ^ self ].
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 5/7/2026 22:29'
}
SKExecuteControls >> updateTextures [

	self buttonRunSetTexture: self currentRunButtonTexture.
	self buttonStopSetTexture
]
