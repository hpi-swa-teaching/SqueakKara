"
A SKLevel1World1 defines level 1 in World 1

"
Class {
	#name : #SKLevelWorld1Level2,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #name,
	#'squeak_changestamp' : 'JS 7/6/2026 04:34'
}
SKLevelWorld1Level2 class >> levelName [
	
	^ '1 - 2 Far Fields'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 10:16'
}
SKLevelWorld1Level2 >> blockLimit [

	^ 10
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 7/6/2026 02:38'
}
SKLevelWorld1Level2 >> build [

	self placeKaraAt: 1 @ 1;
		placeTrunkAt: 4 @ 1;
		
		placeTrunkAt: 4 @ 2;
		
		placeTrunkAt: 4 @ 3;
	
		placeTrunkAt: 1 @ 4;
		placeTrunkAt: 2 @ 4;
		placeTrunkAt: 3 @ 4;
		placeTrunkAt: 4 @ 4;
	
		placeCloverleafAt: 3 @ 3
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 02:34'
}
SKLevelWorld1Level2 >> height [
	
	^ 4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 10:11'
}
SKLevelWorld1Level2 >> nextLevel [

	^ 'SKLevelWorld1Level3'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 02:34'
}
SKLevelWorld1Level2 >> width [
	
	^ 4
]
