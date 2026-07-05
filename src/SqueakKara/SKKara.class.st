"
SKKara provides methods to move an turn kara within the grid.

Instance Variables
	viewDirection:		<SKDirektion>
	workspace:		<SKWorkspace>
	cloverleaf:			<SKCloverleaf>
	speechBubbles:	<Collection>

viewDirection
	- The current direktion Kara is facing.
	
workspace
	- The workspace for this Kara.

cloverleaf
	- The cloverleaf for this Kara.

speechBubbles
	- A collection of the speechBubbles of this Kara.
"
Class {
	#name : #SKKara,
	#superclass : #SKGridObject,
	#instVars : [
		'viewDirection',
		'workspace',
		'cloverleaf',
		'speechBubbles'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JanWein 7/5/2026 13:44'
}

{
	#category : #colors,
	#'squeak_changestamp' : 'ND 5/21/2026 22:05'
}
SKKara class >> defaultColors [
	
	^ { Color red. Color green. Color blue. Color magenta } asOrderedCollection
]

{
	#category : #colors,
	#'squeak_changestamp' : 'jawi 5/28/2026 16:55'
}
SKKara class >> newInGrid: aGrid at: aPoint [

	^ super newInGrid: aGrid at: aPoint with: aGrid gridCoordinator findFreeFields atRandom
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LM 6/25/2026 22:01'
}
SKKara >> canMoveAhead [

	| neighboursNext movementDirection |

	(self trunkAhead) ifTrue: [ ^ false ].
	
	movementDirection := self viewDirection.
	neighboursNext := self neighboursAt: movementDirection.
	(self hasBlockingDirectionalTileIn: neighboursNext direction: movementDirection) 
		ifTrue: [ ^ false ].
		
	 ^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 5/28/2026 15:01'
}
SKKara >> cloverleaf [
	
	^ cloverleaf
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jawi 5/28/2026 15:01'
}
SKKara >> cloverleaf: aCloverleaf [
	
	cloverleaf := aCloverleaf
]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'JanWein 7/4/2026 19:31'
}
SKKara >> collectCloverleaf [
	
	| cloverleaf |
	cloverleaf := (self neighboursHere) 
		detect: [ :neighbor | neighbor isCloverleaf ] 
		ifNone: [ nil ].
	
	cloverleaf ifNil: [
		self errorNoCloverleaf.
		^ self ].
	
	(cloverleaf color = self color)
		ifFalse: [ self errorWrongCloverleaf ]
		ifTrue: [ cloverleaf delete ].
	
	self grid checkWinCondition
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mr 7/4/2026 11:24'
}
SKKara >> color: aColor [

		super color: aColor.
		self cloverleaf color: aColor.
		self scaleToFactor.

	self hasWorkspace ifTrue: [ self workspace color: self color ]
]

{
	#category : #movement,
	#'squeak_changestamp' : 'jawi 5/28/2026 15:11'
}
SKKara >> createCloverleaf: aPoint [
	
	self cloverleaf: (SKCloverleaf newInGrid: self grid at: aPoint)
]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'LM 6/8/2026 17:53'
}
SKKara >> criticalSectionAhead [

	| target tileAhead |
	
	target := self coordinates + self viewDirection.
	tileAhead := self gridCoordinator getTileAtCoordinates: target.
	
	^ tileAhead anySatisfy: [ :each | each isCriticalSection ]
]

{
	#category : #movement,
	#'squeak_changestamp' : 'AB 5/21/2026 18:22'
}
SKKara >> defaultColor [

	^ Color red
]

{
	#category : #'submorphs - add/remove',
	#'squeak_changestamp' : 'mr 7/4/2026 11:24'
}
SKKara >> delete [

	self hasWorkspace ifTrue: [ self workspace superClose ].
	self superDelete
]

{
	#category : #movement,
	#'squeak_changestamp' : 'ND 5/21/2026 18:49'
}
SKKara >> environment [
	
	^ self grid environment
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'JanWein 7/4/2026 19:32'
}
SKKara >> errorNoCloverleaf [

	self sayMessage: 'Hier ist kein Kleeblatt!'
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'JanWein 7/4/2026 19:32'
}
SKKara >> errorOutOfBounce [

	self sayMessage: 'Aua! Da darf ich nicht hinlaufen D:'.
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'JanWein 7/4/2026 19:32'
}
SKKara >> errorScheduler [

	self sayMessage: 'Hey, hier darf ich gerade nicht hin!'.
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'JanWein 7/4/2026 19:32'
}
SKKara >> errorTrunk [

	self sayMessage: 'Aua! Ich bin gegen einen Baumstumpf gelaufen D:'.
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'JanWein 7/4/2026 19:33'
}
SKKara >> errorWrongCloverleaf [

	self sayMessage: 'Ich kann nur mein eigenes Kleeblatt einsammeln.'
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/29/2026 08:36'
}
SKKara >> fillStyle: aFillStyle [

	self color: aFillStyle.
	self scaleToFactor
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LM 7/4/2026 11:49'
}
SKKara >> findUnusedColor [
	
	| colorList karaList |
	
	colorList := SKKara defaultColors.
	karaList := self environment karas.
	
	karaList do: [ :kara | colorList remove: kara color ifAbsent: []].
	colorList isEmpty ifFalse: [ ^ colorList first ].
	
	^ Color black
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JanWein 7/4/2026 19:33'
}
SKKara >> hasBlockingDirectionalTileIn: aNeighborCollection direction: aDirection [
	
	| directionalTiles |
	
	directionalTiles := (aNeighborCollection 
		select: [ :neighbor | neighbor isDirectionalTile ]).
	
	directionalTiles isEmpty ifTrue: [ ^ false ].
		
	^ (directionalTiles anySatisfy: [ :directionalTile | directionalTile matchesDirection: aDirection ]) not
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:24'
}
SKKara >> hasWorkspace [

	^ self workspace isNil not
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 7/4/2026 13:58'
}
SKKara >> initializeInGrid: aGrid at: aPoint [

	self speechBubbles: OrderedCollection new.
	aGrid gridCoordinator lockAt: aPoint for: self.
	super initializeInGrid: aGrid at: aPoint
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LM 5/28/2026 19:39'
}
SKKara >> initializeInGrid: aGrid at: aKaraPoint with: aCloverleafPoint [

	self initializeInGrid: aGrid at: aKaraPoint.
	self createCloverleaf: aCloverleafPoint
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
	#'squeak_changestamp' : 'jawi 5/28/2026 15:28'
}
SKKara >> karaAhead [

	| target tileAhead |
	
	target := self coordinates + self viewDirection.
	tileAhead := self gridCoordinator getTileAtCoordinates: target.

	^ tileAhead anySatisfy: [ :each | each isKara ]
]

