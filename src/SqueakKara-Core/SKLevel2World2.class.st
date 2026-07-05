Class {
	#name : #SKLevel2World2,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #name,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 21:57'
}
SKLevel2World2 class >> levelName [
	
	^ 'Fungus fumble'
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 6/23/2026 18:04'
}
SKLevel2World2 >> build [

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
SKLevel2World2 >> height [
	
	^7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 16:06'
}
SKLevel2World2 >> width [
	
	^7
]
