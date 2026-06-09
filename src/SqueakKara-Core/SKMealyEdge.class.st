Class {
	#name : #SKMealyEdge,
	#superclass : #Object,
	#instVars : [
		'line',
		'fromNode',
		'toNode',
		'controller',
		'popUpActive',
		'edgeMorph'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LP 6/8/2026 20:37'
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
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:38'
}
SKMealyEdge >> delete [
	
	self line ifNotNil: [self line delete]
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'LP 6/3/2026 01:16'
}
SKMealyEdge >> drawArrowhead [

	self line addMorph: (PolygonMorph
		vertices: (self getArrowheadPoints)
		color: Color red borderWidth: 1 borderColor: Color black).
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'LP 6/9/2026 12:51'
}
SKMealyEdge >> drawEdgePopUp [

(self popUpActive) ifTrue:[self edgeMorph: SKSelectionPopUpWrapper new.  self line addMorph: self edgeMorph. self popUpActive: false. self updateEdgeMorphPosition ] ifFalse: [self edgeMorph bringChildrenToFront.   self line addMorph: self edgeMorph. self popUpActive: false. self updateEdgeMorphPosition]. "this cannot be good"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/8/2026 20:40'
}
SKMealyEdge >> edgeMorph [
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
	#'squeak_changestamp' : 'LP 6/8/2026 20:55'
}
SKMealyEdge >> update: aValue [

	
	self line delete.
	self line: (LineMorph from: self fromNode center to: self toNode center color: (Color fromString: '#8caaee') width: 5).
	self drawArrowhead. 
	self drawEdgePopUp. 
	
	self controller playGround addComponent: self line
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/8/2026 21:11'
}
SKMealyEdge >> updateEdgeMorphPosition [

self edgeMorph position: (self getPointBetween: (self getPointsWithoutNodesOverlapping) interpolatedBy: 0.5). 
]
