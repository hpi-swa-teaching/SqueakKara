"
A SKLevel1World1 defines level 1 in World 1

"
Class {
	#name : #SKLevelWorld1Level1,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 22:46'
}

{
	#category : #name,
	#'squeak_changestamp' : 'JS 7/6/2026 03:20'
}
SKLevelWorld1Level1 class >> levelName [
	
	^ '1 - 1 Rainbows and sunshine'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 03:13'
}
SKLevelWorld1Level1 >> blockLimit [

	^ 2
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 6/23/2026 17:24'
}
SKLevelWorld1Level1 >> build [

	self placeKaraAt: 1 @ 1;
		placeCloverleafAt: 2 @ 1
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 02:34'
}
SKLevelWorld1Level1 >> height [
	
	^ 4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'JS 7/6/2026 02:34'
}
SKLevelWorld1Level1 >> width [
	
	^ 4
]
