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
		'arrowhead',
		'command',
		'condition'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:31'
}
SKMealyEdge class >> newFrom: aNode to: anotherNode [

	| instance line |
	instance := self new.
	line := LineMorph from: aNode center to: anotherNode center color: instance normalColor width: 5.
	instance 
		line: line;
		fromNode: aNode;
		toNode: anotherNode.
	aNode controller playGround addMorph: line.
	
	^ instance
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:38'
}
SKMealyEdge >> arrowColor [

	^ SKStylesheet colorRed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 11:27'
}
SKMealyEdge >> arrowhead [

	^ arrowhead ifNil: [arrowhead := (PolygonMorph
		vertices: (self getArrowheadPoints)
		color: self arrowColor borderWidth: 1 borderColor: Color black)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:52'
}
SKMealyEdge >> arrowhead: anObject [

	arrowhead := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 16:35'
}
SKMealyEdge >> arrowheadLength [
  
	^ 20
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 16:35'
}
SKMealyEdge >> arrowheadWidth [
  
	^ 20
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:24'
}
SKMealyEdge >> command [

	^command
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:23'
}
SKMealyEdge >> command: aCommand [

	command := aCommand
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:23'
}
SKMealyEdge >> condition [

	^ condition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:23'
}
SKMealyEdge >> condition: aCondition [

	condition := aCondition
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
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:51'
}
SKMealyEdge >> edgeMorph [

	^ edgeMorph ifNil: [edgeMorph := SKSelectionPopUpWrapper new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:52'
}
SKMealyEdge >> edgeMorph: anObject [

	edgeMorph := anObject
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:36'
}
SKMealyEdge >> edgeWidth [

	^ 5
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
	#category : #vectorHelpFunctions,
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
	#category : #vectorHelpFunctions,
	#'squeak_changestamp' : 'LP 6/9/2026 16:39'
}
SKMealyEdge >> getPointBetween: twoPoints interpolatedBy: aNumber [

	|fromPoint toPoint vectorBetween|
	
	fromPoint := twoPoints first.
	toPoint := twoPoints second. 
	vectorBetween := toPoint -fromPoint. 
	^ fromPoint + (aNumber * vectorBetween)
	
	
	
]

{
	#category : #vectorHelpFunctions,
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
	#category : #vectorHelpFunctions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:47'
}
SKMealyEdge >> getVectorBetweenNodeCenters [

 	^ self toNode center - self fromNode center 
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:41'
}
SKMealyEdge >> gotDeselected [
	
	self edgeMorph actionClose
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:40'
}
SKMealyEdge >> gotSelected [

	self edgeMorph makeVisible
]

{
	#category : #vectorHelpFunctions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:47'
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
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:46'
}
SKMealyEdge >> normalColor [

	^ SKStylesheet colorLightBlue
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:33'
}
SKMealyEdge >> selectedColor [

	^ SKStylesheet colorLightGreen
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
	#category : #updating,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:50'
}
SKMealyEdge >> update: aValue [

	self updateLine;
		updateArrowhead;
		updateEdgePopUp. 
	
	self controller playGround addComponent: self line;
	 	addComponent: self arrowhead;
		addComponent: self edgeMorph
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:49'
}
SKMealyEdge >> updateArrowhead [
	
	self arrowhead setVertices: (self getArrowheadPoints)
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:49'
}
SKMealyEdge >> updateEdgeMorphPosition [

	self edgeMorph position: (self getPointBetween: (self getPointsWithoutNodesOverlapping) interpolatedBy: 0.5)
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:48'
}
SKMealyEdge >> updateEdgePopUp [

	(self edgeMorph) ifNotNil:[self edgeMorph delete. ].
	self edgeMorph bringChildrenToFront. 
	self updateEdgeMorphPosition

]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:37'
}
SKMealyEdge >> updateLine [
	
	(self line) ifNotNil:[self line delete. ].
	self line: (LineMorph from: self fromNode center to: self toNode center color: self normalColor width: self edgeWidth)
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:59'
}
SKMealyEdge >> updateValues [

	self condition: self edgeMorph actionGetCondition.
	self command: self edgeMorph actionGetCommand
]
