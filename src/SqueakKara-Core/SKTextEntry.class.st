Class {
	#name : #SKTextEntry,
	#superclass : #TextMorph,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 04:52'
}
SKTextEntry >> acceptContents [
	(self ownerThatIsA: SKBlockSpace) updateCode.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'FR 5/20/2026 04:52'
}
SKTextEntry >> initialize [
	super initialize.
	
]
