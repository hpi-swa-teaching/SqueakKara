Class {
	#name : #SKKara,
	#superclass : #SKGridObject,
	#instVars : [
		'viewDirection'
	],
	#category : #SqueakKara
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jt 6/11/2024 12:44'
}
SKKara >> convertAngleToDirection: angle [

	| AngleToDirection |
	
	AngleToDirection := Dictionary newFrom: {
		0 -> SKDirection above.
	      90 -> SKDirection right.
		180 -> SKDirection below.
		270 -> SKDirection left.}.
	
	^ AngleToDirection at: angle
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jt 6/11/2024 13:22'
}
SKKara >> convertDirectionToAngle: direction [

	| DirectionToAngle |
	
	DirectionToAngle := Dictionary newFrom: {
		SKDirection above -> 0.
	      SKDirection right -> 90.
		SKDirection below -> 180.
		SKDirection left -> 270.}.
	
	^ DirectionToAngle at: direction
]

{
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jt 6/11/2024 13:26'
}
SKKara >> move [
	
	(self trunkAhead)
		ifFalse: [self coordinates: self coordinates + self viewDirection]
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jt 6/11/2024 13:21'
}
SKKara >> onCloverleaf [

	^ self neighboursHere anySatisfy: [:each | each isCloverleaf]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jt 6/11/2024 19:58'
}
SKKara >> textureFilename [

	^ self getTextureForDirection
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jt 6/11/2024 13:20'
}
SKKara >> trunkAhead [

	| tileAhead |
	
	tileAhead := self neighboursAt: self viewDirection.
	^ tileAhead anySatisfy: [:each | each isTrunk]
		
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jt 6/11/2024 20:54'
}
SKKara >> turn: aDirection [
	
	| angle |

	angle := self convertDirectionToAngle: self viewDirection.
	
	aDirection = 'left'
		ifTrue: [angle := (angle - 90) \\\ 360]
		ifFalse:
			[aDirection = 'right'
				ifTrue: [angle := (angle + 90) \\\ 360]].
				"Fehlerbehandlung für falsche Eingabe"
												
	self viewDirection:	 (self convertAngleToDirection: angle).		
	self setTexture

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jt 6/11/2024 11:41'
}
SKKara >> viewDirection [
	
	^ viewDirection ifNil: [viewDirection:= SKDirection right]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jt 6/11/2024 11:29'
}
SKKara >> viewDirection: aDirection [
	
	viewDirection := aDirection
]
