Class {
	#name : #SKBlockConnectionPointTest,
	#superclass : #TestCase,
	#category : #'SqueakKara-Tests'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'SLH 7/5/2026 22:38'
}
SKBlockConnectionPointTest >> testConnectingToSelfIsNoOp [

	| a |

	a := SKBlockConnectionPoint new.
	a connectTo: a.

	self deny: a isConnected
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SLH 7/5/2026 22:39'
}
SKBlockConnectionPointTest >> testConnection [

	| a b c |

	a := SKBlockConnectionPoint new.
	b := SKBlockConnectionPoint new.
	c := SKBlockConnectionPoint new.
	a connectTo: b.
	a connectTo: c.

	self assert: a connectedPoint == c.
	self deny: b isConnected
]

{
	#category : #testing,
	#'squeak_changestamp' : 'SLH 7/5/2026 22:37'
}
SKBlockConnectionPointTest >> testDisconnect [

	| a b |

	a := SKBlockConnectionPoint new.
	b := SKBlockConnectionPoint new.
	a connectTo: b.
	a disconnect.

	self deny: a isConnected.
	self deny: b isConnected
]
