"
Direction stores vectors for all directions on the class side, to be used by the Grid and GridObjects.

Instance Variables
"
Class {
	#name : #SKDirection,
	#superclass : #Object,
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JanWein 7/5/2026 13:21'
}

{
	#category : #directions,
	#'squeak_changestamp' : 'LK 5/24/2024 11:28'
}
SKDirection class >> above [

	^ 0 @ -1
]

{
	#category : #directions,
	#'squeak_changestamp' : 'LK 5/24/2024 11:28'
}
SKDirection class >> below [

	^ 0 @ 1
]

{
	#category : #directions,
	#'squeak_changestamp' : 'LK 5/24/2024 11:28'
}
SKDirection class >> here [

	^ 0 @ 0
]

{
	#category : #directions,
	#'squeak_changestamp' : 'LK 5/24/2024 11:28'
}
SKDirection class >> left [

	^ -1 @ 0
]

{
	#category : #directions,
	#'squeak_changestamp' : 'LD 6/26/2026 10:41'
}
SKDirection class >> mirror: aDirection [
	
	^ aDirection * -1
]

{
	#category : #directions,
	#'squeak_changestamp' : 'LK 5/24/2024 11:28'
}
SKDirection class >> right [

	^ 1 @ 0
]

{
	#category : #directions,
	#'squeak_changestamp' : 'EB 7/11/2024 15:17'
}
SKDirection class >> rotateLeft [

	^ {
    		{ 0. 1 }.
    		{ -1. 0 }.
	}
]

{
	#category : #directions,
	#'squeak_changestamp' : 'LM 5/10/2026 20:29'
}
SKDirection class >> rotatePosition: aPosition by: aMatrix [

	| vector |
	vector := aMatrix collect: [:row |((row at: 1) * aPosition x) + ((row at: 2) * aPosition y)].
	^ (vector first) @ (vector second)
]

{
	#category : #directions,
	#'squeak_changestamp' : 'EB 7/11/2024 15:17'
}
SKDirection class >> rotateRight [

	^ {
    		{ 0. -1 }.
    		{ 1. 0 }.
	}
]
