"
SKGridNullTile overwrites the remove method of the pre-existing set class for simpler handling within the SKGridCoordinator. It is a NullObjekt.

Instance Variables
"
Class {
	#name : #SKGridNullTile,
	#superclass : #SKGridTile,
	#category : #SqueakKara,
	#'squeak_changestamp' : 'AB 7/5/2026 13:30'
}

{
	#category : #removing,
	#'squeak_changestamp' : 'LK 5/24/2024 10:54'
}
SKGridNullTile >> remove: aGridObject [

	"do nothing"
]
