Class {
	#name : #SKKaraTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #SqueakKaraTests
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
	#category : #helper,
	#'squeak_changestamp' : 'mr 6/12/2026 21:08'
}
SKKaraTest >> testCollectCloverleaf [

	| kara karaOtherColor |
	
	kara := SKKara new.
	kara initializeInGrid: self grid at: 1 @ 1 with: 2 @ 1.
	kara cloverleaf setColorToKaraColor: Color red.
	kara move.
	kara collectCloverleaf.
	self assert: self grid allLeavesCollected.
	
	karaOtherColor := SKKara new.
	karaOtherColor initializeInGrid: self grid at: 1 @ 1 with: 2 @ 1.
	karaOtherColor cloverleaf setColorToKaraColor: Color green.
	self assert: karaOtherColor cloverleaf coordinates = (2 @ 1).
	kara collectCloverleaf.
	self assert: self grid allLeavesCollected not.
]

{
	#category : #helper,
	#'squeak_changestamp' : 'LM 5/23/2026 14:08'
}
SKKaraTest >> testColorUsingNewColorPicker: aBoolean [
    | kara aForm colorChanged |
    
    kara := SKKara newInGrid: self grid.
    
    aBoolean ifTrue: [ kara color: Color green ]
    ifFalse: [ kara fillStyle: Color green ].
    
    colorChanged := False.
        
    aForm := kara image.
    1 to: aForm width do: [:x |
      1 to: aForm height do: [:y |
            ((aForm colorAt: x @ y) = (Color green))
                ifTrue: [
				colorChanged := True ].
				self assert: (((aForm colorAt: x @ y) = (kara defaultColor)) not)
                  ]].
			
    self assert: (colorChanged = True)
]

{
	#category : #helper,
	#'squeak_changestamp' : 'mr 6/16/2026 13:12'
}
SKKaraTest >> testDirectionalTile [

	| kara directionalTile1 directionalTile2 |
	
	kara := SKKara new.
	kara initializeInGrid: self grid at: (1 @ 1) with: (4 @ 1).
	
	directionalTile1 := SKDirectionalTile newInGrid: self grid at: (2 @ 1) enterFrom: SKDirection left.
	directionalTile2 := SKDirectionalTile newInGrid: self grid at: (3 @ 1) enterFrom: SKDirection right.
	
	kara move.
	self assert: kara coordinates = directionalTile1 coordinates.
	
	kara move.
	self deny: kara coordinates = directionalTile2 coordinates.
	
	kara turn: SKDirection rotateRight.
	kara move.
	self assert: kara coordinates = (2 @ 2)
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 5/23/2026 18:43'
}
SKKaraTest >> testKaraDeleteClosesWorkspace [

	| kara workspace executer closed |
	
	kara := SKKara newInGrid: self grid at: 1 @ 1.
	executer := SKExecuter new.
	workspace := SKWorkspace newWithExecuter: executer and: kara.
	kara workspace: workspace.
	
	closed := false.
	workspace closeListener: [ closed := true ].
	
	kara delete.
	
	self assert: closed.
	self deny: ((self grid gridCoordinator getTileAtCoordinates: 1 @ 1)
		includes: kara)
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
	#'squeak_changestamp' : 'LD 5/21/2026 10:44'
}
SKKaraTest >> testNewColorPicker [

	self testColorUsingNewColorPicker: true
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
	#'squeak_changestamp' : 'LD 5/21/2026 12:07'
}
SKKaraTest >> testOldColorPicker [

	self testColorUsingNewColorPicker: false
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
	#category : #helper,
	#'squeak_changestamp' : 'mr 6/5/2026 13:00'
}
SKKaraTest >> testRejectCloverleaf [

	| kara cloverleaf |
	
	kara := SKKara newInGrid: self grid.
	cloverleaf := SKCloverleaf newInGrid: self grid at: 2@1.
	kara move.
	self assert: self grid allLeavesCollected not
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

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 5/23/2026 18:39'
}
SKKaraTest >> testWorkspaceCloseDeletesKara [

	| kara workspace executer |
	
	kara := SKKara newInGrid: self grid at: 1 @ 1.
	executer := SKExecuter new.
	workspace := SKWorkspace newWithExecuter: executer and: kara.
	kara workspace: workspace.
	
	workspace close.
	
	self deny: ((self grid gridCoordinator getTileAtCoordinates: 1 @ 1)
		includes: kara)
]
