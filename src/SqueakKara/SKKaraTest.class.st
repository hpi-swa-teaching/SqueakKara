Class {
	#name : #SKKaraTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #'SqueakKara-Tests'
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
	#'squeak_changestamp' : 'JJG 6/18/2024 18:41'
}
SKKaraTest >> testAbsolutePositionAfterMoveWithChangedDirection [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	kara viewDirection: 0 @ 1.
	kara move.
	self assert: kara position = (self grid position + (0 @ self grid pixelPerBlock))

]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:41'
}
SKKaraTest >> testAbsolutePositionAfterMoveWithDefaultDirection [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	kara move.
	self assert: kara position = (self grid position + (self grid pixelPerBlock @ 0))

]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/11/2024 15:30'
}
SKKaraTest >> testKaraStartTurnLeftRight [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	kara turn: SKDirection rotateRight.
	kara turn: SKDirection rotateLeft.
	self assert: kara viewDirection = SKDirection right

	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:40'
}
SKKaraTest >> testKaraStartViewDirection [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	self assert: kara viewDirection = SKDirection right

	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/11/2024 15:28'
}
SKKaraTest >> testKaraTurnLeft [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	kara turn: SKDirection rotateLeft.
	self assert: kara viewDirection = SKDirection above

	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/11/2024 15:28'
}
SKKaraTest >> testKaraTurnLeftTwice [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	kara turn: SKDirection rotateLeft.
	kara turn: SKDirection rotateLeft.
	self assert: kara viewDirection = SKDirection left
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/11/2024 15:28'
}
SKKaraTest >> testKaraTurnRight [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	kara turn: SKDirection rotateRight.
	self assert: kara viewDirection = SKDirection below

]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/11/2024 15:28'
}
SKKaraTest >> testKaraTurnRightThrice [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	kara turn: SKDirection rotateRight.
	kara turn: SKDirection rotateRight.
	kara turn: SKDirection rotateRight.
	self assert: kara viewDirection = SKDirection above

]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/11/2024 15:28'
}
SKKaraTest >> testKaraTurnRightTwice [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	kara turn: SKDirection rotateRight.
	kara turn: SKDirection rotateRight.
	self assert: kara viewDirection = SKDirection left

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
	#'squeak_changestamp' : 'JJG 6/18/2024 18:40'
}
SKKaraTest >> testNoTrunkAhead [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	self deny: kara trunkAhead

]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:40'
}
SKKaraTest >> testNotOnCloverleaf [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	SKCloverleaf newInGrid: self grid at: 2 @ 1.
	self deny: kara onCloverleaf

]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:40'
}
SKKaraTest >> testOnCloverleaf [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	SKCloverleaf newInGrid: self grid.
	self assert: kara onCloverleaf

]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:39'
}
SKKaraTest >> testTrunkAhead [

	| kara |
	
	kara := SKKara newInGrid: self grid.
	SKTrunk newInGrid: self grid at: 2 @ 1.
	self assert: kara trunkAhead

]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/11/2024 15:28'
}
SKKaraTest >> testTrunkAheadAfterTurn [

	| kara trunk |
	
	kara := SKKara newInGrid: self grid.
	trunk := SKTrunk newInGrid: self grid at: 1 @ 2.
	self assert: false = kara trunkAhead.
	kara turn: SKDirection rotateRight.
	self assert: true = kara trunkAhead
]
