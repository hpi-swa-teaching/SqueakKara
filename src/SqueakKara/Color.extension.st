Extension { #name : #Color }

{
	#category : #'*SqueakKara-Core',
	#'squeak_changestamp' : 'LD 5/19/2026 13:31'
}
Color >> isSimilarColorTo: anotherColor [
	
	| accuracy |
	
	accuracy := 0.1.
	
	^ (self red roundTo: accuracy) == (anotherColor red roundTo: accuracy) 
		and: (self green roundTo: accuracy) == (anotherColor green roundTo: accuracy) 
		and: (self blue roundTo: accuracy) == (anotherColor blue roundTo: accuracy) 
]

{
	#category : #'*SqueakKara-Core',
	#'squeak_changestamp' : 'LD 5/21/2026 10:57'
}
Color >> notBlack [

	^ (self isSimilarColorTo: (Color black)) not
]
