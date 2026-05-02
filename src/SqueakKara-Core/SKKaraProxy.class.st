"
SKKaraProxy is a surrogate for SKKara used to add the necessary step calls to the turn and move methods and modify the SKKara methods so that they can be used by the SKExecuter.
"
Class {
	#name : #SKKaraProxy,
	#superclass : #Object,
	#instVars : [
		'kara',
		'executer'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'mr 5/2/2026 17:44'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mr 5/2/2026 16:15'
}
SKKaraProxy class >> newWithKara: aKara executer: anExecuter [
	^ self new
		kara: aKara;
		executer: anExecuter;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraProxy >> executer [
	
	^ executer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraProxy >> executer: anObject [
	
	executer := anObject
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
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:11'
}
SKKaraProxy >> move [

	self kara move.
	self executer step
]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'EB 6/11/2024 10:01'
}
SKKaraProxy >> onCloverleaf [

	^ self kara onCloverleaf

]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'EB 6/11/2024 10:01'
}
SKKaraProxy >> trunkAhead [

	^ self kara trunkAhead

]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:12'
}
SKKaraProxy >> turn: aDirection [

	self kara turn: aDirection.
	self executer step

]
