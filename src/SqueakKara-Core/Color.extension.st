Extension { #name : #Color }

{
	#category : #'*SqueakKara-Core',
	#'squeak_changestamp' : 'jawi 5/28/2026 18:49'
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
	#'squeak_changestamp' : 'jawi 5/28/2026 18:48'
}
Color >> notBlack [

	^ (self isSimilarColorTo: (Color black)) not
]
