Class {
	#name : #SKButtonSpawnKara,
	#superclass : #SKButton,
	#category : #SqueakKara
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 22:20'
}
SKButtonSpawnKara >> action [

	| grid gridCoordinator freeList kara karaList karaPosition |
	
	grid := self environment grid.
	karaList := self environment karas.
	gridCoordinator := grid gridCoordinator.
	freeList := gridCoordinator findFreeFields.
	
	(freeList isEmpty or: self environment maxNumberOfKaras == karaList size) ifTrue: [ ^ self ].
	
	karaPosition := freeList atRandom.
	freeList remove: karaPosition.
	freeList isEmpty ifTrue: [ ^ self ].
	
	kara := SKKara newInGrid: grid at: karaPosition with: (freeList atRandom).
	kara randomDirection.
	
	self environment addKara: kara
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 22:23'
}
SKButtonSpawnKara >> textureFileName [
	
	^ 'Kara-FacingUp.png'
]
