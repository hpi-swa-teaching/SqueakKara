"
SKGridTile inherits all functionality from the pre-existing class Set, existing as a class in order to allow for the existance of a NullObject.
"
Class {
	#name : #SKGridTile,
	#superclass : #Set,
	#instVars : [
		'locked'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:58'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/26/2026 09:44'
}
SKGridTile >> lockBy: anActor [

	self locked: anActor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AB 5/21/2026 19:43'
}
SKGridTile >> locked: anActor [
	
	locked := anActor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/26/2026 09:47'
}
SKGridTile >> lockedFor: anActor [

	^ (self lockingActor = anActor or: [ self lockingActor isNil ]) not
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/26/2026 09:46'
}
SKGridTile >> lockingActor [
	
	^ locked
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/22/2026 09:54'
}
SKGridTile >> unlock [

	self locked: nil
]
