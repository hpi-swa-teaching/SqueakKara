"
A SKLevel2World2 defines level 2 in World 2

"
Class {
	#name : #SKLevelWorld2Level4,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #name,
	#'squeak_changestamp' : 'JS 7/6/2026 09:35'
}
SKLevelWorld2Level4 class >> levelName [
	
	^ '2 - 4 Winding road'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 03:15'
}
SKLevelWorld2Level4 >> blockLimit [

	^ 25
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 7/6/2026 09:58'
}
SKLevelWorld2Level4 >> build [

	self placeKaraAt: 5 @ 9 withViewDirection: SKDirection above;
		placeTrunkAt: 1 @ 1;
		placeTrunkAt: 2 @ 1;
		placeTrunkAt: 3 @ 1;
		placeTrunkAt: 4 @ 1;
		placeTrunkAt: 5 @ 1;
		placeTrunkAt: 6 @ 1;
		placeTrunkAt: 7 @ 1;
		placeTrunkAt: 9 @ 1;
		
		placeTrunkAt: 1 @ 2;
		placeTrunkAt: 9 @ 2;
		
		placeTrunkAt: 1 @ 3;
		
		placeTrunkAt: 1 @ 4;
		placeTrunkAt: 2 @ 4;
		placeTrunkAt: 3 @ 4;
		placeTrunkAt: 4 @ 4;
		placeTrunkAt: 5 @ 4;
		placeTrunkAt: 9 @ 4;
		
		placeTrunkAt: 1 @ 5;
		placeTrunkAt: 6 @ 5;
		placeTrunkAt: 7 @ 5;
		placeTrunkAt: 9 @ 5;
		
		placeTrunkAt: 1 @ 6;
		placeTrunkAt: 4 @ 6;
		
		placeTrunkAt: 1 @ 7;
		placeTrunkAt: 3 @ 7;
		placeTrunkAt: 4 @ 7;
		placeTrunkAt: 5 @ 7;
		placeTrunkAt: 6 @ 7;
		placeTrunkAt: 7 @ 7;
		placeTrunkAt: 9 @ 7;
		
		placeTrunkAt: 9 @ 8;
		
		placeTrunkAt: 1 @ 9;
		placeTrunkAt: 2 @ 9;
		placeTrunkAt: 3 @ 9;
		placeTrunkAt: 4 @ 9;
		placeTrunkAt: 6 @ 9;
		placeTrunkAt: 7 @ 9;
		placeTrunkAt: 8 @ 9;
		placeTrunkAt: 9 @ 9;
	
		placeMushroomAt: 5 @ 3;
		"placeMushroomAt: 6 @ 4;"
		placeMushroomAt: 8 @ 4;
		placeMushroomAt: 8 @ 6;
		placeMushroomAt: 8 @ 7;
		placeMushroomAt: 3 @ 8;
		
	
		placeCloverleafAt: 2 @ 2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 09:27'
}
SKLevelWorld2Level4 >> height [
	
	^ 9
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 10:11'
}
SKLevelWorld2Level4 >> nextLevel [

	^ 'SKLevelWorld2Level5'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 09:27'
}
SKLevelWorld2Level4 >> width [
	
	^ 9
]
