"
A SKLevel2World0 defines level 2 in World 0

"
Class {
	#name : #SKLevelWorld2Level1,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 22:47'
}

{
	#category : #name,
	#'squeak_changestamp' : 'JS 7/6/2026 03:20'
}
SKLevelWorld2Level1 class >> levelName [
	
	^ '2 - 1 Toadstool trouble'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 03:15'
}
SKLevelWorld2Level1 >> blockLimit [

	^ 25
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 6/23/2026 17:54'
}
SKLevelWorld2Level1 >> build [

	self placeKaraAt: 1 @ 2 withViewDirection: SKDirection right;
		
		placeTrunkAt: 1 @ 1;
		placeTrunkAt: 2 @ 1;
		placeTrunkAt: 3 @ 1;
		placeTrunkAt: 4 @ 1;
		placeTrunkAt: 5 @ 1;
		
		placeTrunkAt: 5 @ 2;
		
		placeTrunkAt: 1 @ 3;
		placeTrunkAt: 2 @ 3;
		placeTrunkAt: 4 @ 3;
		placeTrunkAt: 5 @ 3;
		
		placeMushroomAt: 2 @ 2;
	
		placeCloverleafAt: 3 @ 3
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 17:55'
}
SKLevelWorld2Level1 >> height [
	
	^3
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 10:11'
}
SKLevelWorld2Level1 >> nextLevel [

	^ 'SKLevelWorld2Level2'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 17:53'
}
SKLevelWorld2Level1 >> width [
	
	^5
]
