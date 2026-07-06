"
A SKLevel1World1 defines level 1 in World 1

"
Class {
	#name : #SKLevelWorld1Level4,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #name,
	#'squeak_changestamp' : 'JS 7/6/2026 04:35'
}
SKLevelWorld1Level4 class >> levelName [
	
	^ '1 - 4 Humbling hedges'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 03:14'
}
SKLevelWorld1Level4 >> blockLimit [

	^ 25
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 7/6/2026 02:50'
}
SKLevelWorld1Level4 >> build [

	self placeKaraAt: 1 @ 2;
		placeTrunkAt: 1 @ 1;
		placeTrunkAt: 3 @ 1;
		placeTrunkAt: 4 @ 1;
		placeTrunkAt: 5 @ 1;
		placeTrunkAt: 6 @ 1;
		placeTrunkAt: 7 @ 1;
		placeTrunkAt: 9 @ 1;
		
		placeTrunkAt: 1 @ 3;
		placeTrunkAt: 3 @ 3;
		placeTrunkAt: 4 @ 3;
		placeTrunkAt: 5 @ 3;
		placeTrunkAt: 6 @ 3;
		placeTrunkAt: 7 @ 3;
		placeTrunkAt: 9 @ 3;
		
		placeTrunkAt: 1 @ 4;
		placeTrunkAt: 3 @ 4;
		placeTrunkAt: 7 @ 4;
		placeTrunkAt: 9 @ 4;
		
		
		placeTrunkAt: 1 @ 6;
		placeTrunkAt: 3 @ 6;
		placeTrunkAt: 7 @ 6;
		placeTrunkAt: 9 @ 6;
		
		placeTrunkAt: 1 @ 7;
		placeTrunkAt: 3 @ 7;
		placeTrunkAt: 4 @ 7;
		placeTrunkAt: 5 @ 7;
		placeTrunkAt: 6 @ 7;
		placeTrunkAt: 7 @ 7;
		placeTrunkAt: 9 @ 7;
		
		placeTrunkAt: 1 @ 9;
		placeTrunkAt: 3 @ 9;
		placeTrunkAt: 4 @ 9;
		placeTrunkAt: 5 @ 9;
		placeTrunkAt: 6 @ 9;
		placeTrunkAt: 7 @ 9;
		placeTrunkAt: 9 @ 9;
		
		placeCloverleafAt: 5 @ 5
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 02:49'
}
SKLevelWorld1Level4 >> height [
	
	^ 9
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 02:49'
}
SKLevelWorld1Level4 >> width [
	
	^ 9
]
