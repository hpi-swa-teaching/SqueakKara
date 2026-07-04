"
SKGrid provides the grid in which all SKGridObjects are displayed. It creates and scales the grid itself and creates a SKGridCoordinator which handles all objects within the grid.
"
Class {
	#name : #SKGrid,
	#superclass : #Morph,
	#instVars : [
		'gridWidth',
		'gridHeight',
		'gridCoordinator',
		'scaleFactor',
		'gridLines',
		'environment',
		'leafCount'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JJG 7/1/2024 15:48'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'JJG 6/5/2024 17:29'
}
SKGrid class >> newWithExtent: aPoint [

	^ self newWithExtent: aPoint andScale: 1
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'JJG 6/5/2024 17:28'
}
SKGrid class >> newWithExtent: aPoint andScale: aFloat [

	^ SKGrid basicNew initializeWithExtent: aPoint andScale: aFloat
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 6/8/2026 22:20'
}
SKGrid >> addGridLine: aMorph [

	super addMorph: aMorph.
	self gridLines add: aMorph
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 4/27/2026 19:51'
}
SKGrid >> addHorizontalLineAt: aCoordinate [

	| aMorph |
	
	aMorph := Morph new.
	
	self addGridLine: aMorph.

	aMorph color: self lineColor;
			width: self width;
			height: self lineWidth;
	 		position: self position x @ (self position y + (aCoordinate * self pixelPerBlock)).


	
]

{
	#category : #'submorphs - add/remove',
	#'squeak_changestamp' : 'LM 6/8/2026 22:21'
}
SKGrid >> addMorph: aMorph [

	super addMorph: aMorph.
	self redrawTexture
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 4/27/2026 19:52'
}
SKGrid >> addVerticalLineAt: aCoordinate [

	| aMorph |
	
	aMorph := Morph new.
		
	self addGridLine: aMorph.

	aMorph color: self lineColor;
			width: self lineWidth;
			height: self height;
	 		position: (self position x + (aCoordinate * self pixelPerBlock)) @ self position y.

	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'mr 6/5/2026 13:00'
}
SKGrid >> allLeavesCollected [
	
	^ self leafCount = 0
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LK 7/4/2024 19:10'
}
SKGrid >> backgroundColor [

	 ^ SKStylesheet primaryColor
]

{
	#category : #texture,
	#'squeak_changestamp' : 'mr 7/4/2026 11:23'
}
SKGrid >> checkWinCondition [

	self allLeavesCollected ifTrue: [ 
		self spawnWinScreen. 
		self hasEnvironment ifTrue: [ self executeControls addButtonNextChallenge ]]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LD 5/29/2026 08:29'
}
SKGrid >> decrementLeafCount [

	self leafCount: self leafCount - 1
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 6/8/2026 22:20'
}
SKGrid >> drawTexture [

	1 to: self gridHeight - 1 do: [:anInteger |
		self addHorizontalLineAt: anInteger].
	1 to: self gridWidth - 1 do: [:anInteger |
		self addVerticalLineAt: anInteger ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 5/21/2026 22:04'
}
SKGrid >> environment [

	^ environment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 5/21/2026 22:05'
}
SKGrid >> environment: anEnvironment [

	environment := anEnvironment
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jawi 6/3/2026 18:59'
}
SKGrid >> executeControls [

	^ self environment executeControls
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 5/24/2024 11:18'
}
SKGrid >> gridCoordinator [

	^ gridCoordinator ifNil: [gridCoordinator := SKGridCoordinator newForGrid: self]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 5/22/2024 16:34'
}
SKGrid >> gridHeight [

	^ gridHeight ifNil: [gridHeight := 0]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LM 4/27/2026 11:34'
}
SKGrid >> gridHeight: aNumber [
	
	gridHeight := aNumber.
	self updateDimensions
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 5/14/2026 11:21'
}
SKGrid >> gridLines [

	^ gridLines
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:52'
}
SKGrid >> gridLines: aCollection [

	^ gridLines := aCollection
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 5/22/2024 16:35'
}
SKGrid >> gridWidth [

	^ gridWidth ifNil: [gridWidth := 0]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LM 4/27/2026 11:03'
}
SKGrid >> gridWidth: aNumber [
	
	gridWidth := aNumber.
	self updateDimensions
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:23'
}
SKGrid >> hasEnvironment [

	^ self environment isNil not
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LD 5/29/2026 08:29'
}
SKGrid >> incrementLeafCount [

	self leafCount: self leafCount + 1
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LD 5/29/2026 08:29'
}
SKGrid >> initialize [
	
	self gridLines: OrderedCollection new.
	self leafCount: 0.
	super initialize.
	self openInWorld;
		color: self backgroundColor
		

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 4/27/2026 11:27'
}
SKGrid >> initializeWithExtent: aPoint andScale: aFloat [

	self initialize.
	self scaleFactor: aFloat; 
		gridWidth: aPoint x;
		gridHeight: aPoint y;
		drawTexture
	
	
	

]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 5/24/2024 11:07'
}
SKGrid >> isPointInGridDimensions: aPoint [

	^ (aPoint x between: 1 and: self gridWidth) 
		and: (aPoint y between: 1 and: self gridHeight) 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 5/29/2026 08:30'
}
SKGrid >> leafCount [

	^ leafCount
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 5/29/2026 08:30'
}
SKGrid >> leafCount: anObject [

	leafCount := anObject
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LK 7/4/2024 19:12'
}
SKGrid >> lineColor [

	^ SKStylesheet secondaryColor

	
]

{
	#category : #texture,
	#'squeak_changestamp' : 'JJG 6/12/2024 16:22'
}
SKGrid >> lineWidth [

	^ 1 px

	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'JJG 6/5/2024 16:42'
}
SKGrid >> pixelPerBlock [

	^ SKGridObject textureDimension px * self scaleFactor
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 6/9/2026 18:56'
}
SKGrid >> redrawTexture [

	| sortedMorphs |

	self gridLines do: [:gridLine | self removeMorph: gridLine ].
	
	sortedMorphs := self submorphs asSortedCollection: [ :a :b | a zLayer <= b zLayer ].
	
	sortedMorphs do: [ :each | self removeMorph: each ].
	sortedMorphs do: [ :each | super addMorph: each. each scaleToFactor ].
	
	self drawTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/27/2026 12:22'
}
SKGrid >> scaleFactor [

	^ scaleFactor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/5/2024 16:48'
}
SKGrid >> scaleFactor: aNumber [
	
	scaleFactor := aNumber
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 5/29/2026 08:32'
}
SKGrid >> spawnWinScreen [

	SKWinScreen newInGrid: self.
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LM 5/21/2026 16:58'
}
SKGrid >> updateDimensions [

	self width: self pixelPerBlock * self gridWidth;
		height: self pixelPerBlock * self gridHeight.
	self redrawTexture
]
