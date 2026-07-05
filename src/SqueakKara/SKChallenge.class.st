"
A SKChallenge is a static class that implementes methods for placing objects on the passed grid and thereby create the different challenges.
"
Class {
	#name : #SKChallenge,
	#superclass : #Object,
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JanWein 7/5/2026 12:23'
}

{
	#category : #challenges,
	#'squeak_changestamp' : 'mr 6/5/2026 13:13'
}
SKChallenge class >> initializeBlankProjectChallengeFor: anEnvironment [

	| grid |
	
	grid := anEnvironment grid.
	
	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 1)
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'mr 6/18/2026 20:05'
}
SKChallenge class >> initializeChallenge10For: anEnvironment [
	
	| grid |
	
	grid := anEnvironment grid.
	
	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 5 with: 2 @ 5).
	anEnvironment addKara: (SKKara newInGrid: grid at: 3 @ 1 with: 2 @ 1).
	
	1 to: 5 do: [ :y | (SKCriticalSection newInGrid: grid at: 2 @ y) group: #group1; color: Color green ].
	
	2 to: 4 do: [ :y |
		SKDirectionalTile newInGrid: grid at: (1 @ y) enterFrom: SKDirection below.
		SKDirectionalTile newInGrid: grid at: (2 @ y) enterFrom: SKDirection above.
		SKDirectionalTile newInGrid: grid at: (2 @ y) enterFrom: SKDirection below.
		SKDirectionalTile newInGrid: grid at: (3 @ y) enterFrom: SKDirection above ].
	
	SKDirectionalTile newInGrid: grid at: (1 @ 1) enterFrom: SKDirection below.
	SKDirectionalTile newInGrid: grid at: (2 @ 1) enterFrom: SKDirection below.
	SKDirectionalTile newInGrid: grid at: (2 @ 5) enterFrom: SKDirection above.
	SKDirectionalTile newInGrid: grid at: (3 @ 5) enterFrom: SKDirection above.
	SKDirectionalTile newInGrid: grid at: (2 @ 1) enterFrom: SKDirection left.
	SKDirectionalTile newInGrid: grid at: (2 @ 5) enterFrom: SKDirection right
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'JanWein 7/2/2026 20:25'
}
SKChallenge class >> initializeChallenge11For: anEnvironment [
	
	| grid |
	
	grid := anEnvironment grid.
	
	anEnvironment addKara: (SKKara newInGrid: grid at: 3 @ 1 with: 5 @ 1).
	anEnvironment addKara: (SKKara newInGrid: grid at: 5 @ 7 with: 3 @ 7).
	
	1 to: 7 do: [ :i |
		SKDirectionalTile newInGrid: grid at: (3 @ i) enterFrom: SKDirection above.
		SKDirectionalTile newInGrid: grid at: (5 @ i) enterFrom: SKDirection below.
		SKDirectionalTile newInGrid: grid at: (i @ 3) enterFrom: SKDirection right.
		SKDirectionalTile newInGrid: grid at: (i @ 5) enterFrom: SKDirection left.
		SKTrunk newInGrid: grid at: 1 @ i.
		SKTrunk newInGrid: grid at: 7 @ i ].
	
	1 to: 7 do: [ :y |
		(y = 3 or: y = 5) ifFalse: [
			SKTrunk newInGrid: grid at: 2 @ y.
			SKTrunk newInGrid: grid at: 4 @ y.
			SKTrunk newInGrid: grid at: 6 @ y ]]
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'JanWein 7/2/2026 20:25'
}
SKChallenge class >> initializeChallenge12For: anEnvironment [
	
	| grid |
	
	grid := anEnvironment grid.
	
	anEnvironment addKara: (SKKara newInGrid: grid at: 2 @ 2 with: 6 @ 6).
	anEnvironment addKara: (SKKara newInGrid: grid at: 6 @ 2 with: 2 @ 6).
	
	2 to: 6 do: [ :x | SKTrunk newInGrid: grid at: x @ 1 ].
	2 to: 6 do: [ :x | SKTrunk newInGrid: grid at: x @ 7 ].
	1 to: 7 do: [ :y | SKTrunk newInGrid: grid at: 1 @ y ].
	1 to: 7 do: [ :y | SKTrunk newInGrid: grid at: 7 @ y ].
	
	SKTrunk newInGrid: grid at: 2 @ 3.
	SKTrunk newInGrid: grid at: 5 @ 2.
	SKTrunk newInGrid: grid at: 3 @ 3.
	SKTrunk newInGrid: grid at: 2 @ 4.
	SKTrunk newInGrid: grid at: 3 @ 4.
	SKTrunk newInGrid: grid at: 3 @ 5.
	SKTrunk newInGrid: grid at: 5 @ 3.
	SKTrunk newInGrid: grid at: 5 @ 5.
	SKTrunk newInGrid: grid at: 2 @ 5.
	SKTrunk newInGrid: grid at: 6 @ 5.
	
	3 to: 6 do: [ :y |
		SKDirectionalTile newInGrid: grid at: (4 @ y) enterFrom: SKDirection above ].
	
	SKDirectionalTile newInGrid: grid at: (6 @ 4) enterFrom: SKDirection above.
	4 to: 5 do: [ :x |
		SKDirectionalTile newInGrid: grid at: (x @ 4) enterFrom: SKDirection right ]
]

{
	#category : #challenges,
	#'squeak_changestamp' : 'LM 6/9/2026 18:44'
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

{
	#category : #challenges,
	#'squeak_changestamp' : 'mr 6/16/2026 12:32'
}
SKChallenge class >> initializeChallenge9For: anEnvironment [
	
	| grid |
	
	grid := anEnvironment grid.
	
	SKChallenge treeSquarePositions do: [ :aPoint | SKTrunk newInGrid: grid at: aPoint + (3 @ 3)].
	SKChallenge treeSquarePositions do: [ :aPoint | SKTrunk newInGrid: grid at: aPoint + (7 @ 3)].
	
	anEnvironment addKara: (SKKara newInGrid: grid at: 1 @ 1 with: 4 @ 5).
	anEnvironment addKara: (SKKara newInGrid: grid at: 8 @ 1 with: 7 @ 1).
	
	1 to: 5 do: [ :y | (SKCriticalSection newInGrid: grid at: 5 @ y) group: #group1; color: Color green ]
]

{
	#category : #positions,
	#'squeak_changestamp' : 'JanWein 6/5/2026 14:14'
}
SKChallenge class >> treeSquarePositions [

	^ {(-1 @ -1). (-1 @ 0). (-1 @ 1). 
		(0 @ -1). (0 @ 0). (0 @ 1).
		(1 @ -1). (1 @ 0). (1 @ 1).}
]
