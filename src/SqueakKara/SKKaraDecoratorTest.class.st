Class {
	#name : #SKKaraDecoratorTest,
	#superclass : #TestCase,
	#instVars : [
		'decorator',
		'grid',
		'kara'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:52'
}
SKKaraDecoratorTest >> decorator [

	^ decorator
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:52'
}
SKKaraDecoratorTest >> grid [

	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:54'
}
SKKaraDecoratorTest >> gridSize [

	^ 20 @ 20
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:52'
}
SKKaraDecoratorTest >> kara [

	^ kara
]

{
	#category : #setup,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:56'
}
SKKaraDecoratorTest >> setUp [

	grid := SKGrid newWithExtent: self gridSize.
	kara := SKKara newInGrid: self grid at: 1 @ 1.
	decorator := SKKaraDecorator new.
	self decorator kara: self kara.
	self decorator executer: SKExecuter new
]

{
	#category : #setup,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:51'
}
SKKaraDecoratorTest >> tearDown [

	self grid abandon
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:58'
}
SKKaraDecoratorTest >> testKaraMove [


	self decorator move.
	self assert: decorator kara coordinates = (2 @ 1)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 19:00'
}
SKKaraDecoratorTest >> testKaraNoTrunkAhead [

	self deny: decorator kara trunkAhead
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:59'
}
SKKaraDecoratorTest >> testKaraNotOnCloverleaf [

	self deny: decorator kara onCloverleaf
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 18:59'
}
SKKaraDecoratorTest >> testKaraOnCloverleaf [

	SKCloverleaf newInGrid: self grid at: 1 @ 1.
	self assert: decorator kara onCloverleaf
]

{
	#category : #testing,
	#'squeak_changestamp' : 'JJG 6/18/2024 19:01'
}
SKKaraDecoratorTest >> testKaraTrunkAhead [

	SKTrunk newInGrid: self grid at: 2 @ 1.
	self assert: decorator kara trunkAhead
]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/11/2024 15:27'
}
SKKaraDecoratorTest >> testKaraTurnLeft [


	self decorator turn: SKDirection rotateLeft.
	self assert: decorator kara viewDirection = SKDirection above
]

{
	#category : #testing,
	#'squeak_changestamp' : 'EB 7/11/2024 15:29'
}
SKKaraDecoratorTest >> testKaraTurnRight [


	self decorator turn: SKDirection rotateRight.
	self assert: decorator kara viewDirection = SKDirection below
]
