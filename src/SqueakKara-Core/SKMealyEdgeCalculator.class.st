Class {
	#name : #SKMealyEdgeCalculator,
	#superclass : #Object,
	#instVars : [
		'edge',
		'arrowHeadVerticies',
		'controlPoints',
		'labelPosition',
		'popUpAnchorPoint',
		'curvePointDistances',
		'approximatedCurvePoints',
		'calculationArray',
		'curvePoints'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:21'
}
SKMealyEdgeCalculator class >> newWithEdge: aEdge [

	^ (self new
		edge: aEdge;
		yourself)
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:25'
}
SKMealyEdgeCalculator >> addCurvePointDistance: aPair [

	self curvePointDistances add: aPair
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:25'
}
SKMealyEdgeCalculator >> approximatedCurvePoints [

	^ approximatedCurvePoints ifNil: [self calculateApproximatedCurvePoints]
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:25'
}
SKMealyEdgeCalculator >> approximatedCurvePoints: aPointCollection [

	approximatedCurvePoints := aPointCollection
]

{
	#category : #'accessing - output',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:23'
}
SKMealyEdgeCalculator >> arrowHeadVerticies [

	^ arrowHeadVerticies
]

{
	#category : #'accessing - output',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:23'
}
SKMealyEdgeCalculator >> arrowHeadVerticies: aVerticiesCollection [

	arrowHeadVerticies := aVerticiesCollection
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:39'
}
SKMealyEdgeCalculator >> arrowheadLength [

	^ self edge arrowheadLength
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:39'
}
SKMealyEdgeCalculator >> arrowheadWidth [

	^ self edge arrowheadWidth
]

{
	#category : #'calculation - popUp',
	#'squeak_changestamp' : 'Lars 7/7/2026 09:03'
}
SKMealyEdgeCalculator >> calculatPopUpAnchorPoint [

	self isSelfLoop ifTrue: [
		self calculatePopUpAnchorPointForSelfLoop: self selfLoopDirection.
		^ self].
	self calculatePopUpAnchorPointForLineForm: self fromNode center to: self toNode center.
	
]

{
	#category : #calculation,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:26'
}
SKMealyEdgeCalculator >> calculateAllAnchorPoints [

	self 
		curvePoints: nil;
		controlPoints: nil.
	self
		calculateControlPoints;
		calculateCurvePoints;
		calculatPopUpAnchorPoint;
		calculateArrowHeadVerticies;
		calculateLabelPosition
]

{
	#category : #'calculation - arrowHead',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:28'
}
SKMealyEdgeCalculator >> calculateArrowHeadVerticies [

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
	#category : #'calculation - bezier-curve',
	#'squeak_changestamp' : 'Lars 7/7/2026 09:05'
}
SKMealyEdgeCalculator >> calculateBezierPointForT: aNumber [
	
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
	#'squeak_changestamp' : 'Lars 7/7/2026 08:35'
}
SKMealyEdgeCalculator >> calculateContorlPointsForSelfLoopAt: aDirection [

	| firstDirection secondDirection startingPosition point2 point3 |
	
	firstDirection := self rotateVector: aDirection by: self loopAngle.
	secondDirection := self rotateVector: aDirection by: (self loopAngle * -1).
	
	startingPosition := self fromNode center.
	point2 := startingPosition + (firstDirection * self loopHeight).
	point3 := startingPosition + (secondDirection * self loopHeight).
	self controlPoints: {startingPosition. point2. point3. startingPosition} 
]

{
	#category : #'calculation - controlPoints',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:33'
}
SKMealyEdgeCalculator >> calculateControlPoints [

	self isSelfLoop ifTrue: [
		self calculateContorlPointsForSelfLoopAt: self selfLoopDirection.
		^ self].
	self calculateControlPointsForLineFrom: self fromNode center to: self toNode center
]

