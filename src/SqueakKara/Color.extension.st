Extension { #name : #Color }

{
	#category : #'*SqueakKara',
	#'squeak_changestamp' : 'LD 5/7/2026 18:12'
}
Color >> isSimilarColorTo: anotherColor [

	^ (self red roundTo: 0.1) == (anotherColor red roundTo: 0.1) 
		and: (self green roundTo: 0.1) == (anotherColor green roundTo: 0.1) 
		and: (self blue roundTo: 0.1) == (anotherColor blue roundTo: 0.1) 
]
