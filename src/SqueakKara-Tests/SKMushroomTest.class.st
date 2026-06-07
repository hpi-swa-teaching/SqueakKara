Class {
	#name : #SKMushroomTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #'SqueakKara-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/6/2026 14:26'
}
SKMushroomTest >> grid [

	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/6/2026 14:27'
}
SKMushroomTest >> gridSize [

	^ 20 @ 20
]

{
	#category : #setup,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/6/2026 14:27'
}
SKMushroomTest >> setUp [

	grid := SKGrid newWithExtent: self gridSize
]

{
	#category : #setup,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/6/2026 14:27'
}
SKMushroomTest >> tearDown [

	grid abandon
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/8/2026 01:53'
}
SKMushroomTest >> testMushroomPushedDown [
		
	| mushroom kara |
	
	mushroom := SKMushroom newInGrid: self grid at: 3 @ 4.
	kara := SKKara newInGrid: self grid at: 3 @ 3.
	kara viewDirection: SKDirection below;
		push.
	self assert: mushroom coordinates equals: 3 @ 5.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/8/2026 01:53'
}
SKMushroomTest >> testMushroomPushedIntoTrunk [
		
	| mushroom kara |
	
	mushroom := SKMushroom newInGrid: self grid at: 4 @ 3.
	SKMushroom newInGrid: self grid at: 5 @ 3.
	kara := SKKara newInGrid: self grid at: 3 @ 3.
	kara viewDirection: SKDirection right;
		push.
	self assert: mushroom coordinates equals: 4 @ 3.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/8/2026 01:53'
}
SKMushroomTest >> testMushroomPushedLeft [
		
	| mushroom kara |
	
	mushroom := SKMushroom newInGrid: self grid at: 2 @ 3.
	kara := SKKara newInGrid: self grid at: 3 @ 3.
	kara viewDirection: SKDirection left;
		push.
	self assert: mushroom coordinates equals: 1 @ 3.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/8/2026 01:52'
}
SKMushroomTest >> testMushroomPushedOutOfBounds [
		
	| mushroom kara |
	
	mushroom := SKMushroom newInGrid: self grid at: 1 @ 3.
	kara := SKKara newInGrid: self grid at: 2 @ 3.
	kara viewDirection: SKDirection left;
		push.
	self assert: mushroom coordinates equals: 1 @ 3.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/7/2026 19:47'
}
SKMushroomTest >> testMushroomPushedOverCloverleaf [
		
	| kara |
	
	SKMushroom newInGrid: self grid at: 4 @ 3.
	SKCloverleaf newInGrid: self grid at: 5 @ 3.
	kara := SKKara newInGrid: self grid at: 3 @ 3;
		viewDirection: SKDirection right;
		push;
		move;
		push;
		move.
	self assert: kara onCloverleaf.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/8/2026 01:49'
}
SKMushroomTest >> testMushroomPushedRight [
		
	| mushroom kara |
	
	mushroom := SKMushroom newInGrid: self grid at: 4 @ 3.
	kara := SKKara newInGrid: self grid at: 3 @ 3.
	kara viewDirection: SKDirection right;
		push.
	self assert: mushroom coordinates equals: 5 @ 3.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/8/2026 01:52'
}
SKMushroomTest >> testMushroomPushedUp [
		
	| mushroom kara |
	
	mushroom := SKMushroom newInGrid: self grid at: 3 @ 2.
	kara := SKKara newInGrid: self grid at: 3 @ 3.
	kara viewDirection: SKDirection above;
		push.
	self assert: mushroom coordinates equals: 3 @ 1.
]
