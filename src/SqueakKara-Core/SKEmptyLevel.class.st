"
A SKEmptyLevel defines an empty level


"
Class {
	#name : #SKEmptyLevel,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 22:44'
}

{
	#category : #name,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 21:56'
}
SKEmptyLevel class >> levelName [
	
	^ 'Blank project'
]

{
	#category : #building,
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
SKEmptyLevel >> width [
	
	^ 7
]
