"
A SKLevel2World0 defines level 2 in World 0

"
Class {
	#name : #SKLevel2World0,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 22:47'
}

{
	#category : #name,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 21:52'
}
SKLevel2World0 class >> levelName [
	
	^ 'Toadstool trouble'
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 6/23/2026 17:54'
}
SKLevel2World0 >> build [

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
SKLevel2World0 >> height [
	
	^3
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 17:53'
}
SKLevel2World0 >> width [
	
	^5
]
