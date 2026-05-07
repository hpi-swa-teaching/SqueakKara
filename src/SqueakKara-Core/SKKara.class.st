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
	#'squeak_changestamp' : 'LD 5/7/2026 17:28'
}
SKKara >> color: aColor [

	super color: aColor.
	self setColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 5/7/2026 17:29'
}
SKKara >> defaultColor [

	^ Color red
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/7/2026 17:48'
}
SKKara >> fillStyle: aFillStyle [
		
		(self isSimilarColor: aFillStyle to: (Color black)) not ifTrue: [
			super fillStyle: aFillStyle.
			self setColor
		]
	
]

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
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/7/2026 17:28'
}
SKKara >> isSimilarColor: aColor to: anotherColor [

	^ (aColor red roundTo: 0.1) == (anotherColor red roundTo: 0.1) 
		and: (aColor green roundTo: 0.1) == (anotherColor green roundTo: 0.1) 
		and: (aColor blue roundTo: 0.1) == (anotherColor blue roundTo: 0.1) 
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/7/2026 17:28'
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
	#'squeak_changestamp' : 'LD 5/7/2026 17:29'
}
SKKara >> previousColor [

	^ previousColor ifNil: self defaultColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 5/7/2026 17:29'
}
SKKara >> previousColor: aColor [

	previousColor := aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 5/7/2026 17:29'
}
SKKara >> scaleFactor: aNumber [

	super scaleFactor: aNumber.
	self previousColor: self defaultColor.
	self setColor
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/7/2026 17:30'
}
SKKara >> setColor [

	self setColorFor: self image
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/7/2026 17:31'
}
SKKara >> setColorFor: aForm [
	
	| target replacement |

	target := self previousColor.
	replacement := self color.
	1 to: aForm width do: [:x |
	  1 to: aForm height do: [:y |
		((self isSimilarColor: (aForm colorAt: x @ y) to: target) 
			or: [(aForm colorAt: x @ y) = (self defaultColor)])
				ifTrue: [
	      			aForm colorAt: x @ y put: replacement ].
	  			]].
	
	self previousColor: self color.
	self image: aForm
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/7/2026 17:30'
}
SKKara >> setTexture [

	| aTextureLoader aForm |
	
	aTextureLoader := SKTextureLoader new.
	
	aForm := aTextureLoader
		getTexture: self textureFilename
		scaledToWidth: self grid pixelPerBlock.
	self originalImage: aForm.
	self setColorFor: aForm
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'LD 5/7/2026 17:30'
}
SKKara >> textureFilename [

	^ self getTextureForDirection
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
