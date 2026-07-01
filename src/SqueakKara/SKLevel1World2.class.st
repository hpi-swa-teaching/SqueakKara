Class {
	#name : #SKLevel1World2,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 7/1/2026 13:47'
}
SKLevel1World2 class >> levelName [
	
	^ '1 - 2 Far fields'
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 7/1/2026 13:43'
}
SKLevel1World2 >> build [

	self placeKaraAt: 1 @ 1;
		placeCloverleafAt: 2 @ 1;
		
		placeTrunkAt: 4 @ 1;
		placeTrunkAt: 4 @ 2;
		placeTrunkAt: 4 @ 3;
		
		placeTrunkAt: 1 @ 4;
		placeTrunkAt: 2 @ 4;
		placeTrunkAt: 3 @ 4;
		placeTrunkAt: 4 @ 4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/1/2026 13:41'
}
SKLevel1World2 >> height [
	
	^ 4
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 17:21'
}
SKLevel1World2 >> reset [

	self build.
	self grid enforceZOrder
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/1/2026 13:41'
}
SKLevel1World2 >> width [
	
	^ 4
]
