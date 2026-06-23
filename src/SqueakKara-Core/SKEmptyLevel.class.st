Class {
	#name : #SKEmptyLevel,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 18:44'
}
SKEmptyLevel >> build [

	self placeKaraAt: 1 @ 1
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 18:44'
}
SKEmptyLevel >> height [
	
	^ 7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 18:44'
}
SKEmptyLevel >> levelName [
	
	^ 'Blank project'
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 17:21'
}
SKEmptyLevel >> reset [

	self build.
	self grid enforceZOrder
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 18:44'
}
SKEmptyLevel >> width [
	
	^ 7
]
