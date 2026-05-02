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
	#category : #texture,
	#'squeak_changestamp' : 'LK 7/4/2024 19:10'
}
SKGrid >> backgroundColor [

	 ^ SKStylesheet primaryColor
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'LM 4/28/2026 20:15'
}
SKGrid >> challenge1 [
	
	SKTrunk newInGrid: self at: 1 @ 1.
	SKTrunk newInGrid: self at: 2 @ 1.
	SKTrunk newInGrid: self at: 3 @ 1.
	SKTrunk newInGrid: self at: 4 @ 1.
	SKTrunk newInGrid: self at: 5 @ 1.
	SKTrunk newInGrid: self at: 6 @ 1.
	SKTrunk newInGrid: self at: 7 @ 1.
	
	SKTrunk newInGrid: self at: 7 @ 2.
	SKTrunk newInGrid: self at: 7 @ 3.
	SKTrunk newInGrid: self at: 7 @ 4.
	SKTrunk newInGrid: self at: 7 @ 5.
	SKTrunk newInGrid: self at: 7 @ 6.
	SKTrunk newInGrid: self at: 7 @ 7.
	
	SKTrunk newInGrid: self at: 6 @ 7.
	SKTrunk newInGrid: self at: 5 @ 7.
	SKTrunk newInGrid: self at: 4 @ 7.
	SKTrunk newInGrid: self at: 3 @ 7.
	SKTrunk newInGrid: self at: 2 @ 7.
	SKTrunk newInGrid: self at: 1 @ 7.
	
	SKTrunk newInGrid: self at: 1 @ 6.
	SKTrunk newInGrid: self at: 1 @ 5.
	SKTrunk newInGrid: self at: 1 @ 4.
	SKTrunk newInGrid: self at: 1 @ 3.
	
	SKTrunk newInGrid: self at: 2 @ 3.
	SKTrunk newInGrid: self at: 3 @ 3.
	SKTrunk newInGrid: self at: 4 @ 3.
	SKTrunk newInGrid: self at: 5 @ 3.
	
	SKTrunk newInGrid: self at: 5 @ 3.
	SKTrunk newInGrid: self at: 5 @ 4.
	SKTrunk newInGrid: self at: 5 @ 5.
	
	SKTrunk newInGrid: self at: 4 @ 5.
	SKTrunk newInGrid: self at: 3 @ 5.
	
	SKCloverleaf newInGrid: self at: 4 @ 4.
	^ SKKara newInGrid: self at: 1 @ 2
	
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'LM 4/28/2026 20:15'
}
SKGrid >> challenge2 [
	
	SKTrunk newInGrid: self at: 3 @ 2.
	SKTrunk newInGrid: self at: 5 @ 2.
	SKTrunk newInGrid: self at: 7 @ 2.
	
	SKCloverleaf newInGrid: self at: 9 @ 2.
	
	^ SKKara newInGrid: self at: 1 @ 2
	
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'LM 4/28/2026 20:15'
}
SKGrid >> challenge3 [
	
	SKTrunk newInGrid: self at: 2 @ 1.
	SKTrunk newInGrid: self at: 3 @ 1.
	SKTrunk newInGrid: self at: 4 @ 1.
	SKTrunk newInGrid: self at: 5 @ 1.
	SKTrunk newInGrid: self at: 6 @ 1.
	
	SKTrunk newInGrid: self at: 4 @ 3.
	SKTrunk newInGrid: self at: 5 @ 3.
	SKTrunk newInGrid: self at: 6 @ 3.
	SKTrunk newInGrid: self at: 7 @ 3.
	SKTrunk newInGrid: self at: 8 @ 3.
	SKTrunk newInGrid: self at: 9 @ 3.
	
	^ SKKara newInGrid: self at: 1 @ 2
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'mr 4/29/2026 13:34'
}
SKGrid >> challenge4 [
	^ {
		SKKara newInGrid: self at: 1 @ 1 .
		SKKara newInGrid: self at: 2 @ 2 .
	} asOrderedCollection
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
	#'squeak_changestamp' : 'LM 4/29/2026 18:51'
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
	#'squeak_changestamp' : 'LM 4/29/2026 18:51'
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
	#'squeak_changestamp' : 'LM 4/28/2026 20:37'
}
SKGrid >> redrawTexture [

	self gridLines do: [:gridLine | self removeMorph: gridLine ].
	self submorphsDo: [:submorph | submorph scaleFactor: (self scaleFactor)].
	
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
