"
SKBlockStyle is a Style Reference used for SKBlocks to allow uniform sizing and coloring.

Instance Variables

"
Class {
	#name : #SKBlockStyle,
	#superclass : #Morph,
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:45'
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
	#'squeak_changestamp' : 'FR 6/23/2026 19:18'
}
SKBlockStyle class >> borderColorByCategory [

	^	Dictionary new at: #default put: SKStylesheet colorOrange;
		at: #movement put: SKStylesheet colorBlue;
		at: #sensing put: SKStylesheet colorGreen;
		at: #operators put: SKStylesheet colorDarkTeal; yourself
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 7/1/2026 14:54'
}
SKBlockStyle class >> borderWidth [

	^ SKBlockStyle unit // 2 * 2
]

{
	#category : #layout,
	#'squeak_changestamp' : 'FR 6/23/2026 19:19'
}
SKBlockStyle class >> colorByCategory [

	^	Dictionary new at: #default put: SKStylesheet colorBeige;
		at: #movement put: SKStylesheet colorLightBlue;
		at: #sensing put: SKStylesheet colorLightGreen;
		at: #operators put: SKStylesheet colorTeal; yourself
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
