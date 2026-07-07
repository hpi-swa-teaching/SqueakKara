Class {
	#name : #SKPlayGround,
	#superclass : #Morph,
	#instVars : [
		'edges',
		'nodes',
		'controller'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 6/23/2026 23:59'
}
SKPlayGround class >> newWithController: aController [

	^ (self new
			controller: aController;
			yourself)
]

{
	#category : #dropping,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 10:57'
}
SKPlayGround >> acceptDroppingMorph: aMorph event: anEvent [

	^ true
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:47'
}
SKPlayGround >> addComponent: aComponent [

	self 
		addMorph: aComponent;
		setAllNodesToFront
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:48'
}
SKPlayGround >> addEdge: aEdge [

	aEdge controller: self controller.
	self edges add: aEdge.
	self setAllNodesToFront
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:26'
}
SKPlayGround >> addNode: aNode [

	aNode controller: self controller.
	self nodes add: aNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:24'
}
SKPlayGround >> controller [

	^ controller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:24'
}
SKPlayGround >> controller: aController [

	controller := aController 
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:18'
}
SKPlayGround >> distanceFrom: aPoint toEdge: aEdge [

			^ aEdge actionGetApproximatedDistanceToPoint: aPoint
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 10:58'
}
SKPlayGround >> distanceFrom: aPoint toLineFrom: aFromPoint to: aToPoint [

	| lineVector pointVector lineLengthSquared t projection |

	lineVector := aToPoint - aFromPoint.
	pointVector := aPoint - aFromPoint.

	lineLengthSquared := lineVector dotProduct: lineVector.

	lineLengthSquared = 0 ifTrue: [
		^ aPoint distanceTo: aFromPoint
	].

	t := (pointVector dotProduct: lineVector) / lineLengthSquared.
	t := t max: 0; min: 1.

	projection := aFromPoint + (lineVector * t).

	^ aPoint dist: projection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 12:49'
}
SKPlayGround >> edges [

	^ edges ifNil: [edges := OrderedCollection new]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:10'
}
SKPlayGround >> findAllEdgesFromNode: aNode [

	^ self edges select: [:edge | edge fromNode = aNode]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:10'
}
SKPlayGround >> findAllEdgesToNode: aNode [

	^ self edges select: [:edge | edge toNode = aNode]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/19/2026 16:09'
}
SKPlayGround >> findNearestEdge: aPosition [

	"simple but slow implementation O(n) - faster implemetation possible"
	| currentNearestEdge currentNearestDistance currentDistance |
	
	self edges size > 0 ifFalse: [^ nil].
	currentNearestDistance := Float infinity.
	
	self edges do: [:edge | 
		currentDistance := self distanceFrom: aPosition toEdge: edge.
		currentDistance < currentNearestDistance ifTrue: [
			currentNearestEdge := edge.
			currentNearestDistance := currentDistance]].
	
	^ currentNearestEdge
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 12:53'
}
SKPlayGround >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/9/2026 01:01'
}
SKPlayGround >> isNodeEmpty [

	^ self nodes isEmpty
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 12:57'
}
SKPlayGround >> mouseDown: anEvent [

	self controller playGroundClicked: anEvent position
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:04'
}
SKPlayGround >> nodes [

	^ nodes ifNil: [nodes :=  OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 16:28'
}
SKPlayGround >> removeEdge: aEdge [

	self edges remove: aEdge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:05'
}
SKPlayGround >> removeNode: aNode [

	self nodes remove: aNode
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:45'
}
SKPlayGround >> setAllNodesToFront [

	self nodes do: [:node | node comeToFront]
]

{
	#category : #dropping,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 10:55'
}
SKPlayGround >> wantsDroppedMorph: aMorph event: anEvent [

	^ true
]
