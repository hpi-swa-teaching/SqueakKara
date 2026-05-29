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
	#'squeak_changestamp' : 'AB 5/29/2026 10:31'
}
SKChallenge class >> initializeChallenge1For: anEnvironment [

	| grid |
	
	grid := anEnvironment grid.
	
	1 to: 7 do: [ :x | SKTrunk newInGrid: grid at: x @ 1 ].
	1 to: 7 do: [ :x | SKTrunk newInGrid: grid at: x @ 7 ].
	1 to: 6 do: [ :y | SKTrunk newInGrid: grid at: 1 @ y ].
	1 to: 6 do: [ :y | SKTrunk newInGrid: grid at: 7 @ y ].

	2 to: 5 do: [ :x | SKTrunk newInGrid: grid at: x @ 3 ].
	3 to: 5 do: [ :y | SKTrunk newInGrid: grid at: 5 @ y ].
	3 to: 4 do: [ :x | SKTrunk newInGrid: grid at: x @ 5 ].
	
	anEnvironment addKara: (SKKara newInGrid: grid at: 2 @ 2 with: 4 @ 4)
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'AB 5/29/2026 10:18'
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
	#'squeak_changestamp' : 'AB 5/29/2026 10:19'
}
SKChallenge class >> initializeChallenge3For: anEnvironment [

	| grid |
	
	grid := anEnvironment grid.

	2 to: 6 do: [ :x | SKTrunk newInGrid: grid at: x @ 1 ].
	4 to: 9 do: [ :x | SKTrunk newInGrid: grid at: x @ 3 ].
	
	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 2 with: 9 @ 2)
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'AB 5/29/2026 10:32'
}
SKChallenge class >> initializeChallenge4For: anEnvironment [

	| grid |
	
	grid := anEnvironment grid.

	1 to: 3 do: [ :x |
		2 to: 3 do: [ :y |
			SKTrunk newInGrid: grid at: x @ y ]].
	
	5 to: 6 do: [ :x | SKTrunk newInGrid: grid at: x @ 1 ].
	
	5 to: 6 do: [ :x | SKTrunk newInGrid: grid at: x @ 4 ].

	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 1 with: 7 @ 1).
	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 4 with: 7 @ 4)
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'AB 5/29/2026 10:29'
}
SKChallenge class >> initializeChallenge5For: aGrid environment: anEnvironment [
	
	| grid |
	
	grid := anEnvironment grid.

	1 to: 5 do: [ :x |
		2 to: 5 do: [ :y |
			SKTrunk newInGrid: grid at: x @ y ]].

	7 to: 11 do: [ :x |
		2 to: 5 do: [ :y |
			SKTrunk newInGrid: grid at: x @ y ]].

	1 to: 5 do: [ :x |
		7 to: 10 do: [ :y |
			SKTrunk newInGrid: grid at: x @ y ]].

	7 to: 11 do: [ :x |
		7 to: 10 do: [ :y |
			SKTrunk newInGrid: grid at: x @ y ]].

	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 1 with: 1 @ 6).
	anEnvironment addKara: (SKKara newInGrid: grid at: 11 @ 1 with: 6 @ 1).
	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 11 with: 6 @ 11).
	anEnvironment addKara: (SKKara newInGrid: grid at: 11 @ 11 with: 11 @ 6)
]
