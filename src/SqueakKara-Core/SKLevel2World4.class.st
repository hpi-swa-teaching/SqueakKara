"
A SKLevel2World4 is defines level 2 in World 4

"
Class {
	#name : #SKLevel2World4,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 22:48'
}

{
	#category : #name,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 21:58'
}
SKLevel2World4 class >> levelName [
	
	^ 'Mycelium resistance'
]

{
	#category : #building,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 21:46'
}
SKLevel2World4 >> build [

	self placeKaraAt: 1 @ 7 withViewDirection: SKDirection above;
		placeCloverleafAt: 7 @ 5;
		placeMushroomAt: 3 @ 8;
		placeMushroomAt: 5 @ 7;
		placeMushroomAt: 7 @ 6;
		placeMushroomAt: 4 @ 3;
		placeMushroomAt: 9 @ 2;
		placeTrunkAt: 1 @ 1;
		placeTrunkAt: 2 @ 1;
		placeTrunkAt: 3 @ 1;
		placeTrunkAt: 4 @ 1;
		placeTrunkAt: 5 @ 1;
		placeTrunkAt: 6 @ 1;
		placeTrunkAt: 7 @ 1;
		placeTrunkAt: 1 @ 2;
		placeTrunkAt: 2 @ 2;
		placeTrunkAt: 2 @ 4;
		placeTrunkAt: 2 @ 5;
		placeTrunkAt: 2 @ 6;
		placeTrunkAt: 2 @ 7;
		placeTrunkAt: 1 @ 8;
		placeTrunkAt: 1 @ 9;
		placeTrunkAt: 3 @ 4;
		placeTrunkAt: 4 @ 4;
		placeTrunkAt: 5 @ 4;
		placeTrunkAt: 6 @ 4;
		placeTrunkAt: 7 @ 4;
		placeTrunkAt: 8 @ 4;
		placeTrunkAt: 5 @ 3;
		placeTrunkAt: 6 @ 3;
		placeTrunkAt: 7 @ 3;
		placeTrunkAt: 8 @ 3;
		placeTrunkAt: 10 @ 3;
		placeTrunkAt: 10 @ 4;
		placeTrunkAt: 10 @ 5;
		placeTrunkAt: 10 @ 6;
		placeTrunkAt: 10 @ 7;
		placeTrunkAt: 10 @ 8;
		placeTrunkAt: 10 @ 9;
		placeTrunkAt: 5 @ 9;
		placeTrunkAt: 6 @ 9;
		placeTrunkAt: 7 @ 9;
		placeTrunkAt: 8 @ 9;
		placeTrunkAt: 9 @ 9;
		placeTrunkAt: 7 @ 8;
		placeTrunkAt: 8 @ 8;
		placeTrunkAt: 9 @ 8;
		placeTrunkAt: 9 @ 7;
		placeTrunkAt: 4 @ 7;
		placeTrunkAt: 4 @ 6;
		placeTrunkAt: 5 @ 6;
		placeTrunkAt: 6 @ 6;
		placeTrunkAt: 8 @ 5
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 23:14'
}
SKLevel2World4 >> height [
	
	^ 9
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 23:14'
}
SKLevel2World4 >> width [
	
	^ 10
]
