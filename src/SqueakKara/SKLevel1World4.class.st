Class {
	#name : #SKLevel1World4,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 17:24'
}
SKLevel1World4 >> build [

	self placeKaraAt: 1 @ 2 withViewDirection: SKDirection right;
		placeTrunkAt: 1 @ 1;
		placeTrunkAt: 2 @ 1;
		placeTrunkAt: 3 @ 1;
		placeTrunkAt: 4 @ 1;
		placeTrunkAt: 5 @ 1;
		placeTrunkAt: 6 @ 1;
		placeTrunkAt: 7 @ 1;
	
		placeTrunkAt: 7 @ 2;
		placeTrunkAt: 7 @ 3;
		placeTrunkAt: 7 @ 4;
		placeTrunkAt: 7 @ 5;
		placeTrunkAt: 7 @ 6;
		placeTrunkAt: 7 @ 7;
	
		placeTrunkAt: 6 @ 7;
		placeTrunkAt: 5 @ 7;
		placeTrunkAt: 4 @ 7;
		placeTrunkAt: 3 @ 7;
		placeTrunkAt: 2 @ 7;
		placeTrunkAt: 1 @ 7;
	
		placeTrunkAt: 1 @ 6;
		placeTrunkAt: 1 @ 5;
		placeTrunkAt: 1 @ 4;
		placeTrunkAt: 1 @ 3;
	
		placeTrunkAt: 2 @ 3;
		placeTrunkAt: 3 @ 3;
		placeTrunkAt: 4 @ 3;
		placeTrunkAt: 5 @ 3;
	
		placeTrunkAt: 5 @ 3;
		placeTrunkAt: 5 @ 4;
		placeTrunkAt: 5 @ 5;
	
		placeTrunkAt: 4 @ 5;
		placeTrunkAt: 3 @ 5;
	
		placeCloverleafAt: 4 @ 4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 16:16'
}
SKLevel1World4 >> height [
	
	^7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 17:15'
}
SKLevel1World4 >> levelName [
	
	^ 'Lost in the woods' "Spiral garden"
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 16:08'
}
SKLevel1World4 >> reset [
	
	self build.
	self grid enforceZOrder
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 16:06'
}
SKLevel1World4 >> width [
	
	^7
]
