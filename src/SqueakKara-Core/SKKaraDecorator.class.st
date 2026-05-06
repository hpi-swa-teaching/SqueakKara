"
SKKaraDecorator is a decorator for SKKara used to add the necessary step calls to the turn and move methods and modify the SKKara methods so that they can be used by the SKExecuter.
"
Class {
	#name : #SKKaraDecorator,
	#superclass : #Object,
	#instVars : [
		'kara',
		'executer',
		'lock',
		'pendingActions'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 16:00'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'LM 5/6/2026 21:52'
}
SKKaraDecorator class >> newWith: aKara executer: anExecuter [

	^ self new
		kara: aKara;
		executer: anExecuter;
		pendingActions: OrderedCollection new;
		yourself
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'LM 5/6/2026 21:40'
}
SKKaraDecorator class >> newWith: aKara lock: aSemaphore executer: anExecuter [

	^ self new
		kara: aKara;
		lock: aSemaphore;
		executer: anExecuter;
		pendingActions: OrderedCollection new;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 18:59'
}
SKKaraDecorator >> codeContext [

	^ (SKExecuteContext new kara: self kara)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraDecorator >> executer [
	
	^ executer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraDecorator >> executer: anObject [
	
	executer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraDecorator >> kara [
	
	^ kara
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JJG 6/17/2024 16:34'
}
SKKaraDecorator >> kara: anObject [
	
	kara := anObject
]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'LM 5/6/2026 22:17'
}
SKKaraDecorator >> move [

	self pendingActions add: { #move. [ self kara move ]}.

	self executer submitStepActions: self pendingActions copy for: self.
	self pendingActions removeAll.
	self executer waitForNextStepFor: self
]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'LM 5/6/2026 21:57'
}
SKKaraDecorator >> onCloverleaf [

	^ self kara onCloverleaf
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 21:39'
}
SKKaraDecorator >> pendingActions [

	^ pendingActions
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 5/6/2026 21:39'
}
SKKaraDecorator >> pendingActions: aCollection [

	pendingActions := aCollection
]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'LM 5/6/2026 21:57'
}
SKKaraDecorator >> trunkAhead [

	^ self kara trunkAhead

]

{
	#category : #'SKKara functions',
	#'squeak_changestamp' : 'LM 5/6/2026 22:10'
}
SKKaraDecorator >> turn: aDirection [

	self kara turn: aDirection.
	self pendingActions add: {
		#turn.
		[ Transcript showln: 'ADD turn for ', self kara printString ]}
]
