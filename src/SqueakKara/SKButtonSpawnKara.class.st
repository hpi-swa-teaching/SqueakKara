"
The SKButtonSpawnKara spawn on a random free tile a kara.
"
Class {
	#name : #SKButtonSpawnKara,
	#superclass : #SKButton,
	#category : #SqueakKara,
	#'squeak_changestamp' : 'ND 6/18/2026 22:06'
}

{
	#category : #execution,
	#'squeak_changestamp' : 'LM 6/25/2026 20:56'
}
SKButtonSpawnKara >> action [

	| grid gridCoordinator freeList kara karaList karaPosition |
	
	grid := self environment grid.
	karaList := self environment karas.
	gridCoordinator := grid gridCoordinator.
	freeList := gridCoordinator findFreeFields.
	
	(freeList isEmpty or: self environment maxNumberOfKaras == karaList size) ifTrue: [ ^ self ].
	freeList removeAllSuchThat: [ :position | (gridCoordinator getTileAtCoordinates: position) isLocked ].
	
	karaPosition := freeList atRandom.
	freeList remove: karaPosition.
	freeList isEmpty ifTrue: [ ^ self ].
	
	kara := self environment addKaraAt: karaPosition.
	kara randomDirection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 22:23'
}
SKButtonSpawnKara >> textureFileName [
	
	^ 'Kara-FacingUp.png'
]
