Class {
	#name : #SKLevel3World1,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 17:24'
}
SKLevel3World1 >> build [

	self placeKaraAt: 1 @ 2 withViewDirection: SKDirection right;
		placeKaraAt: 1 @ 4 withViewDirection: SKDirection right;
		placeCloverleafAt: 7 @ 2;
		placeCloverleafAt: 7 @ 4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 16:16'
}
SKLevel3World1 >> height [
	
	^7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 17:14'
}
SKLevel3World1 >> levelName [
	
	^ 'Stronger together'
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 16:08'
}
SKLevel3World1 >> reset [
	
	self build.
	self grid enforceZOrder
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 16:06'
}
SKLevel3World1 >> width [
	
	^7
]
