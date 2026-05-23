"
SKKara provides methods to move an turn kara within the grid.
"
Class {
	#name : #SKKara,
	#superclass : #SKGridObject,
	#instVars : [
		'viewDirection',
		'workspace'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:56'
}

{
	#category : #movement,
	#'squeak_changestamp' : 'LM 5/23/2026 13:46'
}
SKKara >> color: aColor [
	
	(aColor notBlack) ifTrue: [
		super color: aColor.
		self scaleToFactor ].
	self workspace color: self color
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
	#'squeak_changestamp' : 'AB 5/21/2026 18:22'
}
SKKara >> defaultColor [

	^ Color red
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LM 5/23/2026 13:46'
}
SKKara >> fillStyle: aFillStyle [

	self color: aFillStyle
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/29/2026 13:07'
}
SKKara >> isKara [

	^ true
]

{
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/23/2026 13:50'
}
SKKara >> isLocked: aPoint [

	^ self gridCoordinator isLocked: aPoint for: self
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
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/23/2026 14:01'
}
SKKara >> lockAt: aPoint [

	(self isLocked: aPoint) ifTrue: [ ^ self ].
	(self gridCoordinator lockAt: aPoint for: self) ifTrue: [
		self unlockAt: self coordinates ]
]

{
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/23/2026 13:51'
}
SKKara >> lockNextField [

	self lockAt: self nextField
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
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/23/2026 13:51'
}
SKKara >> nextField [

	^ self coordinates + self viewDirection
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
	#'squeak_changestamp' : 'LM 5/22/2026 11:50'
}
SKKara >> position: aPoint [

	| coordinates tile |
	coordinates := self coordinatesFromPosition: aPoint.
	tile := self gridCoordinator getTileAtCoordinates: coordinates.
	
	(tile anySatisfy: [ :each | each isTrunk or: [ each isKara ] ]) ifTrue: [^ self ].

	self gridCoordinator
		unlockAt: self coordinates;
		lockAt: coordinates for: self.
	super position: aPoint
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JanWein 5/21/2026 13:24'
}
SKKara >> randomDirection [
	
	| directions |
	
	directions := {SKDirection right. SKDirection left. SKDirection above. SKDirection below}.
	self viewDirection: directions atRandom.
	self scaleToFactor
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/21/2026 12:08'
}
SKKara >> rotate [
	
	| centerWidth centerHeight image |
	
	centerWidth := self image width / 2.
	centerHeight := self image height / 2.
	image := self originalImage.
	self viewDirection caseOf: {
		[SKDirection right] -> [image := self image rotateBy: #right centerAt: centerWidth @ centerHeight].
		[SKDirection below] -> [image := self image rotateBy: #pi centerAt: centerWidth @ centerHeight].
		[SKDirection left] -> [image := self image rotateBy: #left centerAt: centerWidth @ centerHeight].
		[SKDirection above] -> [image := self image rotateBy: #none centerAt: centerWidth @ centerHeight].
	}.
	
	^ image
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/21/2026 12:08'
}
SKKara >> scaleToFactor [

	| image |
	
	super scaleToFactor.
	self updateColor.
	
	image := self rotate.
	self image: image
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
	#'squeak_changestamp' : 'LD 5/21/2026 11:01'
}
SKKara >> turn: aRotation [
								
	self viewDirection: (SKDirection rotatePosition: self viewDirection by: aRotation).		
	self scaleToFactor
	
	

	
]

{
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/23/2026 13:49'
}
SKKara >> unlockAt: aPoint [

	self gridCoordinator unlockAt: aPoint
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/23/2026 13:42'
}
SKKara >> workspace [

	^ workspace
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/23/2026 13:42'
}
SKKara >> workspace: aWorkspace [

	workspace := aWorkspace
]
