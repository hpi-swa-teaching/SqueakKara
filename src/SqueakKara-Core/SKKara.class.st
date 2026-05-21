"
SKKara provides methods to move an turn kara within the grid.
"
Class {
	#name : #SKKara,
	#superclass : #SKGridObject,
	#instVars : [
		'viewDirection'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:56'
}

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/21/2026 09:51'
}
SKKara >> color: aColor [
	
	(aColor colorNotBlack) ifTrue: [
		super color: aColor.
		self scaleToFactor
	]
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/19/2026 13:27'
}
SKKara >> colorNotBlack: aColor [

	^ (aColor isSimilarColorTo: (Color black)) not
		
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
	#'squeak_changestamp' : 'LD 5/21/2026 09:51'
}
SKKara >> fillStyle: aFillStyle [
		
		(aFillStyle colorNotBlack) ifTrue: [
			super fillStyle: aFillStyle.
			self scaleToFactor
		]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/29/2026 13:07'
}
SKKara >> isKara [

	^ true
]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'LM 5/10/2026 20:18'
}
SKKara >> karaAhead [

	| target tileAhead |
	target := self coordinates + self viewDirection.
	tileAhead := self gridCoordinator getTileAtCoordinates: target.

	^ tileAhead anySatisfy: [ :each | each isKara ]
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LM 5/11/2026 22:18'
}
SKKara >> move [

	(self trunkAhead) ifTrue: [ ^ self ].
	self moveToCoordinates: self coordinates + self viewDirection
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
	#'squeak_changestamp' : 'LM 5/10/2026 20:21'
}
SKKara >> position: aPoint [

	| coordinates tile |
	coordinates := self coordinatesFromPosition: aPoint.
	tile := self gridCoordinator getTileAtCoordinates: coordinates.
	
	(tile anySatisfy: [ :each | each isTrunk or: [ each isKara ] ]) ifTrue: [^ self ].

	super position: aPoint
]

{
	#category : #movement,
	#'squeak_changestamp' : 'ND 5/20/2026 15:51'
}
SKKara >> rotate [
	
	| centerWidth centerHeight img|
	
	centerWidth := self image width / 2.
	centerHeight := self image height / 2.
	img := self originalImage.
	self viewDirection caseOf: {
		[SKDirection right] -> [img := self image rotateBy: #right centerAt: centerWidth @ centerHeight].
		[SKDirection below] -> [img := self image rotateBy: #pi centerAt: centerWidth @ centerHeight].
		[SKDirection left] -> [img := self image rotateBy: #left centerAt: centerWidth @ centerHeight].
		[SKDirection above] -> [img := self image rotateBy: #none centerAt: centerWidth @ centerHeight].
	}.
	
	^ img.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'ND 5/20/2026 15:51'
}
SKKara >> scaleToFactor [

	| img |
	
	super scaleToFactor.
	self updateColor.
	
	img := self rotate.
	self image: img.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'ND 5/20/2026 15:52'
}
SKKara >> setTexture [

	| aTextureLoader aForm |
	
	aTextureLoader := SKTextureLoader new.
	
	aForm := aTextureLoader
		getTexture: self textureFilename
		scaledToWidth: self grid pixelPerBlock.

	self image: aForm.
	self rotate.
	self originalImage: aForm.
	self updateColorFor: aForm
	

]

{
	#category : #appearance,
	#'squeak_changestamp' : 'ND 5/20/2026 15:46'
}
SKKara >> textureFilename [

	^ 'Kara-FacingUp.png'
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
	#'squeak_changestamp' : 'ND 5/20/2026 15:36'
}
SKKara >> turn: aRotation [
								
	self viewDirection:	 (SKDirection rotatePosition: self viewDirection by: aRotation).		
	self scaleToFactor.
	
	

	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'ND 5/20/2026 14:49'
}
SKKara >> updateColor [
	self updateColorFor: self image
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/21/2026 09:49'
}
SKKara >> updateColorFor: aForm [
	
	| replacement |
	
	replacement := self color.
	1 to: aForm width do: [:x |
	  1 to: aForm height do: [:y |
		((aForm colorAt: x @ y) = (self defaultColor))
				ifTrue: [
	      			aForm colorAt: x @ y put: replacement ].
	  			]].
	
	
	self image: aForm
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
