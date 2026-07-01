Class {
	#name : #SKLevel1World1,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 7/1/2026 13:48'
}
SKLevel1World1 class >> levelName [
	
	^ '1 - 1 Rainbows and sunshine'
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 7/1/2026 13:47'
}
SKLevel1World1 >> build [

	self placeKaraAt: 1 @ 1;
		placeCloverleafAt: 2 @ 1
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/1/2026 13:41'
}
SKLevel1World1 >> height [
	
	^ 4
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 17:21'
}
SKLevel1World1 >> reset [

	self build.
	self grid enforceZOrder
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/1/2026 13:41'
}
SKLevel1World1 >> width [
	
	^ 4
]
