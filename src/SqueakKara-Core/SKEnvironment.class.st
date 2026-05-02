"
SKEnvironment provides the main programming environment, consisting of the grid (SKGrid) with its kara object (SKKara), a workspace (SKWorkspace) in which to write the code, an executer (SKExecuter) to execute the code and executeControls (SKExecuteControls) to provide UI for the code execution. Apart from being a common access point for all these elements, SKEnvironent also stores relevant variables for the scaling of the application.
"
Class {
	#name : #SKEnvironment,
	#superclass : #Object,
	#instVars : [
		'grid',
		'workspace',
		'executer',
		'karas',
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
	#'squeak_changestamp' : 'JJG 6/18/2024 11:38'
}
SKEnvironment class >> newWithKaraAt: aPoint [

	^ self basicNew initializeWithKaraAt: aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/27/2026 13:13'
}
SKEnvironment >> calculateScaleFactor: aPoint [
	 ^ (aPoint x / self gameWidth) min: (aPoint y / self gameHeight)
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JJG 7/1/2024 16:18'
}
SKEnvironment >> close [

	self workspace close.
	self grid abandon.
	self systemWindow delete

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:06'
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
	#'squeak_changestamp' : 'JJG 7/1/2024 15:06'
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
	#'squeak_changestamp' : 'JJG 6/17/2024 16:40'
}
SKEnvironment >> executer: anObject [
	
	executer := anObject
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
	#'squeak_changestamp' : 'mr 5/2/2026 16:09'
}
SKEnvironment >> initializeObjects [

	"TODO"
	self workspace: (SKWorkspace newWithKara: self karas first).
	
	self executer: (SKExecuter new).
	self executer karas: self karas.
	self executeControls: SKExecuteControls new.
	self executeControls environment: self.
	
	self setSystemWindow.
	self systemWindow openInHand
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mr 5/2/2026 16:31'
}
SKEnvironment >> initializeWithChallenge1 [

	self grid: (SKGrid newWithExtent: 7 @ 7).
	self karas: self grid challenge1.
	self initializeObjects

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mr 5/2/2026 16:31'
}
SKEnvironment >> initializeWithChallenge2 [

	self grid: (SKGrid newWithExtent: 9 @ 2).
	self karas: self grid challenge2.
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mr 5/2/2026 16:31'
}
SKEnvironment >> initializeWithChallenge3 [

	self grid: (SKGrid newWithExtent: 9 @ 3).
	self karas: self grid challenge3.
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mr 5/2/2026 16:07'
}
SKEnvironment >> initializeWithChallenge4 [

	self grid: (SKGrid newWithExtent: 8 @ 8).
	self karas: self grid challenge4.
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mr 5/2/2026 16:32'
}
SKEnvironment >> initializeWithKaraAt: aPoint [
	
	self grid: (SKGrid newWithExtent: 7 @ 7).
	self karas: { SKKara newInGrid: self grid at: aPoint } asOrderedCollection.
	self initializeObjects
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 5/2/2026 16:07'
}
SKEnvironment >> karas [

	^ karas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 5/2/2026 16:07'
}
SKEnvironment >> karas: anOrderedCollection [

	karas := anOrderedCollection
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
	#'squeak_changestamp' : 'LM 4/28/2026 19:16'
}
SKEnvironment >> run [

	| code |
	
	code :=  self workspace userCode.
	self executer execute: code
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
