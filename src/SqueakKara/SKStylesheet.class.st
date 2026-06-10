"
SKStylesheet provides access to common stylistic properties, e.g. primary and secondary colors.
"
Class {
	#name : #SKStylesheet,
	#superclass : #Object,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'LK 7/4/2024 19:13'
}

{
	#category : #colors,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:36'
}
SKStylesheet class >> colorBeige [

	^ Color fromString: '#e5c890'
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:37'
}
SKStylesheet class >> colorBlue [

	^ Color fromString: '#1e66f5'
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:38'
}
SKStylesheet class >> colorGreen [

	^ Color fromString: '#40a02b'
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:38'
}
SKStylesheet class >> colorLightBlue [

	^ Color fromString: '#8caaee'
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:39'
}
SKStylesheet class >> colorLightGreen [

	^ Color fromString: '#a6d189'
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:35'
}
SKStylesheet class >> colorOrange [

	^ Color fromString: '#df8e1d'
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:40'
}
SKStylesheet class >> colorRed [

	^ Color fromString: '#bf5f4e'
]

{
	#category : #colors,
	#'squeak_changestamp' : 'Lars Kuhr 6/2/2026 09:41'
}
SKStylesheet class >> colorYellow [

	^ Color fromString: '#fadb61'
]

{
	#category : #baseColors,
	#'squeak_changestamp' : 'LK 7/4/2024 19:11'
}
SKStylesheet class >> primaryColor [

	^ Color lightGreen lighter
]

{
	#category : #baseColors,
	#'squeak_changestamp' : 'LK 7/4/2024 19:12'
}
SKStylesheet class >> secondaryColor [

	^ Color gray lighter
]
