Class {
	#name : #SKLevel3World1,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #name,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 21:58'
}
SKLevel3World1 class >> levelName [
	
	^ 'Stronger together'
]

{
	#category : #building,
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
	#'squeak_changestamp' : 'JS 6/23/2026 16:06'
}
SKLevel3World1 >> width [
	
	^7
]
