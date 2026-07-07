Class {
	#name : #SKMealyEdge,
	#superclass : #Object,
	#instVars : [
		'fromNode',
		'toNode',
		'command',
		'condition',
		'isSelfLoop',
		'selfLoopDirection',
		'controller',
		'calculator',
		'curve',
		'arrowhead',
		'popUp',
		'currentColor',
		'conditionAbbreviations',
		'commandAbbriviations',
		'edgeLabel'
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
	#category : #actions,
	#'squeak_changestamp' : 'Lars 7/7/2026 01:40'
}
SKMealyEdge >> actionDeselect [
	
	self popUp actionClose.
	self currentColor: self normalColor;
		update: #select
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:23'
}
SKMealyEdge >> actionGetApproximatedDistanceToPoint: aPoint [

	| minDistance fromPoint toPoint |
	
	minDistance := Float infinity.
	1 to: self calculator curvePoints size -1 do: [:i| 
		fromPoint := self calculator curvePoints at: i.
		toPoint := self calculator curvePoints at: i + 1.
		minDistance := minDistance min: (self distanceFrom: aPoint toLineFrom: fromPoint to: toPoint)].
	^ minDistance
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars 7/7/2026 01:40'
}
SKMealyEdge >> actionSelect [

	self popUp makeVisible.
	self currentColor: self selectedColor;
		update: #select
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/10/2026 10:38'
}
SKMealyEdge >> arrowColor [

	^ SKStylesheet colorRed
]

{
	#category : #'accessing - visual-components',
	#'squeak_changestamp' : 'Lars 7/7/2026 09:28'
}
SKMealyEdge >> arrowhead [

	^ arrowhead ifNil: [arrowhead := (PolygonMorph
		vertices: (self calculator arrowHeadVerticies)
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
	#category : #accessing,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:10'
}
SKMealyEdge >> calculator [

	^ calculator ifNil: [calculator := SKMealyEdgeCalculator newWithEdge: self]
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
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:38'
}
SKMealyEdge >> currentColor [
	
	^ currentColor ifNil: [currentColor := self normalColor]
]

{
	#category : #accessing,
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
	#'squeak_changestamp' : 'Lars 7/7/2026 09:13'
}
SKMealyEdge >> drawCurveForControlPoints [

	| point1 point2 |

	1 to: (self calculator curvePoints size - 1) do: [:i | 
		point1 := self calculator curvePoints at: i.
		point2 := self calculator curvePoints at: i + 1.
		self drawLineForm: point1 to: point2]
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
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 22:41'
}
SKMealyEdge >> selectedColor [

	^ SKStylesheet colorYellow
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:38'
}
SKMealyEdge >> selfLoopDirection [

	^ selfLoopDirection ifNil: [selfLoopDirection := (0 @ -1)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:35'
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
	#'squeak_changestamp' : 'Lars 7/7/2026 09:11'
}
SKMealyEdge >> update: aValue [

	self calculator calculateAllAnchorPoints.
	
	self updateCurve;
		updateArrowhead;
		updatePopUp;
		updateLabel
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:27'
}
SKMealyEdge >> updateArrowhead [
	
	self arrowhead delete.
	self arrowhead setVertices: (self calculator arrowHeadVerticies).
	self controller actionAddComponent: self arrowhead
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:27'
}
SKMealyEdge >> updateCurve [

	| curve |
	
	self curve ifNotNil: [self curve delete].
	
	curve := Morph new.
	curve color: Color transparent.
	self curve: curve.
	self controller actionAddComponent: curve.
	self drawCurveForControlPoints

]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:27'
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
		self controller actionAddComponent: self edgeLabel].
	self edgeLabel 
		center: self calculator labelPosition;
		contents: self generateEdgeLabel
		
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:28'
}
SKMealyEdge >> updatePopUp [

	self popUp ifNil: [self popUp: SKSelectionPopUpWrapper new.
		self popUp edge: self.
		self controller actionAddComponent: self popUp].
	
	self popUp position: self calculator popUpAnchorPoint.
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
