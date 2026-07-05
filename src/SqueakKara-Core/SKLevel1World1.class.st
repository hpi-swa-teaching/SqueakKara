Class {
	#name : #SKLevel1World1,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #name,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/5/2026 21:55'
}
SKLevel1World1 class >> levelName [
	
	^ 'Rainbows and sunshine'
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 6/23/2026 17:24'
}
SKLevel1World1 >> build [

	self placeKaraAt: 1 @ 1;
		placeCloverleafAt: 2 @ 1
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 15:32'
}
SKLevel1World1 >> height [
	
	^ 2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 16:04'
}
SKLevel1World1 >> width [
	
	^ 2
]
