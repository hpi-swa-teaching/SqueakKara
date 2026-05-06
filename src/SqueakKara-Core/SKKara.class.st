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
	#category : #movement,
	#'squeak_changestamp' : 'LD 5/6/2026 11:01'
}
SKKara >> move [
	(self trunkAhead)
		ifFalse: [self coordinates: self coordinates + self viewDirection]
	

]

{
	#category : #'object detection',
	#'squeak_changestamp' : 'jt 6/11/2024 13:21'
}
SKKara >> onCloverleaf [

	^ self neighboursHere anySatisfy: [:each | each isCloverleaf]
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
	#'squeak_changestamp' : 'jt 6/11/2024 13:20'
}
SKKara >> trunkAhead [

	| tileAhead |
	
	tileAhead := self neighboursAt: self viewDirection.
	^ tileAhead anySatisfy: [:each | each isTrunk]
		
	
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
