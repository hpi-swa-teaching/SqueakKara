Class {
	#name : #SKLevel2World2,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/1/2026 13:40'
}
SKLevel2World2 class >> levelName [
	
	^ '2 - 2 Critter crossing'
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 18:00'
}
SKLevel2World2 >> build [

	self placeKaraAt: 1 @ 2 withViewDirection: SKDirection right;
		placeTrunkAt: 1 @ 1;
		placeTrunkAt: 2 @ 1;
		placeTrunkAt: 3 @ 1;
		placeTrunkAt: 4 @ 1;
		placeTrunkAt: 5 @ 1;
		placeTrunkAt: 6 @ 1;
		placeTrunkAt: 7 @ 1;	
		
		placeTrunkAt: 1 @ 3;
		placeTrunkAt: 2 @ 3;
		placeTrunkAt: 3 @ 3;
		placeTrunkAt: 5 @ 3;
		placeTrunkAt: 6 @ 3;
		placeTrunkAt: 7 @ 3;
		placeTrunkAt: 8 @ 3;
		placeTrunkAt: 9 @ 3;
		
		placeTrunkAt: 3 @ 4;
		placeTrunkAt: 5 @ 4;
		
		placeTrunkAt: 3 @ 5;
		placeTrunkAt: 5 @ 5;
		
		placeTrunkAt: 3 @ 6;
		placeTrunkAt: 5 @ 6;
		
		placeTrunkAt: 3 @ 7;
		placeTrunkAt: 4 @ 7;
		placeTrunkAt: 5 @ 7;
		
		placeMushroomAt: 3 @ 2;
	
		placeCloverleafAt: 4 @ 6
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 16:16'
}
SKLevel2World2 >> height [
	
	^7
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 16:08'
}
SKLevel2World2 >> reset [
	
	self build.
	self grid enforceZOrder
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 16:06'
}
SKLevel2World2 >> width [
	
	^7
]
