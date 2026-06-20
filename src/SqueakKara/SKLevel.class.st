Class {
	#name : #SKLevel,
	#superclass : #Object,
	#instVars : [
		'grid',
		'environment'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #building,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 11:27'
}
SKLevel >> build [

    self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 10:05'
}
SKLevel >> environment [

	^ environment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 10:05'
}
SKLevel >> environment: anEnvironment [

	environment := anEnvironment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 10:05'
}
SKLevel >> grid [

	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 10:05'
}
SKLevel >> grid: aGrid [

	grid := aGrid
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 15:10'
}
SKLevel >> height [

	self subclassResponsibility
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 15:26'
}
SKLevel >> initializeWithEnvironment: anEnvironment [

	super initialize.
	self environment: anEnvironment;
		grid: (SKGrid newWithExtent: self width @ self height).
	anEnvironment grid: self grid.
	self build.
	self grid enforceZOrder.
	anEnvironment initializeObjects.
	anEnvironment executeControls currentChallenge: self levelName
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 15:10'
}
SKLevel >> levelName [

	self subclassResponsibility
]

{
	#category : #placing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 11:25'
}
SKLevel >> placeCloverleafAt: aPoint [

	SKCloverleaf newInGrid: self grid at: aPoint
	
]

{
	#category : #placing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 11:25'
}
SKLevel >> placeKaraAt: aPoint [

	self environment addKara: (SKKara newInGrid: self grid at: aPoint)
	
]

{
	#category : #placing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 11:25'
}
SKLevel >> placeMushroomAt: aPoint [

	SKMushroom newInGrid: self grid at: aPoint
	
]

{
	#category : #placing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 11:25'
}
SKLevel >> placeTrunkAt: aPoint [

	SKTrunk newInGrid: self grid at: aPoint
	
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 15:09'
}
SKLevel >> width [

	self subclassResponsibility
]
