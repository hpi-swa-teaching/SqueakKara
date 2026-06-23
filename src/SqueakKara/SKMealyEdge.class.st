Class {
	#name : #SKMealyEdge,
	#superclass : #Object,
	#instVars : [
		'curve',
		'fromNode',
		'toNode',
		'controller',
		'arrowhead',
		'command',
		'condition',
		'isSelfLoop',
		'controlPoints',
		'popUpAnchorPoint',
		'calculationArray',
		'selfLoopDirection',
		'popUp',
		'arrowHeadVerticies',
		'approximatedCurvePoints',
		'currentColor',
		'conditionAbbreviations',
		'commandAbbriviations',
		'edgeLabel',
		'labelPosition',
		'curvePointDistances'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:34'
}
SKMealyEdge class >> newFrom: aNode to: anotherNode [

	| instance |
	instance := self new.
	instance
		fromNode: aNode;
		toNode: anotherNode;
		isSelfLoop: aNode = anotherNode.
	
	^ instance
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 14:43'
}
SKMealyEdge >> addCurvePointDistance: aPair [

	self curvePointDistances add: aPair

	
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars Kuhr 6/19/2026 15:58'
}
SKMealyEdge >> approximatedCurvePoints [

	^ approximatedCurvePoints ifNil: [self calculateApproximatedCurvePoints]
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars Kuhr 6/19/2026 15:48'
}
SKMealyEdge >> approximatedCurvePoints: aPointCollection [

	approximatedCurvePoints := aPointCollection
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:38'
}
SKMealyEdge >> arrowColor [

	^ SKStylesheet colorRed
]

{
	#category : #'accessing - anchor-points',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:28'
}
SKMealyEdge >> arrowHeadVerticies [

	^ arrowHeadVerticies
]

{
	#category : #'accessing - anchor-points',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:28'
}
SKMealyEdge >> arrowHeadVerticies: aVerticiesCollection [

	arrowHeadVerticies := aVerticiesCollection
]

{
	#category : #'accessing - visual-components',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:29'
}
SKMealyEdge >> arrowhead [

	^ arrowhead ifNil: [arrowhead := (PolygonMorph
		vertices: (self arrowHeadVerticies)
		color: self arrowColor borderWidth: 1 borderColor: Color black)]
]

{
	#category : #'accessing - visual-components',
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 09:52'
}
SKMealyEdge >> arrowhead: anObject [

	arrowhead := anObject
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LP 6/9/2026 16:35'
}
SKMealyEdge >> arrowheadLength [
  
	^ 20
]

{
	#category : #layout,
	#'squeak_changestamp' : 'LP 6/9/2026 16:35'
}
SKMealyEdge >> arrowheadWidth [
  
	^ 20
]

{
	#category : #'calculation - popUp',
	#'squeak_changestamp' : 'Lars Kuhr 6/19/2026 16:14'
}
SKMealyEdge >> calculatPopUpAnchorPoint [

	self isSelfLoop ifTrue: [
		self calculatePopUpAnchorPointForSelfLoop: self selfLoopDirection.
		^ self].
	self calculatePopUpAnchorPointForLineForm: self fromNode center to: self toNode center.
	
]

{
	#category : #calculation,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 14:23'
}
SKMealyEdge >> calculateAllAnchorPoints [

	self
		calculateControlPoints;
		calculatPopUpAnchorPoint;
		calculateArrowHeadVerticies;
		calculateApproximatedCurvePoints;
		calculateLabelPosition
]

{
	#category : #calculation,
	#'squeak_changestamp' : 'Lars Kuhr 6/19/2026 15:52'
}
SKMealyEdge >> calculateApproximatedCurvePoints [

	| stepSize t lastPoint currentPoint curvePoints |
	
	stepSize := 0.1.
	t := 1 - stepSize.
	curvePoints := OrderedCollection new.
	lastPoint := self calculateBezierPointForT: 1.
	curvePoints add: lastPoint.
	
	[t >= 0] whileTrue: [
		currentPoint := self calculateBezierPointForT: t.
		curvePoints add: currentPoint.
		lastPoint := currentPoint.
		t := t - stepSize].
	self approximatedCurvePoints: curvePoints
]

