Class {
	#name : #SKBlockStyle,
	#superclass : #Morph,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:40'
}
SKBlockStyle class >> blockPartHeight [
	
	^ TextStyle defaultFont lineGrid + ((TextStyle defaultFont height // 6) * 2) + ((SKBlockStyle borderWidth // 2) * 2)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:40'
}
SKBlockStyle class >> borderWidth [

	^ SKBlockStyle unit
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:40'
}
SKBlockStyle class >> tabHeight [

	^ TextStyle defaultFont height // 5 * 2
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:40'
}
SKBlockStyle class >> tabOffset [

	^ TextStyle defaultFont height // 5 * 3
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:40'
}
SKBlockStyle class >> unit [
	
	^ TextStyle defaultFont height // 6
]
