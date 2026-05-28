"
A SKChallenge is a static class that implementes methods for placing objects on the passed grid.
"
Class {
	#name : #SKChallenge,
	#superclass : #Object,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'LM 5/10/2026 20:27'
}

{
	#category : #challenges,
	#'squeak_changestamp' : 'LM 5/28/2026 18:58'
}
SKChallenge class >> initializeChallenge1For: anEnvironment [

	| grid |
	
	grid := anEnvironment grid.
	
	SKTrunk newInGrid: grid at: 1 @ 1.
	SKTrunk newInGrid: grid at: 2 @ 1.
	SKTrunk newInGrid: grid at: 3 @ 1.
	SKTrunk newInGrid: grid at: 4 @ 1.
	SKTrunk newInGrid: grid at: 5 @ 1.
	SKTrunk newInGrid: grid at: 6 @ 1.
	SKTrunk newInGrid: grid at: 7 @ 1.
	
	SKTrunk newInGrid: grid at: 7 @ 2.
	SKTrunk newInGrid: grid at: 7 @ 3.
	SKTrunk newInGrid: grid at: 7 @ 4.
	SKTrunk newInGrid: grid at: 7 @ 5.
	SKTrunk newInGrid: grid at: 7 @ 6.
	SKTrunk newInGrid: grid at: 7 @ 7.
	
	SKTrunk newInGrid: grid at: 6 @ 7.
	SKTrunk newInGrid: grid at: 5 @ 7.
	SKTrunk newInGrid: grid at: 4 @ 7.
	SKTrunk newInGrid: grid at: 3 @ 7.
	SKTrunk newInGrid: grid at: 2 @ 7.
	SKTrunk newInGrid: grid at: 1 @ 7.
	
	SKTrunk newInGrid: grid at: 1 @ 6.
	SKTrunk newInGrid: grid at: 1 @ 5.
	SKTrunk newInGrid: grid at: 1 @ 4.
	SKTrunk newInGrid: grid at: 1 @ 3.
	
	SKTrunk newInGrid: grid at: 2 @ 3.
	SKTrunk newInGrid: grid at: 3 @ 3.
	SKTrunk newInGrid: grid at: 4 @ 3.
	SKTrunk newInGrid: grid at: 5 @ 3.
	
	SKTrunk newInGrid: grid at: 5 @ 3.
	SKTrunk newInGrid: grid at: 5 @ 4.
	SKTrunk newInGrid: grid at: 5 @ 5.
	
	SKTrunk newInGrid: grid at: 4 @ 5.
	SKTrunk newInGrid: grid at: 3 @ 5.
	
	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 2 with: 4 @ 4)
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'LM 5/28/2026 18:58'
}
SKChallenge class >> initializeChallenge2For: anEnvironment [

	| grid |
	
	grid := anEnvironment grid.

	SKTrunk newInGrid: grid at: 3 @ 2.
	SKTrunk newInGrid: grid at: 5 @ 2.
	SKTrunk newInGrid: grid at: 7 @ 2.
	
	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 2 with: 9 @ 2)
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'LM 5/28/2026 18:57'
}
SKChallenge class >> initializeChallenge3For: anEnvironment [

	| grid |
	
	grid := anEnvironment grid.

	SKTrunk newInGrid: grid at: 2 @ 1.
	SKTrunk newInGrid: grid at: 3 @ 1.
	SKTrunk newInGrid: grid at: 4 @ 1.
	SKTrunk newInGrid: grid at: 5 @ 1.
	SKTrunk newInGrid: grid at: 6 @ 1.
	
	SKTrunk newInGrid: grid at: 4 @ 3.
	SKTrunk newInGrid: grid at: 5 @ 3.
	SKTrunk newInGrid: grid at: 6 @ 3.
	SKTrunk newInGrid: grid at: 7 @ 3.
	SKTrunk newInGrid: grid at: 8 @ 3.
	SKTrunk newInGrid: grid at: 9 @ 3.
	
	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 2 with: 9 @ 2)
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'LM 5/28/2026 18:56'
}
SKChallenge class >> initializeChallenge4For: anEnvironment [

	| grid |
	
	grid := anEnvironment grid.

	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 2 with: 7 @ 2).
	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 4 with: 7 @ 4)
]
