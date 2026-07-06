"
A SKLevel2World2 defines level 2 in World 2

"
Class {
	#name : #SKLevelWorld2Level3,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 22:47'
}

{
	#category : #name,
	#'squeak_changestamp' : 'JS 7/6/2026 03:20'
}
SKLevelWorld2Level3 class >> levelName [
	
	^ '2 - 3 Fungus fumble'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 11:05'
}
SKLevelWorld2Level3 >> blockLimit [

	^ 10
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 6/23/2026 18:04'
}
SKLevelWorld2Level3 >> build [

	self placeKaraAt: 1 @ 3 withViewDirection: SKDirection right;
		placeTrunkAt: 1 @ 1;
		placeTrunkAt: 2 @ 1;
		placeTrunkAt: 3 @ 1;
		placeTrunkAt: 4 @ 1;
		placeTrunkAt: 5 @ 1;
		
		placeTrunkAt: 1 @ 2;
		placeTrunkAt: 5 @ 2;
		
		placeTrunkAt: 5 @ 3;
		
		placeTrunkAt: 1 @ 4;
		placeTrunkAt: 2 @ 4;
		placeTrunkAt: 3 @ 4;
		placeTrunkAt: 5 @ 4;
		
		placeTrunkAt: 3 @ 5;
		placeTrunkAt: 4 @ 5;
		placeTrunkAt: 5 @ 5;
		
		placeMushroomAt: 3 @ 3;
	
		placeCloverleafAt: 4 @ 4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 16:16'
}
SKLevelWorld2Level3 >> height [
	
	^7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 10:11'
}
SKLevelWorld2Level3 >> nextLevel [

	^ 'SKLevelWorld2Level4'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 16:06'
}
SKLevelWorld2Level3 >> width [
	
	^7
]
