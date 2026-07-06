"
A SKLevel2World1 defines level 2 in World 1

"
Class {
	#name : #SKLevelWorld2Level2,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 22:47'
}

{
	#category : #name,
	#'squeak_changestamp' : 'JS 7/6/2026 03:20'
}
SKLevelWorld2Level2 class >> levelName [
	
	^ '2 - 2 Critter crossing'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 11:05'
}
SKLevelWorld2Level2 >> blockLimit [

	^ 10
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 6/23/2026 18:00'
}
SKLevelWorld2Level2 >> build [

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
SKLevelWorld2Level2 >> height [
	
	^7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 10:11'
}
SKLevelWorld2Level2 >> nextLevel [

	^ 'SKLevelWorld2Level3'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 16:06'
}
SKLevelWorld2Level2 >> width [
	
	^7
]
