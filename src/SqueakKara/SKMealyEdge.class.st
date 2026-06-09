Class {
	#name : #SKMealyEdge,
	#superclass : #Object,
	#instVars : [
		'line',
		'fromNode',
		'toNode',
		'controller',
		'popUpActive',
		'edgeMorph',
		'arrowhead'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/9/2026 13:48'
}
SKMealyEdge class >> newFrom: aNode to: anotherNode [

	| instance line |
	instance := self new.
	line := LineMorph from: aNode center to: anotherNode center color: (Color fromString: '#8caaee') width: 5.
	instance 
		line: line;
		fromNode: aNode;
		toNode: anotherNode;
		popUpActive: true.
	aNode controller playGround addMorph: line.
	
	^ instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 14:40'
}
SKMealyEdge >> arrowhead [
	(arrowhead = nil) ifTrue: [self arrowhead:  (PolygonMorph
		vertices: (self getArrowheadPoints)
		color: Color red borderWidth: 1 borderColor: Color black). ].
	^ arrowhead
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 14:09'
}
SKMealyEdge >> arrowhead: anObject [
	arrowhead := anObject
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'LP 6/3/2026 01:10'
}
SKMealyEdge >> arrowheadLength [
  
	^ 10
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'LP 6/3/2026 01:10'
}
SKMealyEdge >> arrowheadWidth [
  
	^ 10
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:53'
}
SKMealyEdge >> controller [

	^ controller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:53'
}
SKMealyEdge >> controller: aController [

	controller := aController
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'LP 6/9/2026 16:30'
}
SKMealyEdge >> delete [

	self arrowhead ifNotNil:[self arrowhead delete]. 
	self edgeMorph ifNotNil:  [self edgeMorph delete]. 
	self line ifNotNil: [self line delete]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 14:43'
}
SKMealyEdge >> edgeMorph [

	(edgeMorph = nil) ifTrue: [self edgeMorph: SKSelectionPopUpWrapper new. ].
	^ edgeMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/8/2026 20:40'
}
SKMealyEdge >> edgeMorph: anObject [
	edgeMorph := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:10'
}
SKMealyEdge >> fromNode [

	^ fromNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMealyEdge >> fromNode: aNode [
	
	fromNode := aNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/3/2026 01:17'
}
SKMealyEdge >> getArrowheadPoints [

	|fromPoint toPoint vectorBetweenBorders orthogonalVector centerPoint leftPoint rightPoint|
	
	fromPoint := self getPointsWithoutNodesOverlapping at:1.
	toPoint := self getPointsWithoutNodesOverlapping at:2. 
	
	vectorBetweenBorders := (toPoint - fromPoint) . 
	vectorBetweenBorders := vectorBetweenBorders * (1/ (self lengthOfVector: vectorBetweenBorders)).
	
	orthogonalVector := (vectorBetweenBorders y negated @ vectorBetweenBorders x).
	orthogonalVector := orthogonalVector * (1/ (self lengthOfVector: orthogonalVector)) * self arrowheadWidth.
	
	centerPoint := toPoint - (vectorBetweenBorders * self arrowheadLength).
	rightPoint := centerPoint + orthogonalVector.
	leftPoint := centerPoint - orthogonalVector. 
	
	^ {toPoint. leftPoint. rightPoint}
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'LP 6/8/2026 20:49'
}
SKMealyEdge >> getPointBetween: twoPoints interpolatedBy: aNumber [

	|fromPoint toPoint vectorBetween|
	fromPoint := twoPoints first.
	toPoint := twoPoints second. 
	vectorBetween := toPoint -fromPoint. 
	^ fromPoint + (aNumber * vectorBetween)
	
	
	
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'LP 6/3/2026 00:59'
}
SKMealyEdge >> getPointsWithoutNodesOverlapping [

	|firstPoint seccondPoint vectorBetweenNodes length centerToBorder|
	
	vectorBetweenNodes := self getVectorBetweenNodeCenters.
	length := self lengthOfVector:(vectorBetweenNodes). 
	centerToBorder := self fromNode defaultSize x/2.
	
	firstPoint := fromNode center + (vectorBetweenNodes * (centerToBorder/length)).
	seccondPoint := toNode center  - (vectorBetweenNodes * (centerToBorder/length)).
	
	^ {firstPoint. seccondPoint}
	
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'LP 6/3/2026 00:27'
}
SKMealyEdge >> getVectorBetweenNodeCenters [

 ^ self toNode center - self fromNode center 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/3/2026 00:47'
}
SKMealyEdge >> lengthOfVector: aVector [

^ (aVector x squared + aVector y squared) sqrt
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:30'
}
SKMealyEdge >> line [

	^ line
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:30'
}
SKMealyEdge >> line: aLine [

	line := aLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/8/2026 20:37'
}
SKMealyEdge >> popUpActive [
	^ popUpActive
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/8/2026 20:37'
}
SKMealyEdge >> popUpActive: anObject [
	popUpActive := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMealyEdge >> toNode [

	^ toNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMealyEdge >> toNode: aNode [

	toNode := aNode
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'LP 6/9/2026 14:15'
}
SKMealyEdge >> update: aValue [

	self updateLine. 
	self updateArrowhead. 
	self updateEdgePopUp. 
	
	self controller playGround addComponent: self line.
	self controller playGround addComponent: self arrowhead.
	self controller playGround addComponent: self edgeMorph.
	
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'LP 6/9/2026 14:41'
}
SKMealyEdge >> updateArrowhead [
	
	self arrowhead setVertices: (self getArrowheadPoints).  
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/8/2026 21:11'
}
SKMealyEdge >> updateEdgeMorphPosition [

self edgeMorph position: (self getPointBetween: (self getPointsWithoutNodesOverlapping) interpolatedBy: 0.5). 
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'LP 6/9/2026 14:44'
}
SKMealyEdge >> updateEdgePopUp [

(self edgeMorph) ifNotNil:[self edgeMorph delete. ].
self edgeMorph bringChildrenToFront. 
self updateEdgeMorphPosition.

]

{
	#category : #drawing,
	#'squeak_changestamp' : 'LP 6/9/2026 14:17'
}
SKMealyEdge >> updateLine [
	
	(self line) ifNotNil:[self line delete. ].
	self line: (LineMorph from: self fromNode center to: self toNode center color: (Color fromString: '#8caaee') width: 5). 
]
