"
SKConfetti displays a short confetti burst when Kara reaches a cloverleaf.
"
Class {
	#name : #SKConfetti,
	#superclass : #Morph,
	#instVars : [
		'particles',
		'ticksRemaining'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:00'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:00'
}
SKConfetti class >> explodeAt: aGlobalPoint [

	^ (self new)
		position: aGlobalPoint;
		startCelebration;
		openInWorld;
		yourself
]

{
	#category : #animation,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:00'
}
SKConfetti >> addParticleAt: aCenter [

	| piece size velocity |
	
	size := 4 + (6 atRandom).
	piece := EllipseMorph new
		color: self randomConfettiColor;
		extent: size @ ((size - 2) max: 2);
		position: aCenter + ((12 atRandom - 6) @ (12 atRandom - 6));
		yourself.
	velocity := (16 atRandom - 8) @ (-4 - (8 atRandom)).
	particles add: (Array with: piece with: velocity).
	self addMorph: piece
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'makrosophos 7/3/2026 13:31'
}
SKConfetti >> decrementTick [

	ticksRemaining := ticksRemaining - 1.
	ticksRemaining <= 0 ifTrue: [self delete]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:00'
}
SKConfetti >> initialize [

	super initialize.
	self
		color: Color transparent;
		borderWidth: 0.
	particles := OrderedCollection new.
	ticksRemaining := 70
]

{
	#category : #animation,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:00'
}
SKConfetti >> randomConfettiColor [

	^ {
		SKStylesheet colorRed.
		SKStylesheet colorYellow.
		SKStylesheet colorGreen.
		SKStylesheet colorBlue.
		SKStylesheet colorOrange.
		SKStylesheet colorLightBlue
	} atRandom
]

{
	#category : #animation,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:00'
}
SKConfetti >> startCelebration [

	self extent: 1 @ 1.
	50 timesRepeat: [self addParticleAt: self position].
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:00'
}
SKConfetti >> step [

	particles do: [:each |
		| piece velocity newVelocity |
		piece := each first.
		velocity := each second.
		newVelocity := velocity x @ (velocity y + 0.6).
		each at: 2 put: newVelocity.
		piece position: piece position + newVelocity].
	self decrementTick
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:00'
}
SKConfetti >> stepTime [

	^ 33
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:00'
}
SKConfetti >> wantsSteps [

	^ true
]
