Class {
	#name : #SKMealyNode,
	#superclass : #CircleMorph,
	#instVars : [
		'controller',
		'isInDrag',
		'stateMachineEditor',
		'isStartingNode',
		'name',
		'edges',
		'edgeAngles',
		'bestDifference',
		'newAngle',
		'label'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'Lars 7/7/2026 01:52'
}
SKMealyNode class >> newWithName: aString [

	^ (self new
		name: aString;
		showNameAsLabel;
		yourself)
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:29'
}
SKMealyNode >> actionDeselect [

	self color: self normalColor;
		showNameAsLabel
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars 7/7/2026 02:00'
}
SKMealyNode >> actionSelectWithMode: aMode [

	aMode caseOf: {
		[#select] -> [self showNameAsTextMorph].
		[#edge]  -> [self color: self selectedColor]
	} otherwise: []
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 23:25'
}
SKMealyNode >> addEdge: aEdge [

	self edges add: aEdge
]

{
	#category : #'accessing - edgePlacement',
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 09:45'
}
SKMealyNode >> addEdgeAnlge: aAngle [

	self edgeAngles add: aAngle
]

{
	#category : #'accessing - edgePlacement',
	#'squeak_changestamp' : 'Lars Kuhr 6/21/2026 15:48'
}
SKMealyNode >> bestDifference [

	^ bestDifference ifNil: [bestDifference := 0]
]

{
	#category : #'accessing - edgePlacement',
	#'squeak_changestamp' : 'Lars Kuhr 6/21/2026 15:46'
}
SKMealyNode >> bestDifference: aNumber [

	bestDifference := aNumber
]

{
	#category : #edgePlacement,
	#'squeak_changestamp' : 'JS 6/23/2026 20:38'
}
SKMealyNode >> calculateBestEdgeDirections [

	| selfLoops |
	
	self edgeAngels: self getEdgeAngles asSortedCollection.
	selfLoops := self edges select: [:aEdge| aEdge isSelfLoop]. 
	
	self edgeAngles size <= 0 ifTrue: [selfLoops removeFirst.
		self addEdgeAnlge: 0].
		
	selfLoops do: [:aSelfLoopEdge|
		self bestDifference: -1.	
		1 to: self edgeAngles size - 1 do: [:i| self checkAnlgePairAt: i and: i + 1].
		self checkLastAnglePair.
		self addEdgeAnlge: self newAngle.
		self newAngle ifNotNil: [
			aSelfLoopEdge selfLoopDirection: ((self newAngle degreesToRadians) cos) @ ((self newAngle degreesToRadians) sin)]]
]

{
	#category : #edgePlacement,
	#'squeak_changestamp' : 'JS 6/23/2026 20:38'
}
SKMealyNode >> checkAnlgePairAt: aNumber and: anotherNumber [

	| angle1 angle2 angleDifference |

	angle1 := self edgeAngles at: aNumber.
	angle2 := self edgeAngles at: anotherNumber.
	angleDifference := angle2 - angle1.
	(angleDifference > self bestDifference) ifTrue: [
		self newAngle: ((angle2 + angle1) / 2) \\ 360.
		self bestDifference: angleDifference]
]

{
	#category : #edgePlacement,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 09:23'
}
SKMealyNode >> checkLastAnglePair [

	| angle1 angle2 angleDifference |
	
	self edgeAngles size <= 0 ifTrue: [^ self].
	
	angle1 := self edgeAngles at: 1.
	angle2 := self edgeAngles at: self edgeAngles size.
	angleDifference :=  (360 - angle2) + angle1.
	(angleDifference > self bestDifference) ifTrue: [
				self newAngle: (angle2 + (angleDifference / 2)) \\ 360]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:13'
}
SKMealyNode >> controller [

	^ controller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 11:14'
}
SKMealyNode >> controller: aController [

	controller := aController
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 01:25'
}
SKMealyNode >> createNameLabel [

	^ StringMorph new
		contents: self name;
		color: Color black;
		center: self center;
		yourself
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 01:27'
}
SKMealyNode >> createNodeTextMorph [

	^ SKNodeTextMorph new
		contents: self name;
		center: self center;
		node: self;
		yourself
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:17'
}
SKMealyNode >> defaultSize [

	^ 75 @ 75
]

{
	#category : #'accessing - edgePlacement',
	#'squeak_changestamp' : 'Lars Kuhr 6/21/2026 15:45'
}
SKMealyNode >> edgeAngels: aAngleCollection [

	edgeAngles := aAngleCollection
]

{
	#category : #'accessing - edgePlacement',
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 09:47'
}
SKMealyNode >> edgeAngles [

	^ edgeAngles ifNil: [edgeAngles := SortedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 23:24'
}
SKMealyNode >> edges [

	^ edges ifNil: [edges := OrderedCollection new]
]

{
	#category : #edgePlacement,
	#'squeak_changestamp' : 'Lars Kuhr 6/23/2026 09:38'
}
SKMealyNode >> getEdgeAngles [

	| uniqueAngles otherNode |
	
	uniqueAngles := Set new.

	self edges do: [:aEdge|
		aEdge isSelfLoop ifFalse: [
			aEdge toNode center = self center 
				ifTrue: [otherNode := aEdge fromNode]
				ifFalse: [otherNode := aEdge toNode].
			uniqueAngles add: ((otherNode center - self center) normalized) theta radiansToDegrees]].
	^ uniqueAngles asOrderedCollection
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:55'
}
SKMealyNode >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'SLH 7/1/2026 12:28'
}
SKMealyNode >> initialize [

	super initialize.
	
	self extent: self defaultSize;
		color: self normalColor;
		borderWidth: 3;
		isStartingNode: false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:41'
}
SKMealyNode >> isInDrag [

	^ isInDrag ifNil: [isInDrag := false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:33'
}
SKMealyNode >> isInDrag: aBoolean [

	isInDrag := aBoolean
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 10:13'
}
SKMealyNode >> isStartingNode [

	^ isStartingNode ifNil: [isStartingNode := false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:32'
}
SKMealyNode >> isStartingNode: aBoolean [

	aBoolean ifTrue: [self label ifNotNil: [self label delete]].
	isStartingNode := aBoolean
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JS 6/23/2026 23:56'
}
SKMealyNode >> justDroppedInto: newOwner event: anEvent [

	newOwner addMorphFront: self.
	self isInDrag: false;
		triggerSelfLoopUpdate;
		positionInPlayground: newOwner
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/30/2026 16:25'
}
SKMealyNode >> label [

	^ label
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/30/2026 16:25'
}
SKMealyNode >> label: anObject [

	label := anObject
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JS 6/23/2026 22:09'
}
SKMealyNode >> mouseDown: anEvent [

	self controller mode = #drag ifTrue: [
		anEvent hand
		waitForClicksOrDrag: self
		event: anEvent
		selectors: {nil. nil. nil. #startDrag:}
		threshold: HandMorph dragThreshold].
	self controller nodeClicked: self

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 7/1/2026 12:22'
}
SKMealyNode >> name [

	^ name 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 10:06'
}
SKMealyNode >> name: aString [

	name := aString
]

{
	#category : #'accessing - edgePlacement',
	#'squeak_changestamp' : 'Lars Kuhr 6/21/2026 15:46'
}
SKMealyNode >> newAngle [

	^ newAngle
]

{
	#category : #'accessing - edgePlacement',
	#'squeak_changestamp' : 'Lars Kuhr 6/21/2026 15:47'
}
SKMealyNode >> newAngle: aAngle [

	newAngle := aAngle
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:45'
}
SKMealyNode >> normalColor [

	^ SKStylesheet colorOrange
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JS 6/23/2026 23:56'
}
SKMealyNode >> positionInPlayground: aPlayground [

    | posX posY |

    	posX := self position x.
	posY := self position y.

    	posX := posX max: aPlayground bounds left.

   	posX := posX min: aPlayground bounds right - self width.

    	posY := posY max: aPlayground bounds top.

    	posY := posY min: aPlayground bounds bottom - self height.

    	self position: posX @ posY.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 6/20/2026 23:25'
}
SKMealyNode >> removeEdge: aEdge [

	self edges remove: aEdge
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:45'
}
SKMealyNode >> selectedColor [

	^ SKStylesheet colorRed
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:31'
}
SKMealyNode >> setNewNameDisplay: aDisplay [

	self isStartingNode ifTrue: [^ self].
	self label ifNotNil: [self label delete].
	self label: aDisplay.
	self addMorph: aDisplay
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 01:49'
}
SKMealyNode >> showNameAsLabel [
	
	self isStartingNode ifTrue: [^ self].
	self label ifNotNil: [self name: self label contents].
	self setNewNameDisplay: self createNameLabel
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Lars 7/7/2026 01:49'
}
SKMealyNode >> showNameAsTextMorph [

	self setNewNameDisplay: self createNodeTextMorph
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:33'
}
SKMealyNode >> startDrag: anEvent [

	self controller mode = #drag ifFalse: [^ nil].
	self isInDrag: true.
	anEvent hand grabMorph: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/9/2026 13:23'
}
SKMealyNode >> stateMachineEditor [
	^ stateMachineEditor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/9/2026 13:23'
}
SKMealyNode >> stateMachineEditor: anObject [
	stateMachineEditor := anObject
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 7/1/2026 12:37'
}
SKMealyNode >> step [

	self isInDrag ifTrue: [self changed: #pos].
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 6/21/2026 15:30'
}
SKMealyNode >> stepTime [

	^ 20
]

{
	#category : #movement,
	#'squeak_changestamp' : 'Lars Kuhr 6/21/2026 15:30'
}
SKMealyNode >> triggerSelfLoopUpdate [

	| nodesToUpdate |
	
	nodesToUpdate := Set new.
	self edges do: [:aEdge| 
		nodesToUpdate add: aEdge fromNode.
		nodesToUpdate add: aEdge toNode].
	nodesToUpdate do: [:aNode| aNode updateSelfLoops]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/21/2026 15:27'
}
SKMealyNode >> updateSelfLoops [

	self calculateBestEdgeDirections;
		changed: #pos
]

{
	#category : #movement,
	#'squeak_changestamp' : 'JS 6/23/2026 23:46'
}
SKMealyNode >> wantsToBeDroppedInto: aMorph [

	^ aMorph isKindOf: SKPlayGround
]