{
	#category : #'calculation - arrowHead',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:28'
}
SKMealyEdge >> calculateArrowHeadVerticies [

	| intersectionPoint orthogonalVector vectorToNode toPoint leftPoint rightPoint centerPoint |
	
	intersectionPoint := self calculateCurveIntersectionWithToNode.
	vectorToNode := intersectionPoint - (self toNode center).
	vectorToNode := vectorToNode normalized.
	
	toPoint := self toNode center + (vectorToNode * (self toNode extent / 2)).
	orthogonalVector := self getOrthogonalVectorFor: vectorToNode.
	orthogonalVector := orthogonalVector normalized * self arrowheadWidth.
	
	centerPoint := toPoint + (vectorToNode * self arrowheadLength).
	rightPoint := centerPoint + orthogonalVector.
	leftPoint := centerPoint - orthogonalVector. 
	
	self arrowHeadVerticies: {toPoint. leftPoint. rightPoint}
]

{
	#category : #'bezier-curve',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 18:06'
}
SKMealyEdge >> calculateBezierPointForT: aNumber [
	
	"Uses Casteljau-Algorithmus"
	| numberOfPoints p1 p2|
	
	self createCalculationArrayWithLenght: self controlPoints size.
	
	self assert: self calculationArray size >= self controlPoints size.
	self assert: self controlPoints size > 0.
	
	self controlPoints doWithIndex: [:aPoint :i| self calculationArray at: i put: aPoint].
	numberOfPoints := self controlPoints size.
	1 to: numberOfPoints do: [:j |
		1 to: numberOfPoints - 1 do: [:i |
			p1 := self calculationArray at: i.
			p2 := self calculationArray at: i + 1. 
			self calculationArray at: i put: (p1 + (aNumber * (p2 - p1)))]].
	^ self calculationArray at: 1
]

{
	#category : #'calculation - controlPoints',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:41'
}
SKMealyEdge >> calculateContorlPointsForSelfLoopAt: aDirection [

	| firstDirection secondDirection startingPosition p2 p3 |
	
	firstDirection := self rotateVector: aDirection by: self loopAngle.
	secondDirection := self rotateVector: aDirection by: (self loopAngle * -1).
	
	startingPosition := self fromNode center.
	p2 := startingPosition + (firstDirection * self loopHeight).
	p3 := startingPosition + (secondDirection * self loopHeight).
	self controlPoints: {startingPosition. p2. p3. startingPosition} 
]

{
	#category : #'calculation - controlPoints',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 18:16'
}
SKMealyEdge >> calculateControlPoints [

	self isSelfLoop ifTrue: [
		self calculateContorlPointsForSelfLoopAt: self selfLoopDirection.
		^ self].
	self calculateControlPointsForLineFrom: self fromNode center to: self toNode center
]

{
	#category : #'calculation - controlPoints',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 18:04'
}
SKMealyEdge >> calculateControlPointsForLineFrom: aPoint to: anotherPoint [

	| p1 p2 p3 middelPoint halfLength direction orthogonalDirection |
	
	p1 := aPoint.
	p3 := anotherPoint.
	
	direction := p3 - p1.
	direction := direction normalized.
	halfLength := (p1 dist: p3) / 2.
	middelPoint := p1 + (direction * halfLength).
	
	orthogonalDirection := self getOrthogonalVectorFor: direction.
	p2 := middelPoint + (orthogonalDirection * self curveHeight).
	self controlPoints: { p1. p2. p3}
]

{
	#category : #'calculation - arrowHead',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:20'
}
SKMealyEdge >> calculateCurveIntersectionWithToNode [


	| stepSize t lastPoint currentPoint |
	
	stepSize := 0.01.
	t := 1 - stepSize.
	lastPoint := self calculateBezierPointForT: 1.
	
	[t >= 0] whileTrue: [
		currentPoint := self calculateBezierPointForT: t.
		(self checkIfPoint: currentPoint isOutOfNode: self toNode) ifTrue: [^ currentPoint].
		lastPoint := currentPoint.
		t := t - stepSize]
	
]

{
	#category : #'calculation - label',
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 15:23'
}
SKMealyEdge >> calculateCurveMiddelT [

	| stepSize t lastPoint currentPoint distanceToStep totalLength currentLength |
	
	distanceToStep := OrderedCollection new.
	
	stepSize := 0.05.
	t := stepSize.
	lastPoint := self calculateBezierPointForT: 0.
	
	[t <= 1] whileTrue: [
		currentPoint := self calculateBezierPointForT: t.
		distanceToStep add: (currentPoint dist: lastPoint) -> t. 
		lastPoint := currentPoint.
		t := t + stepSize].
	
	totalLength := 0.
	distanceToStep do: [:aPair| totalLength := totalLength + aPair key].
	currentLength := (distanceToStep at: 1) key.
	2 to: distanceToStep size do: [:i| currentLength := currentLength + ((distanceToStep at: i ) key).
		currentLength > (totalLength / 2) ifTrue: [^ (distanceToStep at: i-1) value]].
	^ 0
]

