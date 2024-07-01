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
		'gameHeight'
	],
	#category : #'SqueakKara-Core'
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
	#'squeak_changestamp' : 'JJG 6/18/2024 18:43'
}
SKEnvironment >> close [

	self workspace close.
	self grid abandon.

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 14:11'
}
SKEnvironment >> executeControls [
	^ executeControls
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'EB 6/22/2024 14:11'
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
	#'squeak_changestamp' : 'EB 6/22/2024 14:16'
}
SKEnvironment >> executerState [

	^ self executer state.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KD 6/12/2024 12:16'
}
SKEnvironment >> executionSpeed: aSpeed [

	self executer speed: aSpeed.
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
	#'squeak_changestamp' : 'JJG 6/18/2024 11:32'
}
SKEnvironment >> initialize [

	"self initializeWithChallenge1"
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jt 6/24/2024 00:17'
}
SKEnvironment >> initializeWithChallenge1 [

	| gameWindow  startPoint |

	self grid: (SKGrid newWithExtent: 7 @ 7).
	self kara: self grid challenge1.
	self workspace: (SKWorkspace newWithKara: self kara).
	self executer: (SKExecuter new).
	(self executer kara) kara: self kara.
	self executeControls: SKExecuteControls new.
	executeControls environment: self.
	
	gameWindow := SystemWindow new.
	gameWindow setLabel: 'Kara'.
	gameWindow extent: self gameWidth @ self gameHeight.
	gameWindow setWindowColor: self grid backgroundColor.
	
	gameWindow addMorph: self executeControls.
	gameWindow addMorph: self grid.
		
	startPoint := self grid pixelPerBlock @ (3 * self grid pixelPerBlock).
	self grid position: gameWindow position + startPoint.
	
	startPoint := ((self gameWidth / 2) - (executeControls width / 2)) @ ( 1.5 * self grid pixelPerBlock).
	self executeControls position: gameWindow position + startPoint.
	
	gameWindow openInHand.

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jt 6/24/2024 00:23'
}
SKEnvironment >> initializeWithChallenge2 [

	| gameWindow startPoint |

	self grid: (SKGrid newWithExtent: 9 @ 2).
	self kara: self grid challenge2.
	self workspace: (SKWorkspace newWithKara: self kara).
	self executer: (SKExecuter new).
	(self executer kara) kara: self kara.
	self executeControls: SKExecuteControls new.
	executeControls environment: self.
	
	gameWindow := SystemWindow new.
	gameWindow setLabel: 'Kara'.
	gameWindow extent: self gameWidth @ self gameHeight.
	gameWindow setWindowColor: self grid backgroundColor.
	
	gameWindow addMorph: self executeControls.
	gameWindow addMorph: self grid.
		
	startPoint := self grid pixelPerBlock @ (3 * self grid pixelPerBlock).
	self grid position: gameWindow position + startPoint.
	
	startPoint := ((self gameWidth / 2) - (executeControls width / 2)) @ ( 1.5 * self grid pixelPerBlock).
	self executeControls position: gameWindow position + startPoint.
	
	gameWindow openInHand.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jt 6/24/2024 00:23'
}
SKEnvironment >> initializeWithChallenge3 [

	| gameWindow startPoint |

	self grid: (SKGrid newWithExtent: 9 @ 3).
	self kara: self grid challenge3.
	self workspace: (SKWorkspace newWithKara: self kara).
	self executer: (SKExecuter new).
	(self executer kara) kara: self kara.
	self executeControls: SKExecuteControls new.
	executeControls environment: self.
	
	gameWindow := SystemWindow new.
	gameWindow setLabel: 'Kara'.
	gameWindow extent: self gameWidth @ self gameHeight.
	gameWindow setWindowColor: self grid backgroundColor.
	
	gameWindow addMorph: self executeControls.
	gameWindow addMorph: self grid.
		
	startPoint := self grid pixelPerBlock @ (3 * self grid pixelPerBlock).
	self grid position: gameWindow position + startPoint.
	
	startPoint := ((self gameWidth / 2) - (executeControls width / 2)) @ ( 1.5 * self grid pixelPerBlock).
	self executeControls position: gameWindow position + startPoint.
	
	gameWindow openInHand.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jt 6/24/2024 00:23'
}
SKEnvironment >> initializeWithKaraAt: aPoint [

	| gameWindow startPoint |
	
	self grid: (SKGrid newWithExtent: 7 @ 7).
	self kara: (SKKara newInGrid: self grid at: aPoint).
	self workspace: (SKWorkspace newWithKara: self kara).
	self executer: (SKExecuter new).
	(self executer kara) kara: self kara.
	self executeControls: SKExecuteControls new.
	executeControls environment: self.
	
	gameWindow := SystemWindow new.
	gameWindow setLabel: 'Kara'.
	gameWindow extent: self gameWidth @ self gameHeight.
	gameWindow setWindowColor: self grid backgroundColor.
	
	gameWindow addMorph: self executeControls.
	gameWindow addMorph: self grid.
		
	startPoint := self grid pixelPerBlock @ (3 * self grid pixelPerBlock).
	self grid position: gameWindow position + startPoint.
	
	startPoint := ((self gameWidth / 2) - (executeControls width / 2)) @ ( 1.5 * self grid pixelPerBlock).
	self executeControls position: gameWindow position + startPoint.
	
	gameWindow openInHand.
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
	#'squeak_changestamp' : 'KD 6/12/2024 13:29'
}
SKEnvironment >> pause [

	executer suspendExecution.
]

{
	#category : #commands,
	#'squeak_changestamp' : 'KD 6/12/2024 13:29'
}
SKEnvironment >> resume [

	executer resumeExecution.
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
	#category : #commands,
	#'squeak_changestamp' : 'EB 6/22/2024 14:30'
}
SKEnvironment >> stop [
	
	self executer terminate.
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
