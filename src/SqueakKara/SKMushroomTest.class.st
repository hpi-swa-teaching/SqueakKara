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
	#'squeak_changestamp' : 'Gustav Meinshausen 6/7/2026 20:45'
}
SKMushroomTest >> testMushroomPushedDown [
		
	| mushroom |
	
	mushroom := SKMushroom newInGrid: self grid at: 3 @ 4.
	SKKara newInGrid: self grid at: 3 @ 3;
		viewDirection: SKDirection below;
		push.
	self assert: mushroom coordinates equals: 3 @ 5.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/7/2026 20:45'
}
SKMushroomTest >> testMushroomPushedIntoTrunk [
		
	| mushroom |
	
	mushroom := SKMushroom newInGrid: self grid at: 4 @ 3.
	SKMushroom newInGrid: self grid at: 5 @ 3.
	SKKara newInGrid: self grid at: 3 @ 3;
		viewDirection: SKDirection right;
		push.
	self assert: mushroom coordinates equals: 4 @ 3.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/7/2026 20:45'
}
SKMushroomTest >> testMushroomPushedLeft [
		
	| mushroom |
	
	mushroom := SKMushroom newInGrid: self grid at: 2 @ 3.
	SKKara newInGrid: self grid at: 3 @ 3;
		viewDirection: SKDirection left;
		push.
	self assert: mushroom coordinates equals: 1 @ 3.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/7/2026 20:45'
}
SKMushroomTest >> testMushroomPushedOutOfBounds [
		
	| mushroom |
	
	mushroom := SKMushroom newInGrid: self grid at: 1 @ 3.
	SKKara newInGrid: self grid at: 2 @ 3;
		viewDirection: SKDirection left;
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
	#'squeak_changestamp' : 'Gustav Meinshausen 6/7/2026 20:45'
}
SKMushroomTest >> testMushroomPushedRight [
		
	| mushroom |
	
	mushroom := SKMushroom newInGrid: self grid at: 4 @ 3.
	SKKara newInGrid: self grid at: 3 @ 3;
		viewDirection: SKDirection right;
		push.
	self assert: mushroom coordinates equals: 5 @ 3.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/7/2026 20:45'
}
SKMushroomTest >> testMushroomPushedUp [
		
	| mushroom |
	
	mushroom := SKMushroom newInGrid: self grid at: 3 @ 2.
	SKKara newInGrid: self grid at: 3 @ 3;
		viewDirection: SKDirection above;
		push.
	self assert: mushroom coordinates equals: 3 @ 1.
]
