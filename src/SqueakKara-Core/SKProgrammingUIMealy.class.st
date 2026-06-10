Class {
	#name : #SKProgrammingUIMealy,
	#superclass : #SKProgrammingUI,
	#category : #'SqueakKara-Core'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'JS 6/2/2026 14:18'
}
SKProgrammingUIMealy >> build [

	self environment windowManager addWindow: SKStateMachineEditor new
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:40'
}
SKProgrammingUIMealy >> getCode [

	^ ''
]

{
	#category : #actions,
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 11:40'
}
SKProgrammingUIMealy >> setCode: aCode [

	
]
