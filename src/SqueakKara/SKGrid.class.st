Class {
	#name : #SKGrid,
	#superclass : #Morph,
	#instVars : [
		'gridWidth',
		'gridHeight',
		'gridCoordinator',
		'scaleFactor'
	],
	#category : #SqueakKara
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
	#'squeak_changestamp' : 'LK 5/22/2024 16:34'
}
SKGrid >> gridHeight: aNumber [
	
	gridHeight := aNumber.
	self updateDimensions
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
	#'squeak_changestamp' : 'LK 5/22/2024 16:33'
}
SKGrid >> gridWidth: aNumber [
	
	gridWidth := aNumber.
	self updateDimensions
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'KD 6/10/2024 08:43'
}
SKGrid >> initialize [

	super initialize.
	self openInWorld;
		color: Color lightGreen lighter.
	executer := SKExecuter new.
	

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JJG 6/5/2024 17:31'
}
SKGrid >> initializeWithExtent: aPoint andScale: aFloat [

	self initialize.
	self scaleFactor: aFloat; 
		gridWidth: aPoint x;
		gridHeight: aPoint y
	
	
	

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
	#category : #layout,
	#'squeak_changestamp' : 'JJG 6/5/2024 16:42'
}
SKGrid >> pixelPerBlock [

	^ SKGridObject textureDimension px * self scaleFactor
]

{
	#category : #layout,
	#'squeak_changestamp' : 'JJG 6/5/2024 17:29'
}
SKGrid >> scaleFactor [

	^ scaleFactor
]

{
	#category : #layout,
	#'squeak_changestamp' : 'JJG 6/5/2024 16:48'
}
SKGrid >> scaleFactor: aNumber [
	
	scaleFactor := aNumber
	
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 5/22/2024 16:35'
}
SKGrid >> updateDimensions [

	self width: self pixelPerBlock * self gridWidth;
		height: self pixelPerBlock * self gridHeight
]
