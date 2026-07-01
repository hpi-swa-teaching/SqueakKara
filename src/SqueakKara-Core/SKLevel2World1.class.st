Class {
	#name : #SKLevel2World1,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/1/2026 13:40'
}
SKLevel2World1 class >> levelName [
	
	^ '2 -1 Toadstool trouble'
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 17:54'
}
SKLevel2World1 >> build [

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
SKLevel2World1 >> height [
	
	^3
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 16:08'
}
SKLevel2World1 >> reset [
	
	self build.
	self grid enforceZOrder
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 17:53'
}
SKLevel2World1 >> width [
	
	^5
]