{
	#category : #'calculation - label',
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 15:15'
}
SKMealyEdge >> calculateLabelPosition [

	| curveVertexPoint curveVertexDirection curveVertexOrthogonalDirection middelT |
	
	self isSelfLoop ifTrue: [self labelPosition: self popUpAnchorPoint.
		^ self].
	
	middelT := self calculateCurveMiddelT.
	curveVertexPoint := self calculateBezierPointForT: middelT.
	curveVertexDirection := curveVertexPoint - (self calculateBezierPointForT: (middelT - 0.01)).
	curveVertexOrthogonalDirection := (self getOrthogonalVectorFor: curveVertexDirection) normalized.
	
	self labelPosition: (curveVertexPoint + (curveVertexOrthogonalDirection * self labelCurveDistance))
]

{
	#category : #'calculation - popUp',
	#'squeak_changestamp' : 'Lars Kuhr 6/19/2026 16:14'
}
SKMealyEdge >> calculatePopUpAnchorPointForLineForm: aPoint to: anotherPoint [

	self popUpAnchorPoint: (self controlPoints at: 2)
]

{
	#category : #'calculation - popUp',
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 15:16'
}
SKMealyEdge >> calculatePopUpAnchorPointForSelfLoop: aDirection [

	self popUpAnchorPoint: (self fromNode center + (aDirection * (self loopHeight * 0.7)))
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 18:07'
}
SKMealyEdge >> calculationArray [

	^ calculationArray
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:18'
}
SKMealyEdge >> checkIfPoint: aPoint isOutOfNode: aNode [

	| radius |
	radius := aNode extent / 2.
	^ (aPoint dist: aNode center) > radius
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 14:37'
}
SKMealyEdge >> clearCurvePointDistances [ 

	curvePointDistances := nil
]

{
	#category : #'accessing - edge-properties',
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:24'
}
SKMealyEdge >> command [

	^command
]

{
	#category : #'accessing - edge-properties',
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:23'
}
SKMealyEdge >> command: aCommand [

	command := aCommand
]

{
	#category : #labels,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 15:13'
}
SKMealyEdge >> commandAbbriviations [

	commandAbbriviations ifNotNil: [^ commandAbbriviations].
	
	commandAbbriviations := Dictionary new.
	commandAbbriviations
		at: 'kara move' put: 'm';
		at: 'kara turn: left' put: 'l';
		at: 'kara turn: right' put: 'r';
		at: 'kara push' put: 'p';
		at: '' put: '~'.
	^ commandAbbriviations
]

{
	#category : #'accessing - edge-properties',
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:23'
}
SKMealyEdge >> condition [

	^ condition
]

{
	#category : #'accessing - edge-properties',
	#'squeak_changestamp' : 'Lars Kuhr 6/8/2026 11:23'
}
SKMealyEdge >> condition: aCondition [

	condition := aCondition
]

{
	#category : #labels,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 15:09'
}
SKMealyEdge >> conditionAbbreviations [

 	conditionAbbreviations ifNotNil: [^ conditionAbbreviations].
	
	conditionAbbreviations := Dictionary new.
	conditionAbbreviations 
		at: 'kara trunkAhead' put: 't';
		at: 'kara onCloverleaf' put: 'c';
		at: 'kara mushroomAhead' put: 'm'.
	^ conditionAbbreviations
]

{
	#category : #'accessing - anchor-points',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 10:28'
}
SKMealyEdge >> controlPoints [

	^ controlPoints
]

{
	#category : #'accessing - anchor-points',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 10:28'
}
SKMealyEdge >> controlPoints: aPointCollection [

	controlPoints := aPointCollection
]

{
	#category : #'accessing - edge-properties',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:53'
}
SKMealyEdge >> controller [

	^ controller
]

{
	#category : #'accessing - edge-properties',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:53'
}
SKMealyEdge >> controller: aController [

	controller := aController
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 18:08'
}
SKMealyEdge >> createCalculationArrayWithLenght: aNumber [

	calculationArray := Array new: aNumber
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:38'
}
SKMealyEdge >> currentColor [
	
	^ currentColor ifNil: [currentColor := self normalColor]
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:33'
}
SKMealyEdge >> currentColor: aColor [

	currentColor := aColor
]

{
	#category : #'accessing - visual-components',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:35'
}
SKMealyEdge >> curve [

	^ curve 
]

