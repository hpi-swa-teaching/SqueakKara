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
		'gridLines'
	],
	#category : #'SqueakKara-Core',
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
	#'squeak_changestamp' : 'LM 4/28/2026 20:35'
}
SKGrid >> addGridLine: aMorph [

	self addMorph: aMorph.
	self gridLines add: aMorph
]

{
	#category : #texture,
	#'squeak_changestamp' : 'JS 7/2/2026 03:52'
}
SKGrid >> addHorizontalLineAt: aCoordinate [

	| aMorph |
	
	aMorph := Morph new.

	aMorph color: self lineColor;
			width: self width;
			height: self lineWidth;
	 		position: self position x @ (self position y + (aCoordinate * self pixelPerBlock)).
			
	self addGridLine: aMorph


	
]

{
	#category : #texture,
	#'squeak_changestamp' : 'JS 7/2/2026 03:54'
}
SKGrid >> addVerticalLineAt: aCoordinate [

	| aMorph |
	
	aMorph := Morph new.

	aMorph color: self lineColor;
			width: self lineWidth;
			height: self height;
	 		position: (self position x + (aCoordinate * self pixelPerBlock)) @ self position y.
			
	self addGridLine: aMorph

	
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LK 7/4/2024 19:10'
}
SKGrid >> backgroundColor [

	 ^ SKStylesheet primaryColor
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'JS 5/17/2026 13:01'
}
SKGrid >> blankProject [	
	^SKKara newInGrid: self at: 1 @ 1.
]

{
	#category : #texture,
	#'squeak_changestamp' : 'JS 6/2/2026 15:37'
}
SKGrid >> clear [
	self submorphsDo: [:cell | cell delete.].
	self drawTexture.
]

{
	#category : #texture,
	#'squeak_changestamp' : 'LM 4/27/2026 11:27'
}
SKGrid >> drawTexture [

	1 to: self gridHeight - 1 do: [:anInteger |
		self addHorizontalLineAt: anInteger].
	1 to: self gridWidth - 1 do: [:anInteger |
		self addVerticalLineAt: anInteger].
]

{
	#category : #texture,
	#'squeak_changestamp' : 'JS 6/23/2026 18:57'
}
SKGrid >> enforceZOrder [

	| sorted unsorted |
	
	unsorted := OrderedCollection new.
	1 to: self gridWidth do: 
		[:x | 1 to: self gridHeight do: 
			[:y | unsorted addAll: (self gridCoordinator getTileAtCoordinates: x @ y)]].
	sorted := unsorted asSortedCollection: [:gridObject0 :gridObject1 | gridObject0 zValue < gridObject1 zValue].
	sorted do: [:gridObject | gridObject comeToFront].
	self redrawTexture.
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
	#category : #initialization,
	#'squeak_changestamp' : 'jawi 5/14/2026 13:15'
}
SKGrid >> initialize [
	
	self gridLines: OrderedCollection new.

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
	#category : #texture,
	#'squeak_changestamp' : 'LK 7/4/2024 19:12'
}
SKGrid >> lineColor [

	^ SKStylesheet secondaryColor

	
]

{
	#category : #texture,
	#'squeak_changestamp' : 'JS 7/5/2026 20:15'
}
SKGrid >> lineWidth [

	^ 1

	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'JS 7/2/2026 04:26'
}
SKGrid >> pixelPerBlock [

	^ SKGridObject textureDimension * self scaleFactor
]

{
	#category : #texture,
	#'squeak_changestamp' : 'ND 5/20/2026 14:40'
}
SKGrid >> redrawTexture [

	self gridLines do: [:gridLine | self removeMorph: gridLine ].
	self submorphsDo: [:submorph | submorph scaleToFactor].
	
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
	#category : #layout,
	#'squeak_changestamp' : 'LM 4/27/2026 13:27'
}
SKGrid >> updateDimensions [
	self width: self pixelPerBlock * self gridWidth;
		height: self pixelPerBlock * self gridHeight.
	self redrawTexture
]
