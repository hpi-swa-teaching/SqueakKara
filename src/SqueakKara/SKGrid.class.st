Class {
	#name : #SKGrid,
	#superclass : #Morph,
	#instVars : [
		'gridWidth',
		'gridHeight',
		'gridCoordinator',
		'executer'
	],
	#category : #SqueakKara
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'LK 5/22/2024 16:24'
}
SKGrid class >> newWithExtent: aPoint [

	^ SKGrid basicNew initializeWithExtent: aPoint
]

{
	#category : #layout,
	#'squeak_changestamp' : 'KD 6/10/2024 08:46'
}
SKGrid >> executer [
	^executer
]

{
	#category : #layout,
	#'squeak_changestamp' : 'KD 6/10/2024 08:46'
}
SKGrid >> executer: anExecuter [
	executer := anExecuter.
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
	#'squeak_changestamp' : 'LK 5/22/2024 16:30'
}
SKGrid >> initializeWithExtent: aPoint [

	self initialize.
	self gridWidth: aPoint x;
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
	#'squeak_changestamp' : 'LK 5/22/2024 16:39'
}
SKGrid >> pixelPerBlock [

	^ 32
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LK 5/22/2024 16:35'
}
SKGrid >> updateDimensions [

	self width: self pixelPerBlock * self gridWidth;
		height: self pixelPerBlock * self gridHeight
]
