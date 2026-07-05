"
SKGridTile inherits all functionality from the pre-existing class Set, existing as a class in order to allow for the existance of a NullObject.

Instance Variables
	lockingActor:		<SKGridObjekt>

lockingActor
	- A SKGridObjekt that looks the Tile.
"
Class {
	#name : #SKGridTile,
	#superclass : #Set,
	#instVars : [
		'lockingActor'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JanWein 7/5/2026 13:21'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 6/25/2026 20:47'
}
SKGridTile >> isFree [

	^ self noneSatisfy: [ :gridObject | gridObject isBlocking ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 6/25/2026 20:55'
}
SKGridTile >> isLocked [

	^ self lockingActor isNil not
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/29/2026 12:52'
}
SKGridTile >> lockBy: anActor [

	self lockingActor: anActor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 7/4/2026 11:24'
}
SKGridTile >> lockedFor: anActor [

	^ (self lockingActor = anActor or: [ self isLocked not ]) not
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/29/2026 12:52'
}
SKGridTile >> lockingActor [
	
	^ lockingActor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/29/2026 12:52'
}
SKGridTile >> lockingActor: anActor [
	
	lockingActor := anActor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/29/2026 12:52'
}
SKGridTile >> unlock [

	self lockingActor: nil
]
