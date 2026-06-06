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
	#'squeak_changestamp' : 'Gustav Meinshausen 6/6/2026 16:39'
}
SKMushroomTest >> testMushroomPushedRight [
	
	| kara mushroom|
	
	kara := SKKara newInGrid: self grid.
	mushroom := SKMushroom newInGrid: self grid at: 2 @ 1.
	kara push.
	self assert: mushroom coordinates equals: 3@1.
]