{
	#category : #'accessing - visual-components',
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 10:00'
}
SKMealyEdge >> curve: aCurvyEdge [

	curve := aCurvyEdge
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 18:04'
}
SKMealyEdge >> curveHeight [

	^ 200
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 14:36'
}
SKMealyEdge >> curvePointDistances [

	^ curvePointDistances ifNil: [curvePointDistances := OrderedCollection new]
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/22/2026 12:25'
}
SKMealyEdge >> delete [

	self arrowhead ifNotNil:[self arrowhead delete]. 
	self popUp ifNotNil:  [self popUp delete]. 
	self curve ifNotNil: [self curve delete].
	self edgeLabel ifNotNil: [self edgeLabel delete]
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/19/2026 16:05'
}
SKMealyEdge >> distanceFrom: aPoint toLineFrom: aFromPoint to: aToPoint [

	| lineVector pointVector lineLengthSquared t projection |

	lineVector := aToPoint - aFromPoint.
	pointVector := aPoint - aFromPoint.

	lineLengthSquared := lineVector dotProduct: lineVector.

	lineLengthSquared = 0 ifTrue: [
		^ aPoint dist: aFromPoint
	].

	t := (pointVector dotProduct: lineVector) / lineLengthSquared.
	t := (t min: 0) max: 1.

	projection := aFromPoint + (lineVector * t).

	^ aPoint dist: projection
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 22:58'
}
SKMealyEdge >> drawCurveForControlPoints [

	| stepSize t lastPoint currentPoint |
	
	stepSize := 0.01.
	t := stepSize.
	lastPoint := self calculateBezierPointForT: 0.
	
	[t <= 1] whileTrue: [
		currentPoint := self calculateBezierPointForT: t.
		self drawLineForm: lastPoint to: currentPoint.
		lastPoint := currentPoint.
		t := t + stepSize].
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:34'
}
SKMealyEdge >> drawLineForm: aPoint to: anotherPoint [

	| line |
	line := LineMorph from: aPoint to: anotherPoint color: self currentColor width: self lineWidth.
	self curve addMorph: line.
]

{
	#category : #'accessing - visual-components',
	#'squeak_changestamp' : 'Lars Kuhr 6/22/2026 12:21'
}
SKMealyEdge >> edgeLabel [

	^ edgeLabel
]

{
	#category : #'accessing - visual-components',
	#'squeak_changestamp' : 'Lars Kuhr 6/22/2026 12:12'
}
SKMealyEdge >> edgeLabel: aLabel [

	edgeLabel := aLabel
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:36'
}
SKMealyEdge >> edgeWidth [

	^ 5
]

{
	#category : #'accessing - edge-properties',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:10'
}
SKMealyEdge >> fromNode [

	^ fromNode
]

{
	#category : #'accessing - edge-properties',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMealyEdge >> fromNode: aNode [
	
	fromNode := aNode
]

{
	#category : #labels,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 15:09'
}
SKMealyEdge >> generateEdgeLabel [

	| label |
	(self condition = '') 
		ifTrue: [label := '']
		ifFalse: [label := (self conditionAbbreviations at: self condition),'?'].
	label := label,(self commandAbbriviations at: self command).
	^ label
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/19/2026 16:09'
}
SKMealyEdge >> getApproximatedDistanceToEdgeFrom: aPoint [

	| minDistance fromPoint toPoint |
	
	minDistance := Float infinity.
	1 to: self approximatedCurvePoints size -1 do: [:i| 
		fromPoint := self approximatedCurvePoints at: i.
		toPoint := self approximatedCurvePoints at: i + 1.
		minDistance := minDistance min: (self distanceFrom: aPoint toLineFrom: fromPoint to: toPoint)].
	^ minDistance
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 18:03'
}
SKMealyEdge >> getOrthogonalVectorFor: aVector [

	^ ((aVector y) @ (-1 * aVector x))
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 18:21'
}
SKMealyEdge >> getPointBetween: aPoint and: anotherPoint interpolatedBy: aNumber [

	|fromPoint toPoint vectorBetween|
	
	fromPoint := aPoint.
	toPoint := anotherPoint. 
	vectorBetween := toPoint -fromPoint. 
	^ fromPoint + (aNumber * vectorBetween)
	
	
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:40'
}
SKMealyEdge >> gotDeselected [
	
	self popUp actionClose.
	self currentColor: self normalColor;
		update: #select
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:40'
}
SKMealyEdge >> gotSelected [

	self popUp makeVisible.
	self currentColor: self selectedColor;
		update: #select
]

