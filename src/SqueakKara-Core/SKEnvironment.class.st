"
SKEnvironment provides the main programming environment, consisting of the grid (SKGrid) with its kara object (SKKara), a workspace (SKWorkspace) in which to write the code, an executer (SKExecuter) to execute the code and executeControls (SKExecuteControls) to provide UI for the code execution. Apart from being a common access point for all these elements, SKEnvironent also stores relevant variables for the scaling of the application.
"
Class {
	#name : #SKEnvironment,
	#superclass : #Object,
	#instVars : [
		'grid',
		'workspaces',
		'executer',
		'executeControls',
		'gameWidth',
		'gameHeight',
		'systemWindow'
	],
	#category : #'SqueakKara-Core',
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
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/21/2026 16:59'
}
SKEnvironment >> addKaraAt: aPoint [

	| kara |
	kara := (SKKara newInGrid: self grid at: aPoint).

	self workspaces at: kara put:
		(SKWorkspace newWithExecuter: (self executer) and: kara)
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
	#'squeak_changestamp' : 'LM 5/21/2026 10:28'
}
SKEnvironment >> close [

	self workspaces valuesDo: [ :workspace | workspace close ].
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
	#'squeak_changestamp' : 'LM 5/21/2026 10:46'
}
SKEnvironment >> initialize [

	self executer: (SKExecuter newWithEnvironment: self).

	self workspaces: Dictionary new.
	super initialize
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/21/2026 10:46'
}
SKEnvironment >> initializeObjects [

	self executeControls: SKExecuteControls new.
	self executeControls environment: self.
	
	self setSystemWindow.
	self systemWindow openInHand
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/21/2026 10:21'
}
SKEnvironment >> initializeWithChallenge1 [

	self grid: (SKGrid newWithExtent: 7 @ 7).
	SKChallenge initializeChallenge1For: self.
	self initializeObjects

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/21/2026 10:25'
}
SKEnvironment >> initializeWithChallenge2 [

	self grid: (SKGrid newWithExtent: 9 @ 2).
	SKChallenge initializeChallenge2For: self.
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/21/2026 10:25'
}
SKEnvironment >> initializeWithChallenge3 [

	self grid: (SKGrid newWithExtent: 9 @ 3).
	SKChallenge initializeChallenge3For: self.
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/21/2026 10:25'
}
SKEnvironment >> initializeWithChallenge4 [

	self grid: (SKGrid newWithExtent: 7 @ 4).
	SKChallenge initializeChallenge4For: self.
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
	#'squeak_changestamp' : 'LM 5/21/2026 10:42'
}
SKEnvironment >> run [

	self workspaces keysAndValuesDo: [ :kara :workspace | 
		self executer execute: workspace userCode for: kara ]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 4/29/2026 18:06'
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
		addMorph: container fullFrame: (LayoutFrame fractions: (0@0 corner: 1@1)).
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
	#'squeak_changestamp' : 'LM 5/21/2026 10:27'
}
SKEnvironment >> workspaces [
	
	^ workspaces
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/21/2026 10:27'
}
SKEnvironment >> workspaces: aDictionary [
	
	workspaces := aDictionary
]
