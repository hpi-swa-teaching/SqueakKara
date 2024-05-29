Class {
	#name : #SKKara,
	#superclass : #SKGridObject,
	#instVars : [
		'viewDirection'
	],
	#category : #SqueakKara
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'NR 5/29/2024 10:26'
}
SKKara >> move [
	
	self coordinates: [self coordinates + viewDirection].

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'NR 5/29/2024 19:32'
}
SKKara >> onCloverleaf [

	"ich bin mir unsicher, ob das so funktioniert. Idee: prüfen ob das Objekt an den Koordinaten von Kara ein Kleeblatt ist "

	^ self gridCoordinator getTileAtCoordinates: self coordinates isCloverleaf
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'NR 5/29/2024 19:36'
}
SKKara >> trunkAhead [
	
	^self gridCoordinator getTileAtCoordinates: self coordinates + self viewDirection isTrunk

	"
	falls das obere nicht so möglich ist, wie ich mir das vorstelle, hier eine andere Lösungsvariante:
	
	viewDirection = 1@0
		ifTrue: [^self neighboursRight]
		ifFalse:
			[viewDirection = 0@1
				ifTrue: [^self neighboursAbove]
				ifFalse: 
					[viewDirection = (-1)@0
						ifTrue: [^self neighboursLeft]
						ifFalse:
							[viewDirection = 0@(-1)
								ifTrue: [^self neighboursBelow]]]]
	
	hierbei muss aber noch überprüft werden, ob es sich um einen Trunk handelt
	"
	
		
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'NR 5/29/2024 15:47'
}
SKKara >> turn: aDirection [
	
	| angle DirectionAngleDict |
	
	DirectionAngleDict := Dictionary new.
	DirectionAngleDict at: 0@1 put: 0.
	DirectionAngleDict at: 1@0 put: 90.
	DirectionAngleDict at: 0@(-1) put: 180.
	DirectionAngleDict at: (-1)@0 put: 270.
	DirectionAngleDict at: 0 put: 0@1.
	DirectionAngleDict at: 90 put: 1@0.
	DirectionAngleDict at: 180 put: 0@(-1).
	DirectionAngleDict at: 270 put: (-1)@0.


	angle := DirectionAngleDict at: [viewDirection] .
	
	aDirection = 'links'
		ifTrue: [angle := angle-90 % 360]
		ifFalse:
			[aDirection = 'rechts'
				ifTrue: [angle := angle+90 % 360]].
				"Fehlerbehandlung für falsche Eingabe"
												
	self viewDirection:	 [DirectionAngleDict at: [angle]].		
			

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'NR 5/29/2024 10:24'
}
SKKara >> viewDirection [
	
	^viewDirection
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'NR 5/29/2024 10:24'
}
SKKara >> viewDirection: aDirection [
	
	viewDirection := aDirection.
]
