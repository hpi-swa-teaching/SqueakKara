Class {
	#name : #SKKaraProxyTest,
	#superclass : #TestCase,
	#instVars : [
		'decorator',
		'grid',
		'kara',
		'scheduler',
		'environment'
	],
	#category : #SqueakKaraTests
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:52'
}
SKKaraProxyTest >> decorator [

	^ decorator
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:52'
}
SKKaraProxyTest >> grid [

	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:54'
}
SKKaraProxyTest >> gridSize [

	^ 20 @ 20
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:52'
}
SKKaraProxyTest >> kara [

	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/7/2026 23:15'
}
SKKaraProxyTest >> scheduler [

	^ scheduler
]

{
	#category : #setup,
	#'squeak_changestamp' : 'LD 6/25/2026 20:25'
}
SKKaraProxyTest >> setUp [

	| executer |
	environment := SKEnvironment new.
	grid := SKGrid newWithExtent: self gridSize.
	environment grid: grid.
	kara := SKKara newInGrid: self grid at: 1 @ 1.

	decorator := SKKaraProxy new.
	decorator kara: kara.

	executer := SKExecuter new.
	executer testMode: true.

	scheduler := SKScheduler
		newWithActors: { decorator }
		executer: executer.

	decorator scheduler: scheduler
]

{
	#category : #setup,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:51'
}
SKKaraProxyTest >> tearDown [

	self grid abandon
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 5/7/2026 23:20'
}
SKKaraProxyTest >> testKaraMove [

	self decorator move.

	self assert: decorator kara coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 19:00'
}
SKKaraProxyTest >> testKaraNoTrunkAhead [

	self deny: decorator kara trunkAhead
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:59'
}
SKKaraProxyTest >> testKaraNotOnCloverleaf [

	self deny: decorator kara onCloverleaf
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:59'
}
SKKaraProxyTest >> testKaraOnCloverleaf [

	SKCloverleaf newInGrid: self grid at: 1 @ 1.
	self assert: decorator kara onCloverleaf
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 19:01'
}
SKKaraProxyTest >> testKaraTrunkAhead [

	SKTrunk newInGrid: self grid at: 2 @ 1.
	self assert: decorator kara trunkAhead
]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/11/2024 15:27'
}
SKKaraProxyTest >> testKaraTurnLeft [


	self decorator turn: SKDirection rotateLeft.
	self assert: decorator kara viewDirection = SKDirection above
]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/11/2024 15:29'
}
SKKaraProxyTest >> testKaraTurnRight [


	self decorator turn: SKDirection rotateRight.
	self assert: decorator kara viewDirection = SKDirection below
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 5/23/2026 18:45'
}
SKKaraProxyTest >> testTwoKarasBehindEachOtherMove [

	| frontKara backProxy frontProxy executer localScheduler |
	
	frontKara := SKKara newInGrid: self grid at: 2 @ 1.
	
	backProxy := SKKaraProxy newWith: self kara.
	frontProxy := SKKaraProxy newWith: frontKara.
	
	executer := SKExecuter new.
	executer testMode: true.
	localScheduler := SKScheduler
		newWithActors: { backProxy. frontProxy }
		executer: executer.
	
	backProxy scheduler: localScheduler.
	frontProxy scheduler: localScheduler.
	
	localScheduler
		scheduleAction: (SKAction newWithType: #move action: [ backProxy moveAction ])
		for: backProxy.
	
	localScheduler
		scheduleAction: (SKAction newWithType: #move action: [ frontProxy moveAction ])
		for: frontProxy.
	
	self assert: self kara coordinates equals: 2 @ 1.
	self assert: frontKara coordinates equals: 3 @ 1
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 5/23/2026 18:45'
}
SKKaraProxyTest >> testTwoKarasCannotMoveIntoSameField [

	| leftKara rightKara leftProxy rightProxy executer localScheduler |
	leftKara := SKKara newInGrid: self grid at: 1 @ 1.
	rightKara := SKKara newInGrid: self grid at: 3 @ 1.
	rightKara viewDirection: SKDirection left.
	
	leftProxy := SKKaraProxy newWith: leftKara.
	rightProxy := SKKaraProxy newWith: rightKara.
	
	executer := SKExecuter new.
	executer testMode: true.
	localScheduler := SKScheduler
		newWithActors: { leftProxy. rightProxy }
		executer: executer.
	
	leftProxy scheduler: localScheduler.
	rightProxy scheduler: localScheduler.
	
	localScheduler
		scheduleAction: (SKAction newWithType: #move action: [ leftProxy moveAction ])
		for: leftProxy.
	
	localScheduler
		scheduleAction: (SKAction newWithType: #move action: [ rightProxy moveAction ])
		for: rightProxy.
	
	self assert: (((self grid gridCoordinator getTileAtCoordinates: 2 @ 1)
		select: [ :each | each isKara ]) size <= 1)
]
