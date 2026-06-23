Class {
	#name : #SKLevel1World1,
	#superclass : #SKLevel,
	#category : #'SqueakKara-Core'
}

{
	#category : #commands,
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
	#'squeak_changestamp' : 'JS 6/23/2026 17:14'
}
SKLevel1World1 >> levelName [
	
	^ 'Rainbows and sunshine'
]

{
	#category : #commands,
	#'squeak_changestamp' : 'JS 6/23/2026 17:21'
}
SKLevel1World1 >> reset [

	self build.
	self grid enforceZOrder
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Gustav Meinshausen 6/20/2026 16:04'
}
SKLevel1World1 >> width [
	
	^ 2
]
