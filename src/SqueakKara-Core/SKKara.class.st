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
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/7/2026 18:32'
}
SKKara >> color: aColor [
	
	(aColor isSimilarColorTo: (Color black)) not ifTrue: [
		super color: aColor.
		self setColor
	]
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/7/2026 18:08'
}
SKKara >> defaultColor [

	^ Color red
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/7/2026 18:13'
}
SKKara >> fillStyle: aFillStyle [
		
		(aFillStyle isSimilarColorTo: (Color black)) not ifTrue: [
			super fillStyle: aFillStyle.
			self setColor
		]
]

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
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/29/2026 13:07'
}
SKKara >> isKara [

	^ true
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LM 4/28/2026 18:58'
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
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/7/2026 18:08'
}
SKKara >> previousColor [

	^ previousColor ifNil: self defaultColor
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/7/2026 18:09'
}
SKKara >> previousColor: aColor [

	previousColor := aColor
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/7/2026 18:23'
}
SKKara >> scaleFactor: aNumber [
	
	super scaleFactor: aNumber.
	self previousColor: self defaultColor.
	self setColor
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/7/2026 18:20'
}
SKKara >> setColor [

	self setColorFor: self image
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/7/2026 18:13'
}
SKKara >> setColorFor: aForm [
	
	| target replacement |

	target := self previousColor.
	replacement := self color.
	1 to: aForm width do: [:x |
	  1 to: aForm height do: [:y |
		(((aForm colorAt: x @ y) isSimilarColorTo: target) 
			or: [(aForm colorAt: x @ y) = (self defaultColor)])
				ifTrue: [
	      			aForm colorAt: x @ y put: replacement ].
	  			]].
	
	self previousColor: self color.
	self image: aForm
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/7/2026 18:09'
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
	#'squeak_changestamp' : 'jt 6/11/2024 19:58'
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
	#'squeak_changestamp' : 'EB 7/11/2024 15:18'
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
