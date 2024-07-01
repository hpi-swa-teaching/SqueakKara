"
SKGridNullTile overwrites the remove method of the pre-existing Set class for simpler handling within the SKGridCoordinator.
"
Class {
	#name : #SKGridNullTile,
	#superclass : #SKGridTile,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:58'
}

{
	#category : #deletion,
	#'squeak_changestamp' : 'LK 5/24/2024 10:54'
}
SKGridNullTile >> remove: aGridObject [

	"do nothing"
]
