"
The SKButtonNextChallenge implements the button to switch to the next challenge after finishing the current level.
"
Class {
	#name : #SKButtonNextChallenge,
	#superclass : #SKButton,
	#category : #SqueakKara,
	#'squeak_changestamp' : 'ND 6/18/2026 22:04'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:41'
}
SKButtonNextChallenge >> action [

	| oldEnvironment |

	oldEnvironment := SKEnvironment new perform: self environment nextChallenge.
	self environment close.
	
	^ oldEnvironment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/16/2026 23:37'
}
SKButtonNextChallenge >> textureFileName [
	
	^ 'arrow_next_challenge.png'
]
