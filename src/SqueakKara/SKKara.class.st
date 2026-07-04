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
	#'squeak_changestamp' : 'SLH 7/4/2026 16:04'
}
SKKara >> addCloseButtonTo: aBubble [

	| closeButton |

	(aBubble submorphs anySatisfy: [:each | each isKindOf: SimpleButtonMorph])
		ifTrue: [^ self].

	closeButton := SimpleButtonMorph new
		label: 'x';
		target: aBubble;
		actionSelector: #delete;
		color: SKStylesheet secondaryColor;
		borderWidth: 0;
		yourself.
	aBubble addMorph: closeButton.
	closeButton position: aBubble topRight - (closeButton width @ 0)
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'SLH 7/4/2026 16:04'
}
SKKara >> attachBubbleToWindow: aBubble [

	| window |

	window := self ownerThatIsA: SystemWindow.
	window ifNil: [^ aBubble comeToFront].
	window addMorphFront: aBubble
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 14:30'
}
SKKara >> blockMovement [

	self movementBlocked: true
]

{
	#category : #movement,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:00'
}
SKKara >> celebrateCloverleaf [

	SKConfetti explodeAt: self center
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/21/2026 10:57'
}
SKKara >> color: aColor [
	
	(aColor notBlack) ifTrue: [
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
	#'squeak_changestamp' : 'LD 5/21/2026 10:57'
}
SKKara >> fillStyle: aFillStyle [
		
		(aFillStyle notBlack) ifTrue: [
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
	#category : #movement,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 17:07'
}
SKKara >> isWalkable [

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
	#category : #appearance,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/1/2026 10:22'
}
SKKara >> karaSay: aString [

	self say: aString.
	(self world submorphs select: [:each | each isKindOf: SpeechBubbleMorph])
		do: [:bubble |
			self lockTextIn: bubble.
			self addCloseButtonTo: bubble.
			self attachBubbleToWindow: bubble]
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/1/2026 10:31'
}
SKKara >> lockTextIn: aBubble [

	aBubble allMorphsDo: [:each |
		(each isKindOf: TextMorph) ifTrue: [each lock]]
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 16:18'
}
SKKara >> move [

	| wasOnClover |
	self movementBlocked ifTrue: [^ self].
	self walkableAhead ifFalse: [
		self
			blockMovement;
			karaSay: 'I should not walk into things. There might also be a bug in the code!'.
		^ self].
	wasOnClover := self onCloverleaf.
	self coordinates: self coordinates + self viewDirection.
	(wasOnClover not and: [self onCloverleaf]) ifTrue: [self celebrateCloverleaf]
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 16:23'
}
SKKara >> moveAfterPushing [

	self mushroomAhead ifTrue: [
		self
			blockMovement;
			karaSay: 'I should not push stuff into things!'.
		^ self].
	self move
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 5/23/2026 18:26'
}
SKKara >> movementBlocked [

	movementBlocked ifNil: [self movementBlocked: false].
	^ movementBlocked

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 5/23/2026 18:27'
}
SKKara >> movementBlocked: aBoolean [

	movementBlocked := aBoolean

]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 16:23'
}
SKKara >> mushroomAhead [

	| target tileAhead |
	
	target := self coordinates + self viewDirection.
	tileAhead := self gridCoordinator getTileAtCoordinates: target.

	^ tileAhead anySatisfy: [ :each | each isMushroom ]
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
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 16:23'
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
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 16:25'
}
SKKara >> push [

	self movementBlocked ifTrue: [^ self].
	self mushroomAhead ifFalse: [
		self
			blockMovement;
			karaSay: 'I can not push that'.
		^ self].
	self pushMushroomAhead.
	self moveAfterPushing
]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 16:18'
}
SKKara >> pushMushroomAhead [

	| target tileAhead |
	
	target := self coordinates + self viewDirection.
	tileAhead := self gridCoordinator getTileAtCoordinates: target.
	
	tileAhead do: [:each | each isMushroom ifTrue: [each move: self viewDirection]]
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
	#'squeak_changestamp' : 'JS 7/4/2026 20:29'
}
SKKara >> trunkAhead [

	| target tileAhead |
	
	target := self coordinates + self viewDirection.
	tileAhead := self gridCoordinator getTileAtCoordinates: target.

	^ tileAhead anySatisfy: [ :each | each isTrunk ]
]

{
	#category : #turning,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 13:28'
}
SKKara >> turn: aRotation [

	self movementBlocked ifTrue: [^ self].
	self viewDirection: (SKDirection rotatePosition: self viewDirection by: aRotation).		
	self scaleToFactor
	
	

	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JS 7/4/2026 20:29'
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
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:53'
}
SKKara >> viewDirection [
	
	^ viewDirection ifNil: [ self viewDirection: SKDirection right ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:53'
}
SKKara >> viewDirection: aDirection [
	
	^ viewDirection := aDirection
]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'Gustav Meinshausen 6/10/2026 17:02'
}
SKKara >> walkableAhead [

	^ self walkableIn: self viewDirection.
]
