Class {
	#name : #SKBlockStyle,
	#superclass : #Morph,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/8/2026 01:15'
}
SKBlockStyle class >> blockPartHeight [
	
	^TextStyle defaultFont lineGrid + ((TextStyle defaultFont height //6)*2) + ((SKBlockStyle borderWidth//2)*2)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/8/2026 01:18'
}
SKBlockStyle class >> borderWidth [

	^SKBlockStyle unit
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/8/2026 01:15'
}
SKBlockStyle class >> tabHeight [

	^TextStyle defaultFont height //5*2
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/8/2026 01:16'
}
SKBlockStyle class >> tabOffset [

	^TextStyle defaultFont height //5*3
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 6/8/2026 01:16'
}
SKBlockStyle class >> unit [
	
	^TextStyle defaultFont height//6
]
