"
SKGridNullTile overwrites the remove method of the pre-existing Set class for simpler handling within the SKGridCoordinator. It is a NullObjekt.

Instance Variables
"
Class {
	#name : #SKGridNullTile,
	#superclass : #SKGridTile,
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JanWein 7/5/2026 13:18'
}

{
	#category : #removing,
	#'squeak_changestamp' : 'LK 5/24/2024 10:54'
}
SKGridNullTile >> remove: aGridObject [

	"do nothing"
]
