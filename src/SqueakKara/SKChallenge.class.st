"
A SKChallenge is a static class that implementes methods for placing objects on the passed grid.
"
Class {
	#name : #SKChallenge,
	#superclass : #Object,
	#category : #SqueakKara,
	#'squeak_changestamp' : 'LM 5/10/2026 20:27'
}

{
	#category : #challenges,
	#'squeak_changestamp' : 'LM 6/5/2026 13:47'
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
	
	anEnvironment addKara: (SKKara newInGrid: grid at: 2 @ 2 with: 4 @ 4).
	(SKCriticalSection newInGrid: grid at: 3 @ 2) group: #group1.
	(SKCriticalSection newInGrid: grid at: 5 @ 2) group: #group1.
	
	
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
	#'squeak_changestamp' : 'JanWein 6/4/2026 09:41'
}
SKChallenge class >> initializeChallenge5For: anEnvironment [
	
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

{
	#category : #challenges,
	#'squeak_changestamp' : 'LM 6/4/2026 22:45'
}
SKChallenge class >> initializeChallenge6For: anEnvironment [
	
	| grid |
	
	grid := anEnvironment grid.

	1 to: 9 do: [ :x |
		x = 4 ifFalse: [ SKTrunk newInGrid: grid at: x @ 2 ]].

	1 to: 9 do: [ :x |
		x = 7 ifFalse: [ SKTrunk newInGrid: grid at: x @ 4 ]].

	1 to: 9 do: [ :x |
		x = 2 ifFalse: [ SKTrunk newInGrid: grid at: x @ 6 ]].

	1 to: 9 do: [ :x |
		x = 5 ifFalse: [ SKTrunk newInGrid: grid at: x @ 8 ]].

	anEnvironment addKaraAt: 5 @ 9
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'LM 6/4/2026 22:45'
}
SKChallenge class >> initializeChallenge7For: anEnvironment [
	
	| grid |
	
	grid := anEnvironment grid.

	2 to: 8 do: [ :y | SKTrunk newInGrid: grid at: 1 @ y ].
	
	3 to: 8 do: [ :x | SKTrunk newInGrid: grid at: x @ 2 ].
	3 to: 8 do: [ :x | SKTrunk newInGrid: grid at: x @ 4 ].
	3 to: 8 do: [ :x | SKTrunk newInGrid: grid at: x @ 6 ].
	3 to: 8 do: [ :x | SKTrunk newInGrid: grid at: x @ 8 ].
	
	SKTrunk newInGrid: grid at: 2 @ 8.
	
	SKTrunk newInGrid: grid at: 8 @ 3.
	SKTrunk newInGrid: grid at: 8 @ 5.
	SKTrunk newInGrid: grid at: 8 @ 7.	
	
	1 to: 9 do: [ :x |
		x = 5 ifFalse: [ SKTrunk newInGrid: grid at: x @ 8 ]].

	anEnvironment addKara: (SKKara newInGrid: grid at: 7 @ 7 with: 2 @ 1).
	anEnvironment addKara: (SKKara newInGrid: grid at: 7 @ 5 with: 2 @ 2)
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'LM 6/4/2026 22:46'
}
SKChallenge class >> initializeChallenge8For: anEnvironment [
	
	| grid |
	
	grid := anEnvironment grid.
	
	1 to: 10 do: [ :x | 
		SKTrunk newInGrid: grid at: x @ 1.
		SKTrunk newInGrid: grid at: x @ 11 ].
	
	2 to: 10 do: [:y | 
		SKTrunk newInGrid: grid at: 1 @ y.
		SKTrunk newInGrid: grid at: 2 @ y. 
		SKTrunk newInGrid: grid at: 9 @ y. 
		SKTrunk newInGrid: grid at: 10 @ y ].
	
	3 to: 9 do: [:y |
		SKTrunk newInGrid: grid at: 5 @ y.
		SKTrunk newInGrid: grid at: 6 @ y ].
	
	SKTrunk newInGrid: grid at: 4 @ 3.
	SKTrunk newInGrid: grid at: 4 @ 4.
	SKTrunk newInGrid: grid at: 7 @ 3.
	SKTrunk newInGrid: grid at: 7 @ 4.
	SKTrunk newInGrid: grid at: 4 @ 8.
	SKTrunk newInGrid: grid at: 4 @ 9.
	SKTrunk newInGrid: grid at: 7 @ 8.
	SKTrunk newInGrid: grid at: 7 @ 9.
	SKTrunk newInGrid: grid at: 3 @ 6.
	SKTrunk newInGrid: grid at: 8 @ 6.
	
	
	anEnvironment addKaraAt: 4 @ 2
]