{
	#category : #'calculation - controlPoints',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:34'
}
SKMealyEdgeCalculator >> calculateControlPointsForLineFrom: aPoint to: anotherPoint [

	| point1 point2 point3 middelPoint halfLength direction orthogonalDirection |
	
	point1 := aPoint.
	point3 := anotherPoint.
	
	direction := point3 - point1.
	direction := direction normalized.
	halfLength := (point1 dist: point3) / 2.
	middelPoint := point1 + (direction * halfLength).
	
	orthogonalDirection := self getOrthogonalVectorFor: direction.
	point2 := middelPoint + (orthogonalDirection * self curveHeight).
	self controlPoints: { point1. point2. point3}
]

{
	#category : #'calculation - arrowHead',
	#'squeak_changestamp' : 'Lars 7/7/2026 09:22'
}
SKMealyEdgeCalculator >> calculateCurveIntersectionWithToNode [

	self assert: (curvePoints ~= nil).
	self curvePoints reverseDo: [:aPoint | (self checkIfPoint: aPoint isOutOfNode: self toNode) ifTrue: [^ aPoint] ].
	^ self curvePoints at: 0
	
	
]

{
	#category : #calculation,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:23'
}
SKMealyEdgeCalculator >> calculateCurveLenght [

	| totalLength  segmentLenght |
	
	totalLength := 0.
	1 to: self curvePoints size - 1 do: [:i| 
		segmentLenght :=  (self curvePoints at: i) dist: (self curvePoints at: i + 1).
		totalLength := segmentLenght + totalLength].
	^ totalLength
]

{
	#category : #'calculation - label',
	#'squeak_changestamp' : 'Lars 7/7/2026 09:27'
}
SKMealyEdgeCalculator >> calculateCurveMiddelT [

	| totalLength currentLength segmentLenght |
	
	totalLength := self calculateCurveLenght.
	currentLength := 0.
	1 to: self curvePoints size - 1 do: [:i|
		segmentLenght :=  (self curvePoints at: i) dist: (self curvePoints at: i + 1).
		currentLength := segmentLenght + currentLength.
		currentLength > (totalLength / 2) ifTrue: [^ self curveStepSize * i]].
	^ 0
]

{
	#category : #calculation,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:26'
}
SKMealyEdgeCalculator >> calculateCurvePoints [

	| stepSize t lastPoint currentPoint newCurvePoints |
	
	self assert: (self controlPoints ~= nil).
	newCurvePoints := OrderedCollection new.
	stepSize := self curveStepSize.
	t := stepSize.
	lastPoint := self calculateBezierPointForT: 0.
	newCurvePoints add: lastPoint.
	
	[t <= 1] whileTrue: [
		currentPoint := self calculateBezierPointForT: t.
		newCurvePoints add: currentPoint.
		lastPoint := currentPoint.
		t := t + stepSize].
	self curvePoints: newCurvePoints
]

{
	#category : #'calculation - label',
	#'squeak_changestamp' : 'Lars 7/7/2026 09:24'
}
SKMealyEdgeCalculator >> calculateLabelPosition [

	| curveVertexPoint curveVertexDirection curveVertexOrthogonalDirection middelT |
	
	self assert: (self curvePoints ~= nil).
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
	#'squeak_changestamp' : 'Lars 7/7/2026 09:04'
}
SKMealyEdgeCalculator >> calculatePopUpAnchorPointForLineForm: aPoint to: anotherPoint [

	self assert: (self controlPoints ~= nil).

	self popUpAnchorPoint: (self controlPoints at: 2)
]

{
	#category : #'calculation - popUp',
	#'squeak_changestamp' : 'Lars 7/7/2026 09:04'
}
SKMealyEdgeCalculator >> calculatePopUpAnchorPointForSelfLoop: aDirection [

	self popUpAnchorPoint: (self fromNode center + (aDirection * (self loopHeight * 0.7)))
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:25'
}
SKMealyEdgeCalculator >> calculationArray [

	^ calculationArray
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:52'
}
SKMealyEdgeCalculator >> checkIfPoint: aPoint isOutOfNode: aNode [

	| radius |
	radius := aNode extent / 2.
	^ (aPoint dist: aNode center) > radius
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:24'
}
SKMealyEdgeCalculator >> clearCurvePointDistances [ 

	curvePointDistances := nil
]

