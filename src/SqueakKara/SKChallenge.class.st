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
	#'squeak_changestamp' : 'AB 5/27/2026 15:10'
}
SKChallenge class >> initializeChallenge1For: aGrid environment: anEnvironment [
	
	1 to: 7 do: [ :x | SKTrunk newInGrid: aGrid at: x @ 1 ].
	1 to: 7 do: [ :x | SKTrunk newInGrid: aGrid at: x @ 7 ].
	1 to: 6 do: [ :y | SKTrunk newInGrid: aGrid at: 1 @ y ].
	1 to: 6 do: [ :y | SKTrunk newInGrid: aGrid at: 7 @ y ].

	2 to: 5 do: [ :x | SKTrunk newInGrid: aGrid at: x @ 3 ].
	3 to: 5 do: [ :y | SKTrunk newInGrid: aGrid at: 5 @ y ].
	3 to: 4 do: [ :x | SKTrunk newInGrid: aGrid at: x @ 5 ].
	
	SKCloverleaf newInGrid: aGrid at: 4 @ 4.

	anEnvironment addKara: (SKKara newInGrid: aGrid at: 1 @ 2)
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'AB 5/25/2026 16:19'
}
SKChallenge class >> initializeChallenge2For: aGrid environment: anEnvironment [

	SKTrunk newInGrid: aGrid at: 3 @ 2.
	SKTrunk newInGrid: aGrid at: 5 @ 2.
	SKTrunk newInGrid: aGrid at: 7 @ 2.
	
	SKCloverleaf newInGrid: aGrid at: 9 @ 2.

	anEnvironment addKara: (SKKara newInGrid: aGrid at: 1 @ 2)
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'AB 5/27/2026 15:09'
}
SKChallenge class >> initializeChallenge3For: aGrid environment: anEnvironment [

	2 to: 6 do: [ :x | SKTrunk newInGrid: aGrid at: x @ 1 ].
	
	4 to: 9 do: [ :x | SKTrunk newInGrid: aGrid at: x @ 3 ].
	
	SKCloverleaf newInGrid: aGrid at: 10 @ 2.
	
	anEnvironment addKara: (SKKara newInGrid: aGrid at: 1 @ 2)
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'AB 5/27/2026 15:11'
}
SKChallenge class >> initializeChallenge4For: aGrid environment: anEnvironment [

	1 to: 3 do: [ :x |
		2 to: 3 do: [ :y |
			SKTrunk newInGrid: aGrid at: x @ y ]].
	
	5 to: 6 do: [ :x | SKTrunk newInGrid: aGrid at: x @ 1 ].
	
	5 to: 6 do: [ :x | SKTrunk newInGrid: aGrid at: x @ 4 ].
	
	SKCloverleaf newInGrid: aGrid at: 7 @ 1.
	SKCloverleaf newInGrid: aGrid at: 7 @ 4.

	anEnvironment addKara: (SKKara newInGrid: aGrid at: 1 @ 1).
	anEnvironment addKara: (SKKara newInGrid: aGrid at: 1 @ 4)
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'AB 5/27/2026 15:12'
}
SKChallenge class >> initializeChallenge5For: aGrid environment: anEnvironment [
	
	1 to: 5 do: [ :x |
		2 to: 5 do: [ :y |
			SKTrunk newInGrid: aGrid at: x @ y ]].

	7 to: 11 do: [ :x |
		2 to: 5 do: [ :y |
			SKTrunk newInGrid: aGrid at: x @ y ]].

	1 to: 5 do: [ :x |
		7 to: 10 do: [ :y |
			SKTrunk newInGrid: aGrid at: x @ y ]].

	7 to: 11 do: [ :x |
		7 to: 10 do: [ :y |
			SKTrunk newInGrid: aGrid at: x @ y ]].
	
	SKCloverleaf newInGrid: aGrid at: 6 @ 1.
	SKCloverleaf newInGrid: aGrid at: 1 @ 6.
	SKCloverleaf newInGrid: aGrid at: 11 @ 6.
	SKCloverleaf newInGrid: aGrid at: 6 @ 11.

	anEnvironment addKara: (SKKara newInGrid: aGrid at: 1 @ 1).
	anEnvironment addKara: (SKKara newInGrid: aGrid at: 11 @ 1).
	anEnvironment addKara: (SKKara newInGrid: aGrid at: 1 @ 11).
	anEnvironment addKara: (SKKara newInGrid: aGrid at: 11 @ 11)
]
