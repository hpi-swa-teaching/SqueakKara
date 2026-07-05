"
A SKKaraProxyTest is a test to check the functionality of the SKKaraProxy.

Instance Variables
	environment:		<SKEnvironment>
	grid:		<SKGridObject>
	kara:		<SKKara>
	proxy:		<SKKaraProxy>
	scheduler:		<SKScheduler>

environment
	- The environment used by the test

grid
	- The grid used by the test

kara
	- The Kara used by the test

proxy
	- The Proxy used by the test

scheduler
	- The Scheduler used by the test 

"
Class {
	#name : #SKKaraProxyTest,
	#superclass : #TestCase,
	#instVars : [
		'grid',
		'kara',
		'scheduler',
		'environment',
		'proxy'
	],
	#category : #SqueakKaraTests,
	#'squeak_changestamp' : 'LD 7/5/2026 15:54'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 7/5/2026 15:52'
}
SKKaraProxyTest >> decorator [

	^ proxy
	
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
	#'squeak_changestamp' : 'LD 7/5/2026 15:52'
}
SKKaraProxyTest >> setUp [

	| executer |
	environment := SKEnvironment new.
	grid := SKGrid newWithExtent: self gridSize.
	environment grid: grid.
	kara := SKKara newInGrid: self grid at: 1 @ 1.

	proxy := SKKaraProxy new.
	proxy kara: kara.

	executer := SKExecuter new.
	executer testMode: true.

	scheduler := SKScheduler
		newWithActors: { proxy }
		executer: executer.

	proxy scheduler: scheduler
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
	#'squeak_changestamp' : 'LD 7/5/2026 15:52'
}
SKKaraProxyTest >> testKaraMove [

	self decorator move.

	self assert: proxy kara coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LD 7/5/2026 15:52'
}
SKKaraProxyTest >> testKaraNoTrunkAhead [

	self deny: proxy kara trunkAhead
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LD 7/5/2026 15:52'
}
SKKaraProxyTest >> testKaraNotOnCloverleaf [

	self deny: proxy kara onCloverleaf
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LD 7/5/2026 15:52'
}
SKKaraProxyTest >> testKaraOnCloverleaf [

	SKCloverleaf newInGrid: self grid at: 1 @ 1.
	self assert: proxy kara onCloverleaf
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LD 7/5/2026 15:52'
}
SKKaraProxyTest >> testKaraTrunkAhead [

	SKTrunk newInGrid: self grid at: 2 @ 1.
	self assert: proxy kara trunkAhead
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LD 7/5/2026 15:52'
}
SKKaraProxyTest >> testKaraTurnLeft [


	self decorator turn: SKDirection rotateLeft.
	self assert: proxy kara viewDirection = SKDirection above
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LD 7/5/2026 15:52'
}
SKKaraProxyTest >> testKaraTurnRight [


	self decorator turn: SKDirection rotateRight.
	self assert: proxy kara viewDirection = SKDirection below
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
