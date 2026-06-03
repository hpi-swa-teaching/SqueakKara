Class {
	#name : #SKBlockStyle,
	#superclass : #Object,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/3/2026 02:10'
}
SKBlockStyle class >> blockPartHeight [
	
	^TextStyle defaultFont lineGrid + ((TextStyle defaultFont height //6)*2) + ((SKBlockStyle borderWidth//2)*2)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/3/2026 01:34'
}
SKBlockStyle class >> borderWidth [
	
	^TextStyle defaultFont height//6
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/3/2026 02:32'
}
SKBlockStyle class >> hInset [

	^TextStyle defaultFont height //2
]
