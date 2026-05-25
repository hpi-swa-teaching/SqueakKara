Class {
	#name : #SKCloverleafTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #'SqueakKara-Tests'
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
	#'squeak_changestamp' : 'LD 5/22/2026 12:12'
}
SKCloverleafTest >> testColorUpdate [
	| cloverleaf aForm colorChanged|
	
	cloverleaf := SKCloverleaf newInGrid: self grid.
	cloverleaf setColorToKaraColor: Color blue.
	
	colorChanged := False.
        
    aForm := cloverleaf image.
    1 to: aForm width do: [:x |
      1 to: aForm height do: [:y |
            ((aForm colorAt: x @ y) = (Color blue))
                ifTrue: [
				colorChanged := True ].
				self assert: (((aForm colorAt: x @ y) = (cloverleaf defaultColor)) not)
                  ]].
			
    self assert: (colorChanged = True)
]
