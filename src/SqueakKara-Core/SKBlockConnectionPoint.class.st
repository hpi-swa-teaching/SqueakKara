Class {
	#name : #SKBlockConnectionPoint,
	#superclass : #Object,
	#instVars : [
		'block',
		'blockPart',
		'positionCalculation',
		'type',
		'connectedBlock'
	],
	#category : #'SqueakKara-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:35'
}
SKBlockConnectionPoint >> block [

	^ block.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:35'
}
SKBlockConnectionPoint >> block: anSKBlock [

	block := anSKBlock.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:35'
}
SKBlockConnectionPoint >> blockPart [

	^ blockPart.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:35'
}
SKBlockConnectionPoint >> blockPart: aBlockPart [

	blockPart := aBlockPart.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:53'
}
SKBlockConnectionPoint >> connectedBlock [

	^ connectedBlock.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:53'
}
SKBlockConnectionPoint >> connectedBlock: anSKBlock [

	connectedBlock := anSKBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/4/2026 17:27'
}
SKBlockConnectionPoint >> dist: anotherBlockConnectionPoint [

	^ self positionCalculation value dist: (anotherBlockConnectionPoint positionCalculation value).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 10:33'
}
SKBlockConnectionPoint >> position [

	^ positionCalculation value.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:32'
}
SKBlockConnectionPoint >> positionCalculation [

	^ positionCalculation.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:33'
}
SKBlockConnectionPoint >> positionCalculation: aBlock [

	positionCalculation := aBlock.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:37'
}
SKBlockConnectionPoint >> type [

	^ type.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'SLH 6/4/2026 09:38'
}
SKBlockConnectionPoint >> type: aType [

	type := aType.
]
