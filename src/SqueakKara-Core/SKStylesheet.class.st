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
	#category : #'block-style',
	#'squeak_changestamp' : 'Lars 7/7/2026 10:12'
}
SKStylesheet class >> blockBorderColorByCategory [

	^	Dictionary new at: #default put: SKStylesheet colorOrange;
		at: #movement put: SKStylesheet colorBlue;
		at: #sensing put: SKStylesheet colorGreen;
		at: #operators put: SKStylesheet colorDarkTeal; yourself
]

{
	#category : #'block-style',
	#'squeak_changestamp' : 'Lars 7/7/2026 10:09'
}
SKStylesheet class >> blockBorderWidth [

	^ self blockUnit // 2 * 2
]

{
	#category : #'block-style',
	#'squeak_changestamp' : 'Lars 7/7/2026 10:12'
}
SKStylesheet class >> blockColorByCategory [

	^	Dictionary new at: #default put: SKStylesheet colorBeige;
		at: #movement put: SKStylesheet colorLightBlue;
		at: #sensing put: SKStylesheet colorLightGreen;
		at: #operators put: SKStylesheet colorTeal; yourself
]

{
	#category : #'block-style',
	#'squeak_changestamp' : 'Lars 7/7/2026 10:10'
}
SKStylesheet class >> blockPartHeight [
	
	^ TextStyle defaultFont lineGrid + ((TextStyle defaultFont height // 6) * 2) + ((SKStylesheet blockBorderWidth // 2) * 2)
]

{
	#category : #'block-style',
	#'squeak_changestamp' : 'Lars 7/7/2026 10:13'
}
SKStylesheet class >> blockTabHeight [

	^ TextStyle defaultFont height // 5 * 2
]

{
	#category : #'block-style',
	#'squeak_changestamp' : 'Lars 7/7/2026 10:14'
}
SKStylesheet class >> blockTabOffset [

	^ TextStyle defaultFont height // 5 * 3
]

{
	#category : #'block-style',
	#'squeak_changestamp' : 'Lars 7/7/2026 10:08'
}
SKStylesheet class >> blockUnit [
	
	^ TextStyle defaultFont height // 6
]

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
	#'squeak_changestamp' : 'FR 6/23/2026 18:48'
}
SKStylesheet class >> colorDarkTeal [

	^ Color fromString: '#62A8D0'
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
	#'squeak_changestamp' : 'FR 6/23/2026 18:49'
}
SKStylesheet class >> colorTeal [

	^  (Color fromString: '#62A8D0') twiceLighter
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
