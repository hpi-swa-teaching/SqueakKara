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
	#'squeak_changestamp' : 'LM 5/22/2026 11:51'
}
SKGridTile >> lockFor: anActor [

	self locked: anActor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AB 5/21/2026 19:21'
}
SKGridTile >> locked [
	
	^ locked
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
	#'squeak_changestamp' : 'AB 5/21/2026 20:03'
}
SKGridTile >> lockedFor: anActor [

	^ (self locked = anActor or: [ self locked isNil ]) not
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/22/2026 09:54'
}
SKGridTile >> unlock [

	self locked: nil
]
