"
SKConfetti displays a short confetti burst when Kara reaches a cloverleaf.
"
Class {
	#name : #SKConfetti,
	#superclass : #Morph,
	#instVars : [
		'particles',
		'ticksRemaining',
		'particleCount'
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
	#'squeak_changestamp' : 'Gustav Meinshausen 7/3/2026 16:13'
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
	self particles add: (Array with: piece with: velocity).
	self addMorph: piece
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/3/2026 16:14'
}
SKConfetti >> decrementTick [

	self ticksRemaining: self ticksRemaining - 1.
	self ticksRemaining <= 0 ifTrue: [self delete]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/3/2026 16:14'
}
SKConfetti >> initialize [

	super initialize.
	self
		color: Color transparent;
		borderWidth: 0;
		ticksRemaining: 70;
		particleCount: 50;
		particles: OrderedCollection new
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/3/2026 16:12'
}
SKConfetti >> particleCount [

	^ particleCount
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/3/2026 16:13'
}
SKConfetti >> particleCount: aNumber [
	
	particleCount := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/3/2026 16:11'
}
SKConfetti >> particles [

	^ particles
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/3/2026 16:10'
}
SKConfetti >> particles: anOrderedCollection [
	
	particles := anOrderedCollection
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
	#'squeak_changestamp' : 'Gustav Meinshausen 7/3/2026 16:15'
}
SKConfetti >> startCelebration [

	self extent: 1 @ 1.
	self particleCount timesRepeat: [self addParticleAt: self position].
	
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/3/2026 16:15'
}
SKConfetti >> step [

	self particles do: [:each |
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
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/3/2026 16:11'
}
SKConfetti >> ticksRemaining [

	^ ticksRemaining
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Gustav Meinshausen 7/3/2026 16:11'
}
SKConfetti >> ticksRemaining: aNumber [
	
	ticksRemaining := aNumber
]

{
	#category : #stepping,
	#'squeak_changestamp' : 'makrosophos 6/24/2026 12:00'
}
SKConfetti >> wantsSteps [

	^ true
]
