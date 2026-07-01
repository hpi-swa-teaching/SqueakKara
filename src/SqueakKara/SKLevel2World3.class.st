Class {
	#name : #SKLevel2World3,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #Constants,
	#'squeak_changestamp' : 'JS 7/1/2026 13:40'
}
SKLevel2World3 class >> levelName [
	
	^ '2 -3 Fungus fumble'
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 18:04'
}
SKLevel2World3 >> build [

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
SKLevel2World3 >> height [
	
	^7
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 16:08'
}
SKLevel2World3 >> reset [
	
	self build.
	self grid enforceZOrder
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 16:06'
}
SKLevel2World3 >> width [
	
	^7
]
