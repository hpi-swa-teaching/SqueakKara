"
SKEnvironment provides the main game environment. 

Instance Variables
	grid:				<SKGrid>
	karas:		 		<Collection>
	executer:			<SKScheduler>
	executeControls:	<SKExecuteControls>
	gameWidth:		<Number>
	gameHeight: 		<Number>
	nextChallenge:		<Symbol>
	currentChallenge:	<Symbol>
	isTerminationg: 	<Boolean>

grid
	- The grid of the environment.
	
karas
	- The collection of the existing karas in the environment.

executer
	-  The executer of the environment.

executeControls
	- The executeControls (space of the buttons and button mangement) of the environment.

gameWidth
	- The width of the window.
	
gameHeight
	- The height of the window.
	
nextChallenge
	- A symbol referencing the method to initialize the next challenge.

curentChallenge
	- A symbol referencing the method to initialze the current challenge.

isTerminating
	- True if the executer is currently terminating
"
Class {
	#name : #SKEnvironment,
	#superclass : #SKSystemWindow,
	#instVars : [
		'grid',
		'karas',
		'executer',
		'executeControls',
		'gameWidth',
		'gameHeight',
		'nextChallenge',
		'currentChallenge',
		'isTerminating'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'LM 7/5/2026 17:19'
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
	#'squeak_changestamp' : 'ND 7/1/2026 16:10'
}
SKEnvironment >> close [

	self grid abandon.
	self executer terminate.
	self delete
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
	#'squeak_changestamp' : 'ND 6/25/2026 21:14'
}
SKEnvironment >> currentChallenge [

	^ currentChallenge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/25/2026 21:15'
}
SKEnvironment >> currentChallenge: aSymbol [

	currentChallenge := aSymbol
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
	#'squeak_changestamp' : 'ND 7/5/2026 22:55'
}
SKEnvironment >> gameWidth [
	
	^ gameWidth ifNil: [ 
		self grid width > self executeControls width 
			ifTrue: [ self gameWidth: self grid width + (self grid pixelPerBlock * 2) ]
			ifFalse: [self gameWidth: self executeControls width + (self grid pixelPerBlock * 2) ]
		]
		
		
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
	#'squeak_changestamp' : 'LD 7/2/2026 13:58'
}
SKEnvironment >> initializeObjects [

	self executeControls: SKExecuteControls new.
	self executeControls environment: self.
	
	self setSystemWindow.
	self isTerminating: false.
	self openInHand
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
	#'squeak_changestamp' : 'ND 6/18/2026 21:54'
}
SKEnvironment >> initializeWithChallenge1 [

	self grid: (SKGrid newWithExtent: 7 @ 7).
	SKChallenge initializeChallenge1For: self.
	
	self currentChallenge: #initializeWithChallenge1.
	self nextChallenge: #initializeWithChallenge2.
	
	self initializeObjects

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LD 7/5/2026 14:45'
}
SKEnvironment >> initializeWithChallenge10 [

	self grid: (SKGrid newWithExtent: 3 @ 5).
	SKChallenge initializeChallenge10For: self.
	
	self currentChallenge: #initializeWithChallenge10.
	self nextChallenge: #initializeWithChallenge11.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 7/4/2026 14:13'
}
SKEnvironment >> initializeWithChallenge11 [

	self grid: (SKGrid newWithExtent: 7 @ 7).
	SKChallenge initializeChallenge11For: self.
	
	self currentChallenge: #initializeWithChallenge11.
	self nextChallenge: #initializeWithChallenge12.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 7/4/2026 14:13'
}
SKEnvironment >> initializeWithChallenge12 [

	self grid: (SKGrid newWithExtent: 7 @ 7).
	SKChallenge initializeChallenge12For: self.
	
	self currentChallenge: #initializeWithChallenge12.
	self nextChallenge: #initializeLandingPage.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ND 6/18/2026 21:54'
}
SKEnvironment >> initializeWithChallenge2 [

	self grid: (SKGrid newWithExtent: 9 @ 2).
	SKChallenge initializeChallenge2For: self.
	
	self currentChallenge: #initializeWithChallenge2.
	self nextChallenge: #initializeWithChallenge3.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ND 6/18/2026 21:54'
}
SKEnvironment >> initializeWithChallenge3 [

	self grid: (SKGrid newWithExtent: 9 @ 3).
	SKChallenge initializeChallenge3For: self.

	self currentChallenge: #initializeWithChallenge3.	
	self nextChallenge: #initializeWithChallenge4.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ND 6/18/2026 21:54'
}
SKEnvironment >> initializeWithChallenge4 [

	self grid: (SKGrid newWithExtent: 7 @ 4).
	SKChallenge initializeChallenge4For: self.
	
	self currentChallenge: #initializeWithChallenge4.
	self nextChallenge: #initializeWithChallenge5.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ND 6/18/2026 21:54'
}
SKEnvironment >> initializeWithChallenge5 [

	self grid: (SKGrid newWithExtent: 11 @ 11).
	SKChallenge initializeChallenge5For: self.

	self currentChallenge: #initializeWithChallenge5.	
	self nextChallenge: #initializeWithChallenge6.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ND 6/18/2026 21:54'
}
SKEnvironment >> initializeWithChallenge6 [

	self grid: (SKGrid newWithExtent: 9 @ 9).
	SKChallenge initializeChallenge6For: self.
	
	self currentChallenge: #initializeWithChallenge6.
	self nextChallenge: #initializeWithChallenge7.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ND 6/18/2026 21:55'
}
SKEnvironment >> initializeWithChallenge7 [

	self grid: (SKGrid newWithExtent: 8 @ 8).
	SKChallenge initializeChallenge7For: self.
	
	self currentChallenge: #initializeWithChallenge7.
	self nextChallenge: #initializeWithChallenge8.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'ND 6/18/2026 21:55'
}
SKEnvironment >> initializeWithChallenge8 [

	self grid: (SKGrid newWithExtent: 10 @ 11).
	SKChallenge initializeChallenge8For: self.
	
	self currentChallenge: #initializeWithChallenge8.
	self nextChallenge: #initializeWithChallenge9.
	
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LD 7/2/2026 13:50'
}
SKEnvironment >> initializeWithChallenge9 [

	self grid: (SKGrid newWithExtent: 9 @ 5).
	SKChallenge initializeChallenge9For: self.
	
	self currentChallenge: #initializeWithChallenge9.
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
	#'squeak_changestamp' : 'JanWein 7/4/2026 19:27'
}
SKEnvironment >> isTerminating [

	^ isTerminating
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 7/5/2026 17:19'
}
SKEnvironment >> isTerminating: aBoolean [

	isTerminating := aBoolean
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
	#'squeak_changestamp' : 'ND 6/25/2026 21:15'
}
SKEnvironment >> nextChallenge: aSymbol [
	
	nextChallenge := aSymbol
]

