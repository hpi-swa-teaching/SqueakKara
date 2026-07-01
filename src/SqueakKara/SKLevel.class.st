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
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 19:02'
}
SKLevel class >> levelName [

	self subclassResponsibility
]

{
	#category : #commands,
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
	#'squeak_changestamp' : 'JS 6/22/2026 13:23'
}
SKLevel >> initializeWithEnvironment: anEnvironment [

	super initialize.
	self environment: anEnvironment;
		grid: (SKGrid newWithExtent: self width @ self height).
	anEnvironment grid: self grid.
	self build.
	self grid enforceZOrder.
	anEnvironment initializeObjects
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
	#'squeak_changestamp' : 'JS 6/23/2026 18:53'
}
SKLevel >> placeKaraAt: aPoint withViewDirection: aDirection [
	
	| kara |
	
	kara := SKKara newInGrid: self grid at: aPoint.
	kara viewDirection: aDirection.
	self environment addKara: kara
	
	
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
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/22/2026 13:07'
}
SKLevel >> reset [

    self subclassResponsibility
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 15:09'
}
SKLevel >> width [

	self subclassResponsibility
]
