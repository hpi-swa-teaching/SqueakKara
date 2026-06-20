"
SKEnvironment provides the main programming environment, consisting of the grid (SKGrid) with its kara object (SKKara), a workspace (SKWorkspace) in which to write the code, an executer (SKExecuter) to execute the code and executeControls (SKExecuteControls) to provide UI for the code execution. Apart from being a common access point for all these elements, SKEnvironent also stores relevant variables for the scaling of the application.
"
Class {
	#name : #SKEnvironment,
	#superclass : #Object,
	#instVars : [
		'grid',
		'programmingUI',
		'executer',
		'karas',
		'executeControls',
		'gameWidth',
		'gameHeight',
		'systemWindow',
		'programmingConcept',
		'windowManager',
		'challange'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:38'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:26'
}
SKEnvironment class >> newWithProgrammingConcept: aConcept [

	^ (self new
			programmingConcept: aConcept;
			initializeProgrammingUI;
			yourself)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 22:02'
}
SKEnvironment >> addKara: aKara [

	self karas add: aKara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 15:19'
}
SKEnvironment >> blockspace [
	^ blockspace
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 5/5/2026 15:19'
}
SKEnvironment >> blockspace: anObject [
	blockspace := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 21:38'
}
SKEnvironment >> calculateScaleFactor: aPoint [

	 ^ (aPoint x / self gameWidth) min: (aPoint y / self gameHeight)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/15/2026 20:18'
}
SKEnvironment >> challange [
	^ challange
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/15/2026 20:18'
}
SKEnvironment >> challange: anObject [
	challange := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/17/2026 00:24'
}
SKEnvironment >> clearKaras [

	self karas: OrderedCollection new
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 5/27/2026 21:22'
}
SKEnvironment >> close [

	self programmingUI close.
	self grid abandon.
	self executer terminate.
	self systemWindow ifNotNil:  [self systemWindow delete].

	
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
	#'squeak_changestamp' : 'JJG 6/17/2024 16:40'
}
SKEnvironment >> grid: anObject [
	
	grid := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:35'
}
SKEnvironment >> initialize [

	self karas: OrderedCollection new.
	
	super initialize
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 6/2/2026 15:36'
}
SKEnvironment >> initializeObjects [


	self executeControls: SKExecuteControls new.
	self executeControls environment: self.
	
	self setSystemWindow.
	self systemWindow openInHand
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/3/2026 12:31'
}
SKEnvironment >> initializeProgrammingUI [

		self windowManager: SKWindowManager new.
		self executer: (SKExecuter newWithEnvironment: self).
		self programmingUI: (self programmingConcept buildProgrammingUI: (self executer) andEnvironment: self).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 6/2/2026 15:48'
}
SKEnvironment >> initializeWithBlankProject [

	self grid: (SKGrid newWithExtent: 7 @ 7).
	SKChallenge initializeBlankProjectFor: self grid environment: self.
	self initializeObjects.
	self executeControls currentChallenge: 'BlankProject'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 6/2/2026 15:39'
}
SKEnvironment >> initializeWithChallenge1 [

	self grid: (SKGrid newWithExtent: 7 @ 7).
	SKChallenge initializeChallenge1For: self grid environment: self.
	self initializeObjects.
	self executeControls currentChallenge: 'Challenge1'.

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 22:54'
}
SKEnvironment >> initializeWithChallenge2 [
	
	SKLevel3World4 new initializeWithEnvironment: self.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 15:01'
}
SKEnvironment >> initializeWithChallenge3 [

	self grid: (SKGrid newWithExtent: 9 @ 9).
	SKChallenge initializeChallenge3For: self grid environment: self.
	self initializeObjects.
	self executeControls currentChallenge: 'Challenge3'.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 6/2/2026 15:41'
}
SKEnvironment >> initializeWithChallenge4 [

	self grid: (SKGrid newWithExtent: 7 @ 4).
	SKChallenge initializeChallenge4For: self grid environment: self.
	self initializeObjects.
	self executeControls currentChallenge: 'Challenge4'.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/7/2026 21:51'
}
SKEnvironment >> initializeWithKaraAt: aPoint [
	
	self grid: (SKGrid newWithExtent: 7 @ 7).
	self addKara: (SKKara newInGrid: self grid at: aPoint).
	self initializeObjects
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 21:52'
}
SKEnvironment >> karas [
	
	^ karas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 21:52'
}
SKEnvironment >> karas: aCollection [
	
	karas := aCollection
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
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:09'
}
SKEnvironment >> programmingConcept [

	^ programmingConcept
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/22/2026 11:09'
}
SKEnvironment >> programmingConcept: aProgrammingConcept [

	programmingConcept := aProgrammingConcept
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 17:57'
}
SKEnvironment >> programmingUI [

	^ programmingUI
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/26/2026 17:58'
}
SKEnvironment >> programmingUI: aProgrammingUI [

	programmingUI := aProgrammingUI
]

{
	#category : #commands,
	#'squeak_changestamp' : 'FR 6/17/2026 00:25'
}
SKEnvironment >> reset: aChallenge [

	self grid clear.
	self clearKaras.
	SKChallenge perform: ('initialize', aChallenge, 'For:environment:') asSymbol withArguments:{self grid. self}
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
	#'squeak_changestamp' : 'LM 4/28/2026 21:26'
}
SKEnvironment >> resizeGridByFactor: aNumber [
	self grid scaleFactor: aNumber.
	self grid updateDimensions
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 4/28/2026 20:46'
}
SKEnvironment >> resume [

	self executer resumeExecution
]

{
	#category : #commands,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 16:30'
}
SKEnvironment >> run [

	| code |
	code :=  self programmingUI getCode.
	self executer execute: code
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 6/2/2026 12:52'
}
SKEnvironment >> setSystemWindow [
	
| container |

	self systemWindow: (SKSystemWindow new windowManager: self windowManager).
	self systemWindow setLabel: 'Kara'.
	
	container := self containerMorph
		addMorph: self grid;
		addMorph: self executeControls;
		addMorph: self windowManager;
		yourself.
	
	self systemWindow
		extent: self gameWidth @ self gameHeight;
		setWindowColor: self grid backgroundColor; 
		resizeListener: [ self resize ];
		addMorph: container fullFrame: (LayoutFrame fractions: (0@0 corner: 1@1)).
		
	self windowManager addWindow: self systemWindow.	
	self positionExecuteControlsAndGrid.
	self resize
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:09'
}
SKEnvironment >> stop [
	
	self executer terminate
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
	#'squeak_changestamp' : 'JS 5/12/2026 18:24'
}
SKEnvironment >> windowManager [
	^ windowManager
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 5/12/2026 18:24'
}
SKEnvironment >> windowManager: anObject [
	windowManager := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:41'
}
SKEnvironment >> workspace [
	
	^ workspace
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:41'
}
SKEnvironment >> workspace: anObject [
	
	workspace := anObject
]