{
	#category : #commands,
	#'squeak_changestamp' : 'ND 6/17/2026 00:11'
}
SKEnvironment >> onFinish [

	self executeControls buttonStop action
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
	#'squeak_changestamp' : 'ND 7/1/2026 16:08'
}
SKEnvironment >> positionExecuteControlsAndGrid [

	| startPoint |
	
	startPoint  := self grid pixelPerBlock @ (3 * self grid pixelPerBlock).
	self grid position: self position + startPoint.
	
	startPoint := ((self gameWidth / 2) - (self executeControls width / 2)) @ ( 1.5 * self grid pixelPerBlock).
	self executeControls position: self position + startPoint.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'ND 7/1/2026 16:08'
}
SKEnvironment >> resize [
	
	| scaleFactor |
	scaleFactor := self calculateScaleFactor: self extent.
	
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
	#'squeak_changestamp' : 'JanWein 7/4/2026 19:28'
}
SKEnvironment >> resume [

	self executer resumeExecution.
	self isTerminating: false
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
	#'squeak_changestamp' : 'ND 7/1/2026 16:08'
}
SKEnvironment >> setSystemWindow [
	
	| container |
	
	self setLabel: 'Kara'.
	
	container := self containerMorph
		addMorph: self grid;
		addMorph: self executeControls;
		yourself.
	
	self extent: self gameWidth @ self gameHeight;
		setWindowColor: self grid backgroundColor;
		resizeListener: [ self resize ];
		closeListener: [ self abandon ];
		addMorph: container fullFrame: (LayoutFrame fractions: (0@0 corner: 1@1)).
	self positionExecuteControlsAndGrid.
	
	self resize
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 7/5/2026 17:20'
}
SKEnvironment >> stop [

	self isTerminating ifFalse: [
		self isTerminating: true.
		[ self executer terminate ] fork ]
]

{
	#category : #texture,
	#'squeak_changestamp' : 'ND 6/29/2026 16:43'
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
