Class {
	#name : #SKLevel1World1,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #building,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 11:41'
}
SKLevel1World1 >> build [

	self placeKaraAt: 1 @ 1;
		placeCloverleafAt: 2 @ 1
]

{
	#category : #building,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 15:32'
}
SKLevel1World1 >> height [
	
	^ 2
]

{
	#category : #building,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 15:34'
}
SKLevel1World1 >> levelName [
	
	^ 'Level 1 World 1'
]

{
	#category : #building,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 16:04'
}
SKLevel1World1 >> width [
	
	^ 2
]
