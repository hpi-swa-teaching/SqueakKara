"
SKKara provides methods to move an turn kara within the grid.
"
Class {
	#name : #SKKara,
	#superclass : #SKGridObject,
	#instVars : [
		'viewDirection',
		'movementBlocked'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:56'
}

{
	#category : #appearance,
	#'squeak_changestamp' : 'jt 6/11/2024 19:59'
}
SKKara >> getTextureForDirection [

	self viewDirection caseOf: {
		[SKDirection above] -> [^ 'Kara-FacingUp.png' ].
		[SKDirection right] -> [^ 'Kara-FacingRight.png'].
		[SKDirection below] -> [^ 'Kara-FacingDown.png'].
		[SKDirection left] -> [^ 'Kara-FacingLeft.png']
	}
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Gustav Meinshausen 5/12/2026 21:23'
}
SKKara >> move [
	
	(self walkableAhead and: self movementBlocked not)
		ifTrue: [self coordinates: self coordinates + self viewDirection]
		ifFalse: [self movementBlocked: true.
			self say: 'ouch, there might be a bug somewhere']

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 5/12/2026 21:13'
}
SKKara >> movementBlocked [
	movementBlocked ifNil: [self movementBlocked: false].
	^ movementBlocked
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 5/12/2026 20:49'
}
SKKara >> movementBlocked: anObject [
	movementBlocked := anObject
]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'jt 6/11/2024 13:21'
}
SKKara >> onCloverleaf [

	^ self neighboursHere anySatisfy: [:each | each isCloverleaf]
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'jt 6/11/2024 19:58'
}
SKKara >> textureFilename [

	^ self getTextureForDirection
]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'jt 6/11/2024 13:20'
}
SKKara >> trunkAhead [

	| tileAhead |
	
	tileAhead := self neighboursAt: self viewDirection.
	^ tileAhead anySatisfy: [:each | each isTrunk]
		
	
]

{
	#category : #turning,
	#'squeak_changestamp' : 'Gustav Meinshausen 5/12/2026 20:39'
}
SKKara >> turn: aRotation [
												
	self viewDirection: (SKDirection rotatePosition: self viewDirection by: aRotation).		
	self setTexture

	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'jt 6/11/2024 11:41'
}
SKKara >> viewDirection [
	
	^ viewDirection ifNil: [viewDirection:= SKDirection right]
]

{
	#category : #movement,
	#'squeak_changestamp' : 'jt 6/11/2024 11:29'
}
SKKara >> viewDirection: aDirection [
	
	viewDirection := aDirection
]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'Gustav Meinshausen 5/12/2026 20:44'
}
SKKara >> walkableAhead [

	| tileAheadInGrid |
	
	tileAheadInGrid := self grid isPointInGridDimensions: self viewDirection + self coordinates.
	
	^ self trunkAhead not  and: tileAheadInGrid.
		
	
]
