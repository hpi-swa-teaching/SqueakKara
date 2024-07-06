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
		'kara',
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
	#'squeak_changestamp' : 'jt 6/24/2024 00:14'
}
SKEnvironment >> gameHeight [

	^ gameHeight ifNil: [gameHeight := self grid height + (self grid pixelPerBlock * 4)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jt 6/24/2024 00:16'
}
SKEnvironment >> gameHeight: aNumber [

	gameHeight := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jt 6/24/2024 00:15'
}
SKEnvironment >> gameWidth [

	^ gameWidth ifNil: [gameWidth := self grid width + (self grid pixelPerBlock * 2)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jt 6/24/2024 00:15'
}
SKEnvironment >> gameWidth: aNumber [

	gameWidth := aNumber
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
	#'squeak_changestamp' : 'JJG 7/6/2024 17:48'
}
SKEnvironment >> initializeObjects [

	self workspace: (SKWorkspace newWithKara: self kara).
	self executer: (SKExecuter new).
	(self executer kara) kara: self kara.
	self executeControls: SKExecuteControls new.
	self executeControls environment: self.
	
	self setSystemWindow.
	self systemWindow openInHand
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JJG 7/1/2024 16:28'
}
SKEnvironment >> initializeWithChallenge1 [

	self grid: (SKGrid newWithExtent: 7 @ 7).
	self kara: self grid challenge1.
	self initializeObjects

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JJG 7/1/2024 16:30'
}
SKEnvironment >> initializeWithChallenge2 [

	self grid: (SKGrid newWithExtent: 9 @ 2).
	self kara: self grid challenge2.
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JJG 7/1/2024 16:30'
}
SKEnvironment >> initializeWithChallenge3 [

	self grid: (SKGrid newWithExtent: 9 @ 3).
	self kara: self grid challenge3.
	self initializeObjects
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JJG 7/1/2024 16:30'
}
SKEnvironment >> initializeWithKaraAt: aPoint [
	
	self grid: (SKGrid newWithExtent: 7 @ 7).
	self kara: (SKKara newInGrid: self grid at: aPoint).
	self initializeObjects
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:41'
}
SKEnvironment >> kara [
	
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:41'
}
SKEnvironment >> kara: anObject [
	
	kara := anObject
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:08'
}
SKEnvironment >> pause [

	executer suspendExecution
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JJG 7/1/2024 16:25'
}
SKEnvironment >> positionExecuteControlsAndGrid [

	| startPoint |
	
	startPoint  := self grid pixelPerBlock @ (3 * self grid pixelPerBlock).
	self grid position: self systemWindow position + startPoint.
	
	startPoint := ((self gameWidth / 2) - (executeControls width / 2)) @ ( 1.5 * self grid pixelPerBlock).
	self executeControls position: self systemWindow position + startPoint.
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:09'
}
SKEnvironment >> resume [

	executer resumeExecution
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:41'
}
SKEnvironment >> run [
	
	|code|
	
	code :=  self workspace userCode.
	self executer execute: code
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JJG 7/1/2024 16:25'
}
SKEnvironment >> setSystemWindow [

	
	self systemWindow: SystemWindow new.
	self systemWindow setLabel: 'Kara'.
	self systemWindow 
		extent: self gameWidth @ self gameHeight;
		setWindowColor: self grid backgroundColor;
		addMorph: self executeControls;
		addMorph: self grid.
	self positionExecuteControlsAndGrid
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
