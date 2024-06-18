Class {
	#name : #SKGridCoordinatorTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #'SqueakKara-Tests'
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
	#'squeak_changestamp' : 'JJG 6/18/2024 11:14'
}
SKGridCoordinatorTest >> tearDown [

	grid abandon
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/12/2024 16:10'
}
SKGridCoordinatorTest >> testDeleteObject [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid.
	anotherObject := SKKara newInGrid: self grid.
	anotherObject abandon.
	
	self deny: ((anObject neighboursHere includes: anotherObject) or: (anObject neighboursHere size = 2))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:27'
}
SKGridCoordinatorTest >> testNeighbourAbove [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid at: 1 @ 1.
	anotherObject := SKKara newInGrid: self grid at: 1 @ 1 + SKDirection below.
	
	self assert: ((anotherObject neighboursAbove includes: anObject) and: (anotherObject neighboursAbove size = 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:28'
}
SKGridCoordinatorTest >> testNeighbourBelow [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid at: 1 @ 1.
	anotherObject := SKKara newInGrid: self grid at: 1 @ 1 + SKDirection below.
	
	self assert: ((anObject neighboursBelow includes: anotherObject) and: (anObject neighboursBelow size = 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/12/2024 16:10'
}
SKGridCoordinatorTest >> testNeighbourLeft [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid at: 1 @ 1 + SKDirection right.
	anotherObject := SKKara newInGrid: self grid.
	
	self assert: ((anObject neighboursLeft includes: anotherObject) and: (anObject neighboursLeft size = 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/12/2024 16:10'
}
SKGridCoordinatorTest >> testNeighbourLeftAfterDelete [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid at: 1 @ 1 + SKDirection right.
	anotherObject := SKKara newInGrid: self grid.
	anotherObject abandon.
	
	self deny: ((anObject neighboursLeft includes: anotherObject) or: (anObject neighboursLeft size = 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/12/2024 16:11'
}
SKGridCoordinatorTest >> testNeighbourLeftAfterMove [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid at: 1 @ 1 + SKDirection right.
	anotherObject := SKKara newInGrid: self grid.
	anotherObject coordinateX: anotherObject coordinateX + 2.
	
	self assert: ((anotherObject neighboursLeft includes: anObject) and: (anotherObject neighboursLeft size = 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:24'
}
SKGridCoordinatorTest >> testNeighbourRight [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid at: 1 @ 1 + SKDirection right.
	anotherObject := SKKara newInGrid: self grid.
	
	self assert: ((anotherObject neighboursRight includes: anObject) and: (anotherObject neighboursRight size = 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/12/2024 16:11'
}
SKGridCoordinatorTest >> testNeighboursHereSingleObject [

	| object |
	
	object := SKKara newInGrid: self grid.
	self assert: ((object neighboursHere includes: object) and: (object neighboursHere size = 1))
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/12/2024 16:11'
}
SKGridCoordinatorTest >> testNeighboursHereTwoObjects [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid.
	anotherObject := SKKara newInGrid: self grid.
	self assert: ((anObject neighboursHere includes: anotherObject) and: (anObject neighboursHere size = 2))
]
