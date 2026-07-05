"
A SKCloverleafTest is a test to test the funcionality of the SKCloverLeafs.

Instance Variables
	grid:		<SKGrid>

grid
	- The grid used in the tests.

"
Class {
	#name : #SKCloverleafTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #SqueakKaraTests,
	#'squeak_changestamp' : 'ND 7/5/2026 15:52'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 5/22/2026 12:12'
}
SKCloverleafTest >> grid [

	^ grid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LD 5/22/2026 12:12'
}
SKCloverleafTest >> gridSize [

	^ 20 @ 20
]

{
	#category : #running,
	#'squeak_changestamp' : 'LD 5/22/2026 12:08'
}
SKCloverleafTest >> setUp [

	grid := SKGrid newWithExtent: self gridSize
]

{
	#category : #running,
	#'squeak_changestamp' : 'LD 5/22/2026 12:08'
}
SKCloverleafTest >> tearDown [

	grid abandon
]

{
	#category : #testing,
	#'squeak_changestamp' : 'jawi 5/28/2026 16:38'
}
SKCloverleafTest >> testColorUpdate [
	
	| kara cloverleaf aForm colorChanged |
	
	colorChanged := false.
	
	kara := SKKara newInGrid: self grid at: 1 @ 1 with: 1 @ 2.
	cloverleaf := kara cloverleaf.
	
	kara color: Color blue.
 
	aForm := cloverleaf image.
	
	1 to: aForm width do: [ :x |
		1 to: aForm height do: [ :y |
            ((aForm colorAt: x @ y) = (Color blue))
			ifTrue: [
				colorChanged := true ].
				self assert: (((aForm colorAt: x @ y) = (cloverleaf defaultColor)) not)
	]].
		
	self assert: (colorChanged = true)
]