{
	#category : #'accessing - edge-properties',
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 12:11'
}
SKMealyEdge >> isSelfLoop [

	^ isSelfLoop
]

{
	#category : #'accessing - edge-properties',
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 12:11'
}
SKMealyEdge >> isSelfLoop: aBoolean [

	isSelfLoop := aBoolean
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 15:04'
}
SKMealyEdge >> labelCurveDistance [

	^ 30
]

{
	#category : #'accessing - anchor-points',
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 14:18'
}
SKMealyEdge >> labelPosition [

	^ labelPosition
]

{
	#category : #'accessing - anchor-points',
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 14:18'
}
SKMealyEdge >> labelPosition: aPosition [

	labelPosition := aPosition
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:05'
}
SKMealyEdge >> lineColorNormal [
	
	^ SKStylesheet colorLightBlue
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:05'
}
SKMealyEdge >> lineWidth [

	^ 5
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 18:04'
}
SKMealyEdge >> loopAngle [

	^ 40
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 18:04'
}
SKMealyEdge >> loopHeight [

	^ 200
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:46'
}
SKMealyEdge >> normalColor [

	^ SKStylesheet colorLightBlue
]

{
	#category : #'accessing - visual-components',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 22:33'
}
SKMealyEdge >> popUp [

	^ popUp
]

{
	#category : #'accessing - visual-components',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 22:33'
}
SKMealyEdge >> popUp: aMorph [
	
	popUp := aMorph
]

{
	#category : #'accessing - anchor-points',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 10:31'
}
SKMealyEdge >> popUpAnchorPoint [

	^ popUpAnchorPoint
]

{
	#category : #'accessing - anchor-points',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 10:31'
}
SKMealyEdge >> popUpAnchorPoint: aPoint [

	popUpAnchorPoint := aPoint
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:41'
}
SKMealyEdge >> rotateVector: aVector by: aNumber [

	| angle |
	
	angle := aNumber degreesToRadians.
	^ (((aVector x * angle cos) - (aVector y * angle  sin)) @ ((aVector x * angle sin) + (aVector y * angle cos)))
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:41'
}
SKMealyEdge >> selectedColor [

	^ SKStylesheet colorYellow
]

{
	#category : #'accessing - anchor-points',
	#'squeak_changestamp' : 'Lars Kuhr 6/21/2026 15:04'
}
SKMealyEdge >> selfLoopDirection [

	^ selfLoopDirection ifNil: [selfLoopDirection := 0 @ -1]
]

{
	#category : #'accessing - anchor-points',
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 18:13'
}
SKMealyEdge >> selfLoopDirection: aDirection [

	selfLoopDirection := aDirection
]

{
	#category : #'accessing - edge-properties',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMealyEdge >> toNode [

	^ toNode
]

{
	#category : #'accessing - edge-properties',
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:11'
}
SKMealyEdge >> toNode: aNode [

	toNode := aNode
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/22/2026 12:23'
}
SKMealyEdge >> update: aValue [

	self calculateAllAnchorPoints.
	
	self updateCurve;
		updateArrowhead;
		updatePopUp;
		updateLabel
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:32'
}
SKMealyEdge >> updateArrowhead [
	
	self arrowhead delete.
	self arrowhead setVertices: (self arrowHeadVerticies).
	self controller playGround addComponent: self arrowhead
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 23:14'
}
SKMealyEdge >> updateCurve [

	| curve |
	
	self curve ifNotNil: [self curve delete].
	
	curve := Morph new.
	curve color: Color transparent.
	self curve: curve.
	self controller playGround addComponent: curve.
	self drawCurveForControlPoints

]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 15:22'
}
SKMealyEdge >> updateLabel [

	self updateValues.
	self edgeLabel ifNil: [
		self edgeLabel: (StringMorph new
			color: Color black;
			emphasis: TextEmphasis bold emphasisCode;
			font: ((TextStyle named: #BitstreamVeraSans) addNewFontSize: 12)).
		self edgeLabel
			lock.
		self controller playGround addComponent: self edgeLabel].
	self edgeLabel 
		center: self labelPosition;
		contents: self generateEdgeLabel
		
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:50'
}
SKMealyEdge >> updatePopUp [

	self popUp ifNil: [self popUp: SKSelectionPopUpWrapper new.
		self popUp edge: self.
		self controller playGround addComponent: self popUp].
	
	self popUp position: self popUpAnchorPoint.
	self popUp bringChildrenToFront.
	
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/18/2026 22:53'
}
SKMealyEdge >> updateValues [

	self condition: self popUp actionGetCondition.
	self command: self popUp actionGetCommand
]
