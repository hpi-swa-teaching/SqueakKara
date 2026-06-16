Class {
	#name : #SKButtonNextChallenge,
	#superclass : #SKButton,
	#category : #SqueakKara
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 23:41'
}
SKButtonNextChallenge >> action [

	| oldEnvironment |

	oldEnvironment := SKEnvironment new perform: self environment nextChallenge.
	self environment close.
	
	^ oldEnvironment
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'ND 6/16/2026 23:37'
}
SKButtonNextChallenge >> textureFileName [
	
	^ 'arrow_next_challenge.png'
]
