Class {
	#name : #SKCurvyEdge,
	#superclass : #Morph,
	#instVars : [
		'controlPoints',
		'lines',
		'calculationArray',
		'controlPointMarker',
		'edge',
		'nodeContactPoint',
		'nodeContactDirection'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 09:35'
}
SKCurvyEdge >> addLine: aLine [

	self lines add: aLine
]

{
	#category : #'bezier-curves',
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 09:44'
}
SKCurvyEdge >> calculateBezierPointForT: aNumber [
	
	"Uses Casteljau-Algorithmus"
	| numberOfPoints p1 p2|
	
	self createCalculationArrayWithLenght: self controlPoints size.
	
	self assert: calculationArray size >= self controlPoints size.
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
	#category : #placement,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 12:17'
}
SKCurvyEdge >> calculateContorlPointsForSelfLoopAt: aDirection [

	| firstDirection secondDirection startingPosition p2 p3 |
	
	firstDirection := self rotateVector: aDirection by: self loopAngle.
	secondDirection := self rotateVector: aDirection by: (self loopAngle * -1).
	
	startingPosition := self edge fromNode center.
	p2 := startingPosition + (firstDirection * self loopHeight).
	p3 := startingPosition + (secondDirection * self loopHeight).
	self controlPoints: {startingPosition. p2. p3. startingPosition} 
]

{
	#category : #placement,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 10:54'
}
SKCurvyEdge >> calculateControlPointsForLineFrom: aPoint to: anotherPoint [

	| p1 p2 p3 middelPoint halfLength direction orthogonalDirection |
	
	p1 := aPoint.
	p3 := anotherPoint.
	
	direction := p3 - p1.
	direction := direction normalized.
	halfLength := (p1 dist: p3) / 2.
	middelPoint := p1 + (direction * halfLength).
	
	orthogonalDirection := ((direction y) @ (-1 * direction x)).
	p2 := middelPoint + (orthogonalDirection * self curveHeight).
	self controlPoints: { p1. p2. p3}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 09:37'
}
SKCurvyEdge >> calculationArray [

	^ calculationArray
]

{
	#category : #placement,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 11:41'
}
SKCurvyEdge >> checkIfPoint: aPoint isInNode: aNode [

	| radius |
	radius := aNode extent / 2.
	^ (aPoint dist: aNode center) <= (radius + self edge arrowheadLength)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 10:05'
}
SKCurvyEdge >> clearLines [

	self lines do: [:aLine| aLine delete].
	lines := OrderedCollection new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 10:35'
}
SKCurvyEdge >> controlPointMarker [

	^ controlPointMarker ifNil: [controlPointMarker := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 10:32'
}
SKCurvyEdge >> controlPointMarker: controlPointMarkerCollection [

	controlPointMarker := controlPointMarkerCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 09:35'
}
SKCurvyEdge >> controlPoints [

	^ controlPoints 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 10:54'
}
SKCurvyEdge >> controlPoints: aControlPointCollection [

	| marker |

	controlPoints := aControlPointCollection.
	
"	self controlPointMarker do: [:aMarker | 
		self controlPointMarker remove: aMarker.
		aMarker delete].
	Transcript show: '-------------'; cr.
	aControlPointCollection do: [:aPoint| 
		Transcript show: aPoint; cr. 
		marker := Morph new.
		marker position: aPoint.
		self addMorph: marker.
		self controlPointMarker add: marker]"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 09:37'
}
SKCurvyEdge >> createCalculationArrayWithLenght: aNumber [

	calculationArray := Array new: aNumber
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 10:54'
}
SKCurvyEdge >> curveHeight [

	^ 200
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 11:28'
}
SKCurvyEdge >> drawCurveForControlPoints [

	| stepSize t lastPoint currentPoint firstNodeContactPoint firstNodeContactDirection |
	
	self clearLines.
	
	stepSize := 0.01.
	t := stepSize.
	lastPoint := self calculateBezierPointForT: 0.
	
	firstNodeContactPoint := nil.
	
	[t <= 1] whileTrue: [
		currentPoint := self calculateBezierPointForT: t.
		self drawLineForm: lastPoint to: currentPoint.
		((t >= 0.8) and: (firstNodeContactPoint isNil)) ifTrue: [
			(self checkIfPoint: currentPoint isInNode: self edge toNode) ifTrue: [firstNodeContactPoint := lastPoint.
				firstNodeContactDirection := currentPoint - lastPoint]].
		lastPoint := currentPoint.
		t := t + stepSize].
	self nodeContactPoint: firstNodeContactPoint;
		nodeContactDirection: firstNodeContactPoint
	
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 09:47'
}
SKCurvyEdge >> drawLineForm: aPoint to: anotherPoint [

	| line |
	line := LineMorph from: aPoint to: anotherPoint color: self lineColorNormal width: self lineWidth.
	self addMorph: line;
		addLine: line
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 11:09'
}
SKCurvyEdge >> edge [

	^ edge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 11:09'
}
SKCurvyEdge >> edge: aEdge [

	edge := aEdge
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 09:46'
}
SKCurvyEdge >> lineColorNormal [
	
	^ SKStylesheet colorLightBlue
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 09:46'
}
SKCurvyEdge >> lineWidth [

	^ 5
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 09:35'
}
SKCurvyEdge >> lines [

	^ lines ifNil: [lines := OrderedCollection new]
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 12:59'
}
SKCurvyEdge >> loopAngle [

	^ 40
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 12:01'
}
SKCurvyEdge >> loopHeight [

	^ 200
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 11:14'
}
SKCurvyEdge >> nodeContactDirection [

	^ nodeContactDirection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 11:14'
}
SKCurvyEdge >> nodeContactDirection: aDirection [

	nodeContactDirection := aDirection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 11:14'
}
SKCurvyEdge >> nodeContactPoint [

	^ nodeContactPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 11:14'
}
SKCurvyEdge >> nodeContactPoint: aPoint [

	nodeContactPoint := aPoint
]

{
	#category : #placement,
	#'squeak_changestamp' : 'Lars Kuhr 6/17/2026 11:54'
}
SKCurvyEdge >> rotateVector: aDirection by: aNumber [

	| angle |
	angle := aNumber degreesToRadians.
	^ (aDirection x * angle cos - aDirection y * angle sin) @ (aDirection x * angle sin + aDirection y * angle cos)
]
