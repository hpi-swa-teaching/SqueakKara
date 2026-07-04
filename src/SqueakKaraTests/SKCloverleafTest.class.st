Class {
	#name : #SKCloverleafTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #SqueakKaraTests
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LD 5/22/2026 12:12'
}
SKCloverleafTest >> grid [

	^ grid
]

{
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mr 7/4/2026 11:32'
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