{
	#category : #'accessing - output',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:23'
}
SKMealyEdgeCalculator >> controlPoints [

	^ controlPoints
]

{
	#category : #'accessing - output',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:23'
}
SKMealyEdgeCalculator >> controlPoints: aPointCollection [

	controlPoints := aPointCollection
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:25'
}
SKMealyEdgeCalculator >> createCalculationArrayWithLenght: aNumber [

	calculationArray := Array new: aNumber
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:38'
}
SKMealyEdgeCalculator >> curveHeight [

	^ self edge curveHeight
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:24'
}
SKMealyEdgeCalculator >> curvePointDistances [

	^ curvePointDistances ifNil: [curvePointDistances := OrderedCollection new]
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:46'
}
SKMealyEdgeCalculator >> curvePoints [

	^ curvePoints
]

{
	#category : #'accessing - helper',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:46'
}
SKMealyEdgeCalculator >> curvePoints: aPointCollection [

	curvePoints := aPointCollection
]

{
	#category : #calculation,
	#'squeak_changestamp' : 'Lars 7/7/2026 10:56'
}
SKMealyEdgeCalculator >> curveStepSize [

	^ 0.02
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:20'
}
SKMealyEdgeCalculator >> edge [

	^ edge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:20'
}
SKMealyEdgeCalculator >> edge: aEdge [

	edge := aEdge
]

{
	#category : #'accessing - input',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:22'
}
SKMealyEdgeCalculator >> fromNode [

	^ self edge fromNode
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:52'
}
SKMealyEdgeCalculator >> getOrthogonalVectorFor: aVector [

	^ ((aVector y) @ (-1 * aVector x))
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:52'
}
SKMealyEdgeCalculator >> getPointBetween: aPoint and: anotherPoint interpolatedBy: aNumber [

	|fromPoint toPoint vectorBetween|
	
	fromPoint := aPoint.
	toPoint := anotherPoint. 
	vectorBetween := toPoint -fromPoint. 
	^ fromPoint + (aNumber * vectorBetween)
	
	
	
]

{
	#category : #'accessing - input',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:22'
}
SKMealyEdgeCalculator >> isSelfLoop [

	^ self edge isSelfLoop
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:39'
}
SKMealyEdgeCalculator >> labelCurveDistance [

	^ self edge labelCurveDistance
]

{
	#category : #'accessing - output',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:23'
}
SKMealyEdgeCalculator >> labelPosition [

	^ labelPosition
]

{
	#category : #'accessing - output',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:23'
}
SKMealyEdgeCalculator >> labelPosition: aPosition [

	labelPosition := aPosition
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:40'
}
SKMealyEdgeCalculator >> loopAngle [

	^ self edge loopAngle
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:40'
}
SKMealyEdgeCalculator >> loopHeight [

	^ self edge loopHeight
]

{
	#category : #'accessing - output',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:23'
}
SKMealyEdgeCalculator >> popUpAnchorPoint [

	^ popUpAnchorPoint
]

{
	#category : #'accessing - output',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:24'
}
SKMealyEdgeCalculator >> popUpAnchorPoint: aPoint [

	popUpAnchorPoint := aPoint
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 08:52'
}
SKMealyEdgeCalculator >> rotateVector: aVector by: aNumber [

	| angle |
	
	angle := aNumber degreesToRadians.
	^ (((aVector x * angle cos) - (aVector y * angle  sin)) @ ((aVector x * angle sin) + (aVector y * angle cos)))
]

{
	#category : #'accessing - input',
	#'squeak_changestamp' : 'Lars 7/7/2026 09:36'
}
SKMealyEdgeCalculator >> selfLoopDirection [

	^ self edge selfLoopDirection
]

{
	#category : #'accessing - input',
	#'squeak_changestamp' : 'Lars 7/7/2026 08:22'
}
SKMealyEdgeCalculator >> toNode [

	^ self edge toNode
]