{
	#category : #locking,
	#'squeak_changestamp' : 'ND 7/4/2026 14:56'
}
SKKara >> lockAt: aPoint [

	| lockSuccessful staysInCriticalSection |
	
	(self ownsLockAt: aPoint) ifTrue: [ ^ self ].
	
	(self karaAhead) ifTrue: [ ^ self ].
	(self canMoveAhead) ifFalse: [ ^ self ].
	
	lockSuccessful := (self gridCoordinator lockAt: aPoint for: self).
	staysInCriticalSection := self onCriticalSection and: [ self criticalSectionAhead ].
	
	(lockSuccessful and: [ staysInCriticalSection not ]) ifTrue: [
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
	#'squeak_changestamp' : 'LM 7/5/2026 17:21'
}
SKKara >> move [
	
	self stopSayingOrThinking.
	(self trunkAhead) ifTrue: [ self errorTrunk. ^ false ].
	(self canMoveAhead) ifFalse: [ self errorOutOfBounce. ^ false ].
	(self moveToCoordinates: self coordinates + self viewDirection)
		ifTrue: [ ^ true ]
		ifFalse: [ self errorOutOfBounce. ^ false ]
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
	#'squeak_changestamp' : 'LM 6/9/2026 18:47'
}
SKKara >> onCloverleaf [

	^ self neighboursHere anySatisfy: [ :each | each isCloverleaf ]
]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'LM 6/9/2026 18:48'
}
SKKara >> onCriticalSection [

	^ self neighboursHere anySatisfy: [ :each | each isCriticalSection ]
]

{
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/26/2026 09:48'
}
SKKara >> ownsLockAt: aPoint [

	^ self gridCoordinator isLocked: aPoint for: self
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'LM 6/9/2026 18:50'
}
SKKara >> position: aPoint [

	| newCoordinates tile |
	newCoordinates := self coordinatesFromPosition: aPoint.
	tile := self gridCoordinator getTileAtCoordinates: newCoordinates.
	
	(tile anySatisfy: [ :each | each isTrunk ]) ifTrue: [ ^ self ].
	(self gridCoordinator isLocked: newCoordinates for: self) ifTrue: [ ^ self ].

	self gridCoordinator
		unlockAt: self coordinates;
		lockAt: newCoordinates for: self.
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
	#'squeak_changestamp' : 'LD 7/5/2026 14:46'
}
SKKara >> sayMessage: aString [

	| speechBubble |

	speechBubble := SKDismissableSpeechBubbleMorph string: aString type: #speech for: self.
	self speechBubbles add: speechBubble.
	speechBubble closeCallback: [ self speechBubbles remove: speechBubble ].
	self environment stop
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 6/26/2026 10:45'
}
SKKara >> scaleToFactor [

	| modifiedImage |
	
	super scaleToFactor.
	self updateColor.
	
	modifiedImage := self rotateTowards: self viewDirection.
	self image: modifiedImage
]

{
	#category : #movement,
	#'squeak_changestamp' : 'LD 6/26/2026 10:45'
}
SKKara >> setTexture [

	| aTextureLoader aForm |
	
	aTextureLoader := SKTextureLoader new.
	
	aForm := aTextureLoader
		getTexture: self textureFilename
		scaledToWidth: self grid pixelPerBlock.
	
	self image: aForm.
	self rotateTowards: self viewDirection.
	self originalImage: aForm.
	self updateColorFor: aForm
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 7/4/2026 13:57'
}
SKKara >> speechBubbles [

	^ speechBubbles
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 7/4/2026 13:57'
}
SKKara >> speechBubbles: aCollection [

	speechBubbles := aCollection
]

{
	#category : #'submorphs - add/remove',
	#'squeak_changestamp' : 'LM 6/9/2026 18:26'
}
SKKara >> superDelete [

	super delete.
	self cloverleaf delete.
	self unlockAt: self coordinates
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
	#'squeak_changestamp' : 'jawi 5/28/2026 15:28'
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

{
	#category : #appearance,
	#'squeak_changestamp' : 'LM 6/9/2026 18:55'
}
SKKara >> zLayer [

	^ 3
]
