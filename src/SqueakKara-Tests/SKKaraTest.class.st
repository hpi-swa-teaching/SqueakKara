Class {
	#name : #SKKaraTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #SqueakKara-Tests
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'jt 6/11/2024 11:14'
}
SKKaraTest >> grid [

	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jt 6/11/2024 11:14'
}
SKKaraTest >> gridSize [

	^ 20 @ 20
]

{
	#category : #setup,
	#'squeak_changestamp' : 'jt 6/11/2024 11:14'
}
SKKaraTest >> setUp [

	grid := SKGrid newWithExtent: self gridSize
]

{
	#category : #setup,
	#'squeak_changestamp' : 'jt 6/11/2024 11:14'
}
SKKaraTest >> tearDown [

	grid abandon
]

{
	#category : #testing,
	#'squeak_changestamp' : 'jt 6/11/2024 11:28'
}
SKKaraTest >> testAbsolutePositionAfterMoveWithChangedDirection [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	kara viewDirection: 0 @ 1.
	kara move.
	self assert: kara position = (self grid position + (0 @ self grid pixelPerBlock)).

]

{
	#category : #testing,
	#'squeak_changestamp' : 'jt 6/11/2024 11:27'
}
SKKaraTest >> testAbsolutePositionAfterMoveWithDefaultDirection [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	kara move.
	self assert: kara position = (self grid position + (self grid pixelPerBlock @ 0)).

]

{
	#category : #testing,
	#'squeak_changestamp' : 'jt 6/11/2024 12:47'
}
SKKaraTest >> testKaraTurn [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	kara turn: 'left'.
	self assert: kara viewDirection = SKDirection above.
	kara turn: 'left'.
	self assert: kara viewDirection = SKDirection left.
	kara turn: 'right'.
	self assert: kara viewDirection = SKDirection above.
	kara turn: 'right'.
	self assert: kara viewDirection = SKDirection right.
	kara turn: 'right'.
	self assert: kara viewDirection = SKDirection below
]

{
	#category : #testing,
	#'squeak_changestamp' : 'jt 6/11/2024 13:27'
}
SKKaraTest >> testMoveWhenTrunkAhead [

	| kara trunk |
	
	kara := SKKara newInGrid: self grid.
	trunk := SKTrunk newInGrid: self grid at: 2 @ 1.
	kara move.
	self assert: kara coordinates = (1 @ 1)

]

{
	#category : #testing,
	#'squeak_changestamp' : 'jt 6/11/2024 13:58'
}
SKKaraTest >> testNotOnCloverleaf [

	| kara cloverleaf |
	
	kara := SKKara newInGrid: self grid.
	cloverleaf := SKCloverleaf newInGrid: self grid at: 2 @ 1.
	self assert: false = kara onCloverleaf.

]

{
	#category : #testing,
	#'squeak_changestamp' : 'jt 6/11/2024 11:57'
}
SKKaraTest >> testOnCloverleaf [

	| kara cloverleaf |
	
	kara := SKKara newInGrid: self grid.
	cloverleaf := SKCloverleaf newInGrid: self grid.
	self assert: true = kara onCloverleaf.

]

{
	#category : #testing,
	#'squeak_changestamp' : 'jt 6/11/2024 13:23'
}
SKKaraTest >> testTrunkAhead [

	| kara trunk |
	
	kara := SKKara newInGrid: self grid.
	trunk := SKTrunk newInGrid: self grid at: 2 @ 1.
	self assert: true = kara trunkAhead.

]

{
	#category : #testing,
	#'squeak_changestamp' : 'jt 6/11/2024 13:56'
}
SKKaraTest >> testTrunkAheadAfterTurn [

	| kara trunk |
	
	kara := SKKara newInGrid: self grid.
	trunk := SKTrunk newInGrid: self grid at: 1 @ 2.
	self assert: false = kara trunkAhead.
	kara turn: 'right'.
	self assert: true = kara trunkAhead
]
