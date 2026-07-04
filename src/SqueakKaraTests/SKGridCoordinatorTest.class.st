Class {
	#name : #SKGridCoordinatorTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #SqueakKaraTests
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
	#'squeak_changestamp' : 'mr 7/4/2026 11:54'
}
SKGridCoordinatorTest >> testDeleteObject [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid.
	anotherObject := SKKara newInGrid: self grid.
	anotherObject abandon.
	
	self deny: ((anObject neighboursHere includes: anotherObject) or: [ anObject neighboursHere size = 2 ])
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 5/26/2026 09:51'
}
SKGridCoordinatorTest >> testLockingAndUnlocking [

	| kara other |
	
	kara := SKKara newInGrid: self grid at: 1 @ 1.
	other := SKKara newInGrid: self grid at: 3 @ 1.
	
	kara lockAt: 2 @ 1.
	
	self deny: (kara ownsLockAt: 2 @ 1).
	self assert: (other ownsLockAt: 2 @ 1).
	
	kara unlockAt: 2 @ 1.
	
	self deny: (other ownsLockAt: 2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'jawi 5/28/2026 15:14'
}
SKGridCoordinatorTest >> testLogicalConsistencyOnResize [

	| expectedObject receivedSet oldMatrix |
	oldMatrix := self grid gridCoordinator.
	expectedObject := SKKara new initializeInGrid: grid at: 2 @ 2 with: 1 @ 1.
	expectedObject scaleToFactor.
	
	receivedSet := self grid gridCoordinator getTileAtCoordinates: 2 @ 2.
	
	self assert: (receivedSet includes: expectedObject)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:54'
}
SKGridCoordinatorTest >> testNeighbourAbove [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid at: 1 @ 1.
	anotherObject := SKKara newInGrid: self grid at: 1 @ 1 + SKDirection below.
	
	self assert: ((anotherObject neighboursAbove includes: anObject) and: [ anotherObject neighboursAbove size = 1 ])
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:54'
}
SKGridCoordinatorTest >> testNeighbourBelow [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid at: 1 @ 1.
	anotherObject := SKKara newInGrid: self grid at: 1 @ 1 + SKDirection below.
	
	self assert: ((anObject neighboursBelow includes: anotherObject) and: [ anObject neighboursBelow size = 1 ])
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:54'
}
SKGridCoordinatorTest >> testNeighbourLeft [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid at: 1 @ 1 + SKDirection right.
	anotherObject := SKKara newInGrid: self grid.
	
	self assert: ((anObject neighboursLeft includes: anotherObject) and: [ anObject neighboursLeft size = 1 ])
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:54'
}
SKGridCoordinatorTest >> testNeighbourLeftAfterDelete [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid at: 1 @ 1 + SKDirection right.
	anotherObject := SKKara newInGrid: self grid.
	anotherObject abandon.
	
	self deny: ((anObject neighboursLeft includes: anotherObject) or: [ anObject neighboursLeft size = 1 ])
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:54'
}
SKGridCoordinatorTest >> testNeighbourLeftAfterMove [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid at: 1 @ 1 + SKDirection right.
	anotherObject := SKKara newInGrid: self grid.
	anotherObject coordinates: ((anotherObject coordinates x + 2) @ anotherObject coordinates y).
	
	self assert: ((anotherObject neighboursLeft includes: anObject) and: [ anotherObject neighboursLeft size = 1 ])
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:54'
}
SKGridCoordinatorTest >> testNeighbourRight [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid at: 1 @ 1 + SKDirection right.
	anotherObject := SKKara newInGrid: self grid.
	
	self assert: ((anotherObject neighboursRight includes: anObject) and: [ anotherObject neighboursRight size = 1 ])
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:54'
}
SKGridCoordinatorTest >> testNeighboursHereSingleObject [

	| object |
	
	object := SKKara newInGrid: self grid.
	self assert: ((object neighboursHere includes: object) and: [ object neighboursHere size = 1 ])
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:55'
}
SKGridCoordinatorTest >> testNeighboursHereTwoObjects [

	| anObject anotherObject |
	
	anObject := SKKara newInGrid: self grid.
	anotherObject := SKKara newInGrid: self grid.
	self assert: ((anObject neighboursHere includes: anotherObject) and: [ anObject neighboursHere size = 2 ])
]

{
	#category : #testing,
	#'squeak_changestamp' : 'jawi 5/28/2026 17:23'
}
SKGridCoordinatorTest >> testObjectInsertion [

	| expectedObject receivedSet oldMatrix |
	oldMatrix := self grid gridCoordinator.
	expectedObject := SKKara new initializeInGrid: grid at: 2 @ 2 with: 1 @ 1.
	receivedSet := self grid gridCoordinator getTileAtCoordinates: 2 @ 2.
	
	self assert: (receivedSet includes: expectedObject)
]
