Class {
	#name : #SKStateMachineCanvas,
	#superclass : #Morph,
	#instVars : [
		'edges',
		'nodes',
		'controller'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #constructor,
	#'squeak_changestamp' : 'JS 6/23/2026 23:59'
}
SKStateMachineCanvas class >> newWithController: aController [

	^ (self new
			controller: aController;
			yourself)
]

{
	#category : #dropping,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 10:57'
}
SKStateMachineCanvas >> acceptDroppingMorph: aMorph event: anEvent [

	^ true
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:47'
}
SKStateMachineCanvas >> addComponent: aComponent [

	self 
		addMorph: aComponent;
		setAllNodesToFront
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:48'
}
SKStateMachineCanvas >> addEdge: aEdge [

	aEdge controller: self controller.
	self edges add: aEdge.
	self setAllNodesToFront
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:26'
}
SKStateMachineCanvas >> addNode: aNode [

	aNode controller: self controller.
	self nodes add: aNode
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:24'
}
SKStateMachineCanvas >> controller [

	^ controller
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:24'
}
SKStateMachineCanvas >> controller: aController [

	controller := aController 
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars 7/7/2026 09:18'
}
SKStateMachineCanvas >> distanceFrom: aPoint toEdge: aEdge [

			^ aEdge actionGetApproximatedDistanceToPoint: aPoint
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 10:58'
}
SKStateMachineCanvas >> distanceFrom: aPoint toLineFrom: aFromPoint to: aToPoint [

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
SKStateMachineCanvas >> edges [

	^ edges ifNil: [edges := OrderedCollection new]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:10'
}
SKStateMachineCanvas >> findAllEdgesFromNode: aNode [

	^ self edges select: [:edge | edge fromNode = aNode]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:10'
}
SKStateMachineCanvas >> findAllEdgesToNode: aNode [

	^ self edges select: [:edge | edge toNode = aNode]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 6/19/2026 16:09'
}
SKStateMachineCanvas >> findNearestEdge: aPosition [

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
SKStateMachineCanvas >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/9/2026 01:01'
}
SKStateMachineCanvas >> isNodeEmpty [

	^ self nodes isEmpty
]

{
	#category : #clicking,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 12:57'
}
SKStateMachineCanvas >> mouseDown: anEvent [

	self controller playGroundClicked: anEvent position
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:04'
}
SKStateMachineCanvas >> nodes [

	^ nodes ifNil: [nodes :=  OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LP 6/9/2026 16:28'
}
SKStateMachineCanvas >> removeEdge: aEdge [

	self edges remove: aEdge
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 09:05'
}
SKStateMachineCanvas >> removeNode: aNode [

	self nodes remove: aNode
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/20/2026 11:45'
}
SKStateMachineCanvas >> setAllNodesToFront [

	self nodes do: [:node | node comeToFront]
]

{
	#category : #dropping,
	#'squeak_changestamp' : 'Lars Kuhr 5/13/2026 10:55'
}
SKStateMachineCanvas >> wantsDroppedMorph: aMorph event: anEvent [

	^ true
]
