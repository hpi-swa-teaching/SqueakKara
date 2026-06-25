"
SKEnvironment provides the main programming environment, consisting of the grid (SKGrid) with its kara object (SKKara), a workspace (SKWorkspace) in which to write the code, an executer (SKExecuter) to execute the code and executeControls (SKExecuteControls) to provide UI for the code execution. Apart from being a common access point for all these elements, SKEnvironent also stores relevant variables for the scaling of the application.
"
Class {
	#name : #SKEnvironment,
	#superclass : #Object,
	#instVars : [
		'grid',
		'karas',
		'executer',
		'executeControls',
		'gameWidth',
		'gameHeight',
		'systemWindow',
		'nextChallenge',
		'isTerminating'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:38'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LM 5/7/2026 22:06'
}
SKEnvironment class >> newWithKaraAt: aPoint [

	^ self new
		initializeWithKaraAt: aPoint;
		yourself
]

{
	#category : #commands,
	#'squeak_changestamp' : 'jawi 6/3/2026 18:34'
}
SKEnvironment >> abandon [

	self workspaces do: [ :workspace | workspace superClose ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 5/28/2026 18:28'
}
SKEnvironment >> addKara: aKara [

	| workspace |
	
	workspace := SKWorkspace newWithExecuter: self executer and: aKara.
	aKara
		workspace: workspace;
		color: aKara findUnusedColor.
	
	self karas add: aKara.
	
	^ aKara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/25/2026 20:13'
}
SKEnvironment >> addKaraAt: aPoint [

	^ self addKara: (SKKara newInGrid: self grid at: aPoint)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 21:38'
}
SKEnvironment >> calculateScaleFactor: aPoint [

	 ^ (aPoint x / self gameWidth) min: (aPoint y / self gameHeight)
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/23/2026 13:45'
}
SKEnvironment >> close [

	self grid abandon.
	self executer terminate.
	self systemWindow delete
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 21:38'
}
SKEnvironment >> containerMorph [

	^ Morph new
		color: Color transparent;
		layoutPolicy: TableLayout new;
		listCentering: #center;
		wrapCentering: #center;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellInset: 10;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:06'
}
SKEnvironment >> executeControls [
	
	^ executeControls
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 21:38'
}
SKEnvironment >> executeControls: anObject [
	
	executeControls := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:40'
}
SKEnvironment >> executer [
	
	^ executer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 21:39'
}
SKEnvironment >> executer: anExecuter [
	
	executer := anExecuter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:06'
}
SKEnvironment >> executerState [

	^ self executer state
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:06'
}
SKEnvironment >> executionSpeed: aSpeed [

	self executer speed: aSpeed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/26/2026 09:41'
}
SKEnvironment >> firstWorkspace [

	"Only used for testing"
	^ self workspaces first
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:27'
}
SKEnvironment >> gameHeight [

	^ gameHeight ifNil: [ self gameHeight: self grid height + (self grid pixelPerBlock * 4)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:52'
}
SKEnvironment >> gameHeight: aNumber [

	^ gameHeight := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:27'
}
SKEnvironment >> gameWidth [
	
	^ gameWidth ifNil: [ self gameWidth: self grid width + (self grid pixelPerBlock * 2)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:52'
}
SKEnvironment >> gameWidth: aNumber [

	^ gameWidth := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:40'
}
SKEnvironment >> grid [
	
	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 5/21/2026 22:03'
}
SKEnvironment >> grid: aGrid [
	
	aGrid environment: self.
	grid := aGrid
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LD 6/18/2026 21:43'
}
SKEnvironment >> initialize [

	super initialize.
	self executer: (SKExecuter newWithEnvironment: self).
	self karas: OrderedCollection new.
	self isTerminating: false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jawi 6/3/2026 18:49'
}
SKEnvironment >> initializeLandingPage [
	
	SKLandingPage new
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LD 6/25/2026 20:53'
}
SKEnvironment >> initializeObjects [

	self executeControls: SKExecuteControls new.
	self executeControls environment: self.
	
	self setSystemWindow.
	self systemWindow openInHand.
	self isTerminating: false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mr 6/5/2026 13:21'
}
SKEnvironment >> initializeWithBlankProject [

	self grid: (SKGrid newWithExtent: 7 @ 7).
	SKChallenge initializeBlankProjectChallengeFor: self.
	
	self nextChallenge: #initializeWithChallenge1.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jawi 6/3/2026 20:36'
}
SKEnvironment >> initializeWithChallenge1 [

	self grid: (SKGrid newWithExtent: 7 @ 7).
	SKChallenge initializeChallenge1For: self.
	
	self nextChallenge: #initializeWithChallenge2.
	
	self initializeObjects

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mr 6/16/2026 12:44'
}
SKEnvironment >> initializeWithChallenge10 [

	self grid: (SKGrid newWithExtent: 3 @ 5).
	SKChallenge initializeChallenge10For: self.
	
	self nextChallenge: #initializeLandingPage.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jawi 6/3/2026 20:36'
}
SKEnvironment >> initializeWithChallenge2 [

	self grid: (SKGrid newWithExtent: 9 @ 2).
	SKChallenge initializeChallenge2For: self.
	
	self nextChallenge: #initializeWithChallenge3.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jawi 6/3/2026 20:36'
}
SKEnvironment >> initializeWithChallenge3 [

	self grid: (SKGrid newWithExtent: 9 @ 3).
	SKChallenge initializeChallenge3For: self.
	
	self nextChallenge: #initializeWithChallenge4.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jawi 6/3/2026 20:36'
}
SKEnvironment >> initializeWithChallenge4 [

	self grid: (SKGrid newWithExtent: 7 @ 4).
	SKChallenge initializeChallenge4For: self.
	
	self nextChallenge: #initializeWithChallenge5.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mr 6/5/2026 13:21'
}
SKEnvironment >> initializeWithChallenge5 [

	self grid: (SKGrid newWithExtent: 11 @ 11).
	SKChallenge initializeChallenge5For: self.
	
	self nextChallenge: #initializeWithChallenge6.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mr 6/5/2026 13:21'
}
SKEnvironment >> initializeWithChallenge6 [

	self grid: (SKGrid newWithExtent: 9 @ 9).
	SKChallenge initializeChallenge6For: self.
	
	self nextChallenge: #initializeWithChallenge7.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mr 6/5/2026 13:21'
}
SKEnvironment >> initializeWithChallenge7 [

	self grid: (SKGrid newWithExtent: 8 @ 8).
	SKChallenge initializeChallenge7For: self.
	
	self nextChallenge: #initializeWithChallenge8.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JanWein 6/5/2026 13:55'
}
SKEnvironment >> initializeWithChallenge8 [

	self grid: (SKGrid newWithExtent: 10 @ 11).
	SKChallenge initializeChallenge8For: self.
	
	self nextChallenge: #initializeWithChallenge9.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mr 6/16/2026 12:43'
}
SKEnvironment >> initializeWithChallenge9 [

	self grid: (SKGrid newWithExtent: 9 @ 5).
	SKChallenge initializeChallenge9For: self.
	
	self nextChallenge: #initializeWithChallenge10.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/21/2026 10:32'
}
SKEnvironment >> initializeWithKaraAt: aPoint [
	
	self grid: (SKGrid newWithExtent: 7 @ 7).
	self addKaraAt: aPoint.
	self initializeObjects
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 6/18/2026 21:40'
}
SKEnvironment >> isTerminating [
	^ isTerminating
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 6/18/2026 21:40'
}
SKEnvironment >> isTerminating: anObject [
	isTerminating := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/23/2026 13:41'
}
SKEnvironment >> karas [

	^ karas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/23/2026 13:41'
}
SKEnvironment >> karas: aCollection [

	karas := aCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 5/21/2026 22:03'
}
SKEnvironment >> maxNumberOfKaras [

	^ SKKara defaultColors size
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 6/3/2026 18:43'
}
SKEnvironment >> nextChallenge [
	
	^ nextChallenge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 6/3/2026 20:35'
}
SKEnvironment >> nextChallenge: aChallenge [
	
	nextChallenge := aChallenge
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/4/2026 12:56'
}
SKEnvironment >> onFinish [

	self executeControls actionStop
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 4/28/2026 20:44'
}
SKEnvironment >> pause [

	self executer suspendExecution
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 4/28/2026 20:46'
}
SKEnvironment >> positionExecuteControlsAndGrid [

	| startPoint |
	
	startPoint  := self grid pixelPerBlock @ (3 * self grid pixelPerBlock).
	self grid position: self systemWindow position + startPoint.
	
	startPoint := ((self gameWidth / 2) - (self executeControls width / 2)) @ ( 1.5 * self grid pixelPerBlock).
	self executeControls position: self systemWindow position + startPoint.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LM 4/29/2026 12:26'
}
SKEnvironment >> resize [
	
	| scaleFactor |
	scaleFactor := self calculateScaleFactor: self systemWindow extent.
	
	self resizeGridByFactor: scaleFactor.
	self executeControls scaleFactor: scaleFactor
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LM 5/21/2026 17:28'
}
SKEnvironment >> resizeGridByFactor: aNumber [

	self grid scaleFactor: aNumber.
	self grid updateDimensions
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LD 6/18/2026 22:13'
}
SKEnvironment >> resume [

	self executer resumeExecution.
	self isTerminating: false.
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LD 6/18/2026 21:43'
}
SKEnvironment >> run [

	self isTerminating: false.
	self karas do: [ :kara | 
		self executer execute: kara workspace userCode for: kara ]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jawi 6/3/2026 19:53'
}
SKEnvironment >> setSystemWindow [
	
	| container |
	
	self systemWindow: SKSystemWindow new.
	self systemWindow setLabel: 'Kara'.
	
	container := self containerMorph
		addMorph: self grid;
		addMorph: self executeControls;
		yourself.
	
	self systemWindow
		extent: self gameWidth @ self gameHeight;
		setWindowColor: self grid backgroundColor;
		resizeListener: [ self resize ];
		closeListener: [ self abandon ];
		addMorph: container fullFrame: (LayoutFrame fractions: (0@0 corner: 1@1)).
	self positionExecuteControlsAndGrid.
	
	self resize
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LD 6/25/2026 19:50'
}
SKEnvironment >> stop [
	self isTerminating ifFalse: [
		self isTerminating: true.
		[self executer terminate] fork
		]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 16:11'
}
SKEnvironment >> systemWindow [
	
	^ systemWindow
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 7/1/2024 16:10'
}
SKEnvironment >> systemWindow: anObject [
	
	systemWindow := anObject
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 5/12/2026 21:01'
}
SKEnvironment >> updateTextures [

	self executeControls updateTextures
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/23/2026 13:41'
}
SKEnvironment >> workspaces [
	
	^ self karas collect: [ :kara | kara workspace ]
]
