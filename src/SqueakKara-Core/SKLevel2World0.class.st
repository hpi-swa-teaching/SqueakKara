Class {
	#name : #SKLevel2World0,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #commands,
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
	#'squeak_changestamp' : 'JS 6/23/2026 17:49'
}
SKLevel2World0 >> levelName [
	
	^ 'Toadstool trouble'
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 16:08'
}
SKLevel2World0 >> reset [
	
	self build.
	self grid enforceZOrder
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 17:53'
}
SKLevel2World0 >> width [
	
	^5
]
