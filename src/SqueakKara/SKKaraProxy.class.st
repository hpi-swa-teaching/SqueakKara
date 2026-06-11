"
SKKaraDecorator is a decorator for SKKara used to add the necessary step calls to the turn and move methods and modify the SKKara methods so that they can be used by the SKExecuter.
"
Class {
	#name : #SKKaraProxy,
	#superclass : #SKScheduleActor,
	#instVars : [
		'kara'
	],
	#category : #SqueakKara,
	#'squeak_changestamp' : 'JJG 7/1/2024 16:00'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'LM 5/7/2026 16:53'
}
SKKaraProxy class >> newWith: aKara [

	^ self new
		kara: aKara;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 18:59'
}
SKKaraProxy >> codeContext [

	^ (SKExecuteContext new kara: self kara)
]

{
	#category : #commands,
	#'squeak_changestamp' : 'mr 6/5/2026 12:14'
}
SKKaraProxy >> collectCloverleaf [
	
	self kara collectCloverleaf
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AB 5/21/2026 19:37'
}
SKKaraProxy >> coordinates [

	^ self kara coordinates
]

{
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/26/2026 09:50'
}
SKKaraProxy >> isLocked: aPoint [

	^ self kara ownsLockAt: aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraProxy >> kara [
	
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraProxy >> kara: anObject [
	
	kara := anObject
]

{
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/23/2026 13:57'
}
SKKaraProxy >> lockAt: aPoint [

	self kara lockAt: aPoint
]

{
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/23/2026 13:58'
}
SKKaraProxy >> lockNextField [

	self kara lockNextField
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/23/2026 13:56'
}
SKKaraProxy >> move [

	| action |
	
	action := SKAction newWithType: #move action: [ self moveAction ].

	self schedule: action.
	self scheduler waitFor: self
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LD 6/11/2026 09:40'
}
SKKaraProxy >> moveAction [

	^ (self isLocked: (self nextField))
		ifFalse: [
			| previousPosition |
			previousPosition := self coordinates.
			self kara move ]
		ifTrue: [ 
			self kara sayMessageForThreeSeconds: 'Hey, hier darf ich gerade nicht hin!'.
			false ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/23/2026 13:51'
}
SKKaraProxy >> nextField [

	^ self kara nextField
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/6/2026 21:57'
}
SKKaraProxy >> onCloverleaf [

	^ self kara onCloverleaf
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/7/2026 16:53'
}
SKKaraProxy >> trunkAhead [

	^ self kara trunkAhead
]

{
	#category : #commands,
	#'squeak_changestamp' : 'LM 5/7/2026 10:29'
}
SKKaraProxy >> turn: aDirection [

	self kara turn: aDirection
]

{
	#category : #locking,
	#'squeak_changestamp' : 'LM 5/23/2026 13:59'
}
SKKaraProxy >> unlockAt: aPoint [

	self kara unlockAt: aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AB 5/21/2026 19:38'
}
SKKaraProxy >> viewDirection [

	^ self kara viewDirection
]
