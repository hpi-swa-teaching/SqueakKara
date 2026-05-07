"
SKKara provides methods to move an turn kara within the grid.
"
Class {
	#name : #SKKara,
	#superclass : #SKGridObject,
	#instVars : [
		'viewDirection',
		'previousColor'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:56'
}

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/6/2026 21:56'
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
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/29/2026 13:07'
}
SKKara >> isKara [

	^ true
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/7/2026 09:44'
}
SKKara >> move [

	(self trunkAhead) ifFalse: [
		self moveToCoordinates: self coordinates + self viewDirection ]
	
]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'jt 6/11/2024 13:21'
}
SKKara >> onCloverleaf [

	^ self neighboursHere anySatisfy: [:each | each isCloverleaf]
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'LM 4/29/2026 12:58'
}
SKKara >> position: aPoint [

	| coordinates tile |
	coordinates := self coordinatesFromPosition: aPoint.
	tile := self gridCoordinator getTileAtCoordinates: coordinates.
	
	(tile anySatisfy: [ :each | each isTrunk ]) ifTrue: [^ self ].

	super position: aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 5/6/2026 22:26'
}
SKKara >> previousColor [
	^ previousColor ifNil: Color red
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 5/6/2026 22:27'
}
SKKara >> previousColor: aColor [
	previousColor := aColor.
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/6/2026 22:47'
}
SKKara >> setColor: aForm [
	
	|target replacement |

	target := self previousColor.
	replacement := self color.
	Transcript show: self color.
	Transcript show: self previousColor.
	1 to: aForm width do: [:x |
	  1 to: aForm height do: [:y |
		(aForm colorAt: x@y) = target ifTrue: [
	      aForm colorAt: x@y put: replacement
	    	].
		(aForm colorAt: x@y) = (Color red) ifTrue: [
		      aForm colorAt: x@y put: replacement
		].
	  ]].
	
	self previousColor: self color.
	self image: aForm
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/6/2026 22:47'
}
SKKara >> setTexture [

	| aTextureLoader aForm |
	
	aTextureLoader := SKTextureLoader new.
	
	aForm := aTextureLoader
		getTexture: self textureFilename
		scaledToWidth: self grid pixelPerBlock.

	self setColor: aForm
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/6/2026 11:46'
}
SKKara >> textureFilename [

	^ self getTextureForDirection.
]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'LM 4/28/2026 19:10'
}
SKKara >> trunkAhead [

	| target tileAhead |
	target := self coordinates + self viewDirection.
	tileAhead := self gridCoordinator getTileAtCoordinates: target.

	^ tileAhead anySatisfy: [ :each | each isTrunk ]
]

{
	#category : #turning,
	#'squeak_changestamp' : 'LD 5/6/2026 11:44'
}
SKKara >> turn: aRotation [
												
	self viewDirection:	 (SKDirection rotatePosition: self viewDirection by: aRotation).		
	self setTexture

	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LM 4/28/2026 20:53'
}
SKKara >> viewDirection [
	
	^ viewDirection ifNil: [ self viewDirection: SKDirection right ]
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LM 4/28/2026 20:53'
}
SKKara >> viewDirection: aDirection [
	
	^ viewDirection := aDirection
]
