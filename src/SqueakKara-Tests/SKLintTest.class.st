Class {
	#name : #SKLintTest,
	#superclass : #TestCase,
	#category : #'SqueakKara-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 5/22/2026 23:08'
}
SKLintTest >> lintTestCases [

	^ {	#instanceVariableAccessIsConsistent: .
		#magicNumbers: .
		#nilProgramming: .
		#noClassComments: }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 5/22/2026 23:05'
}
SKLintTest >> packageName [
	
	^ 'SqueakKara-Core'
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mr 5/22/2026 23:06'
}
SKLintTest >> testLinting [
	
	| packageName target environment tests testRunner resultEnvironment results |

	packageName := self packageName.
	PackageInfo allPackages detect: [ :package | package name = packageName ] ifNone: [ self fail: 'Package not found: ', packageName ].
	
	target := SL2Target withSystemCategories: { self packageName }.
	environment := SLDefaultEnvironment new.
	environment selectedClasses: target classes.
	
	tests := OrderedCollection new.
	self lintTestCases do: [ :lintTestCase | tests add: (environment testDataFor: lintTestCase) ].
	environment selectedTests: tests.
	
	testRunner := SLTestRunner new.
	resultEnvironment := testRunner runOnEnvironment: environment.
	results := resultEnvironment results.

	self assert: results isEmpty description: results
]
