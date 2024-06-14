Class {
	#name : #SKDirection,
	#superclass : #Object,
	#category : #SqueakKara-Core
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
	#'squeak_changestamp' : 'LK 5/24/2024 11:28'
}
SKDirection class >> right [

	^ 1 @ 0
]
