"
SKKaraDecorator is a decorator for SKKara used to add the necessary step calls to the turn and move methods and modify the SKKara methods so that they can be used by the SKExecuter.
"
Class {
	#name : #SKKaraDecoratorBC,
	#superclass : #Object,
	#instVars : [
		'kara',
		'executer'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraDecoratorBC >> executer [
	
	^ executer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraDecoratorBC >> executer: anObject [
	
	executer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraDecoratorBC >> kara [
	
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraDecoratorBC >> kara: anObject [
	
	kara := anObject
]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:11'
}
SKKaraDecoratorBC >> move [

	self kara move.
	self executer step
]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'EB 6/11/2024 10:01'
}
SKKaraDecoratorBC >> onCloverleaf [

	^ self kara onCloverleaf

]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'EB 6/11/2024 10:01'
}
SKKaraDecoratorBC >> trunkAhead [

	^ self kara trunkAhead

]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:12'
}
SKKaraDecoratorBC >> turn: aDirection [

	self kara turn: aDirection.
	self executer step

]
