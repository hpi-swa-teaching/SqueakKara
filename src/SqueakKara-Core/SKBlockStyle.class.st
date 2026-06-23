Class {
	#name : #SKBlockStyle,
	#superclass : #Morph,
	#category : #'SqueakKara-Core'
}

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/23/2026 17:33'
}
SKBlockStyle class >> blockPartHeight [
	
	^ TextStyle defaultFont lineGrid + ((TextStyle defaultFont height // 6) * 2) + ((SKBlockStyle borderWidth // 2) * 2)
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/23/2026 17:32'
}
SKBlockStyle class >> borderWidth [

	^ SKBlockStyle unit
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:40'
}
SKBlockStyle class >> tabHeight [

	^ TextStyle defaultFont height // 5 * 2
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:40'
}
SKBlockStyle class >> tabOffset [

	^ TextStyle defaultFont height // 5 * 3
]

{
	#category : #layout,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:40'
}
SKBlockStyle class >> unit [
	
	^ TextStyle defaultFont height // 6
]
