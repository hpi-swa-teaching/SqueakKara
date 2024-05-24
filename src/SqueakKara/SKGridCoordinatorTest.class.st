Class {
	#name : #SKGridCoordinatorTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #SqueakKara
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 5/24/2024 11:39'
}
SKGridCoordinatorTest >> grid [
	
	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 5/24/2024 11:39'
}
SKGridCoordinatorTest >> gridSize [

	^ 20 @ 20
]

{
	#category : #setup,
	#'squeak_changestamp' : 'LK 5/24/2024 11:34'
}
SKGridCoordinatorTest >> setUp [

	grid := SKGrid newWithExtent: self gridSize
]

{
	#category : #setup,
	#'squeak_changestamp' : 'LK 5/24/2024 11:34'
}
SKGridCoordinatorTest >> tearDown [

	grid abandon
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 5/24/2024 11:48'
}
SKGridCoordinatorTest >> testDeleteObject [

	| anObject anotherObject |
	
	anObject := SKGridObject newInGrid: self grid.
	anotherObject := SKGridObject newInGrid: self grid.
	anotherObject abandon.
	
	self deny: ((anObject neighboursHere includes: anotherObject) or: (anObject neighboursHere size = 2))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 5/24/2024 11:55'
}
SKGridCoordinatorTest >> testNeighbourLeft [

	| anObject anotherObject |
	
	anObject := SKGridObject newInGrid: self grid at: 1 @ 1 + SKDirection right.
	anotherObject := SKGridObject newInGrid: self grid.
	
	self assert: ((anObject neighboursLeft includes: anotherObject) and: (anObject neighboursLeft size = 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 5/24/2024 11:55'
}
SKGridCoordinatorTest >> testNeighbourLeftAfterDelete [

	| anObject anotherObject |
	
	anObject := SKGridObject newInGrid: self grid at: 1 @ 1 + SKDirection right.
	anotherObject := SKGridObject newInGrid: self grid.
	anotherObject abandon.
	
	self deny: ((anObject neighboursLeft includes: anotherObject) or: (anObject neighboursLeft size = 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 5/24/2024 11:57'
}
SKGridCoordinatorTest >> testNeighbourLeftAfterMove [

	| anObject anotherObject |
	
	anObject := SKGridObject newInGrid: self grid at: 1 @ 1 + SKDirection right.
	anotherObject := SKGridObject newInGrid: self grid.
	anotherObject coordinateX: anotherObject coordinateX + 2.
	
	self assert: ((anotherObject neighboursLeft includes: anObject) and: (anotherObject neighboursLeft size = 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 5/24/2024 11:42'
}
SKGridCoordinatorTest >> testNeighboursHereSingleObject [

	| object |
	
	object := SKGridObject newInGrid: self grid.
	self assert: ((object neighboursHere includes: object) and: (object neighboursHere size = 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LK 5/24/2024 11:45'
}
SKGridCoordinatorTest >> testNeighboursHereTwoObjects [

	| anObject anotherObject |
	
	anObject := SKGridObject newInGrid: self grid.
	anotherObject := SKGridObject newInGrid: self grid.
	self assert: ((anObject neighboursHere includes: anotherObject) and: (anObject neighboursHere size = 2))
]
