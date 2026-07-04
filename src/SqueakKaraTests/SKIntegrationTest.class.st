Class {
	#name : #SKIntegrationTest,
	#superclass : #TestCase,
	#category : #SqueakKaraTests
}

{
	#category : #testing,
	#'squeak_changestamp' : 'LM 7/4/2026 13:59'
}
SKIntegrationTest >> testCriticalSectionLevel [

	| environment solutionCode1 solutionCode2 criticalSectionCollisionCode1 criticalSectionCollisionCode2 wrongCloverleafCode1 |
	
	environment := SKEnvironment new initializeWithChallenge9.
	environment executer testMode: true.
	
	criticalSectionCollisionCode1 := '(1 to: 4) do: [ :i | kara move ]'.
	criticalSectionCollisionCode2 := 'kara turn: left. kara turn: left. kara move. kara move. kara move'.
	
	environment firstWorkspace userCode: criticalSectionCollisionCode1.
	environment workspaces second userCode: criticalSectionCollisionCode2.
	
	environment run.
	
	"Busy waiting until execution done."
	environment executer waitUntilTerminated.
	
	self assert: environment karas first coordinates = (4 @ 1).
	
	environment karas do: [ :kara | kara speechBubbles do: [ :bubble | bubble delete ]].
	environment := environment executeControls buttonReset action.
	
	wrongCloverleafCode1 := '(1 to: 6) do: [ :i | kara move ]. kara collectCloverleaf'.
	
	environment firstWorkspace userCode: wrongCloverleafCode1.
	environment workspaces second userCode: ''.
	
	environment run.
	
	"Busy waiting until execution done."
	environment executer waitUntilTerminated.
	
	self assert: ((environment grid gridCoordinator getTileAtCoordinates: (7 @ 1)) anySatisfy: [ :object | object isCloverleaf ]).
	
	environment karas do: [ :kara | kara speechBubbles do: [ :bubble | bubble delete ]].
	environment := environment executeControls buttonReset action.
	
	solutionCode1 := '(1 to: 2) do: [ :k | (1 to: 4) do: [ :i | kara move ]. kara turn: right ]. kara move. kara collectCloverleaf'.
	solutionCode2 := 'kara turn: left. kara turn: left. kara move. kara collectCloverleaf'.
	
	environment firstWorkspace userCode: solutionCode1.
	environment workspaces second userCode: solutionCode2.
	
	environment run.
	
	"Busy waiting until execution done."
	environment executer waitUntilTerminated.
	
	self assert: environment grid allLeavesCollected.
	
	environment karas do: [ :kara | kara speechBubbles do: [ :bubble | bubble delete ]].
	environment close
]

{
	#category : #testing,
	#'squeak_changestamp' : 'ND 7/4/2026 15:36'
}
SKIntegrationTest >> testDirectionalSectionLevel [

	| environment solutionCode1 solutionCode2 wrongWayCode1 wrongCloverleafCode1 |
	
	environment := SKEnvironment new initializeWithChallenge10.
	environment executer testMode: true.
	
	wrongWayCode1 := 'kara move'.
	
	environment firstWorkspace userCode: wrongWayCode1.
	environment workspaces second userCode: ''.
	
	environment run.
	
	"Busy waiting until execution done."
	environment executer waitUntilTerminated.
	
	self assert: environment karas first coordinates = (1 @ 5).
	
	environment karas do: [ :kara | kara speechBubbles do: [ :bubble | bubble delete ]].
	environment := environment executeControls buttonReset action.
	
	wrongCloverleafCode1 := 'kara turn: left. (1 to: 4) do: [ :i | kara move ]. kara turn: right. kara move. kara collectCloverleaf'.
	
	environment firstWorkspace userCode: wrongCloverleafCode1.
	environment workspaces second userCode: ''.
	
	environment run.
	
	"Busy waiting until execution done."
	environment executer waitUntilTerminated.
	
	self assert: ((environment grid gridCoordinator getTileAtCoordinates: (2 @ 1)) anySatisfy: [ :object | object isCloverleaf ]).
	
	environment karas do: [ :kara | kara speechBubbles do: [ :bubble | bubble delete ]].
	environment := environment executeControls buttonReset action.
	
	solutionCode1 := 'kara turn: left. kara move. kara move. kara move. kara move. kara turn: right. kara move. kara move. kara turn: right. kara move. kara move. kara move. kara move. kara turn: right. kara move. kara move. kara collectCloverleaf.'.
	solutionCode2 := 'kara move. kara move. kara turn: right. kara move. kara move. kara move. kara move. kara turn: right. kara move. kara turn: right. kara move. kara move. kara move. kara move. kara collectCloverleaf. kara turn: right. kara move.'.
	
	environment firstWorkspace userCode: solutionCode1.
	environment workspaces second userCode: solutionCode2.
	
	environment run.
	
	"Busy waiting until execution done."
	environment executer waitUntilTerminated.
	
	self assert: environment grid allLeavesCollected.
	
	environment karas do: [ :kara | kara speechBubbles do: [ :bubble | bubble delete ]].
	environment close
]
