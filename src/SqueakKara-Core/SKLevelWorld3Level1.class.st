"
A SKLevel3World1 defines level 3 in World 1

"
Class {
	#name : #SKLevelWorld3Level1,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 22:48'
}

{
	#category : #name,
	#'squeak_changestamp' : 'JS 7/6/2026 03:21'
}
SKLevelWorld3Level1 class >> levelName [
	
	^ '3 - 1 Stronger together'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 11:06'
}
SKLevelWorld3Level1 >> blockLimit [

	^ 5
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 6/23/2026 17:24'
}
SKLevelWorld3Level1 >> build [

	self placeKaraAt: 1 @ 2 withViewDirection: SKDirection right;
		placeKaraAt: 1 @ 4 withViewDirection: SKDirection right;
		placeCloverleafAt: 7 @ 2;
		placeCloverleafAt: 7 @ 4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 02:37'
}
SKLevelWorld3Level1 >> height [
	
	^5
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 6/23/2026 16:06'
}
SKLevelWorld3Level1 >> width [
	
	^7
]
