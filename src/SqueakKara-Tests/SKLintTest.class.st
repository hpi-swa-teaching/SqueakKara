Class {
	#name : #SKLintTest,
	#superclass : #TestCase,
	#category : #'SqueakKara-Tests'
}

{
	#category : #formatting,
	#'squeak_changestamp' : 'mr 5/23/2026 11:48'
}
SKLintTest >> formatResultsReport: results [
	
	^ String streamContents: [ :stream |
		results do: [ :result |
			self writeResult: result on: stream.
			self writeMatchingMethodsFor: result on: stream] ]
]

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
	#'squeak_changestamp' : 'mr 5/23/2026 11:49'
}
SKLintTest >> testLinting [
	
	| packageName target environment tests testRunner resultEnvironment testResults |

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
	testResults := resultEnvironment results.
	
	self assert: testResults isEmpty description: (self formatResultsReport: testResults)
]

{
	#category : #formatting,
	#'squeak_changestamp' : 'mr 5/23/2026 11:48'
}
SKLintTest >> writeMatchingMethodsFor: result on: stream [

	result testObject methods do: [ :method |
		method results
			select: [ :methodResult | methodResult value ]
			thenDo: [ :methodResult |
				stream
					nextPutAll: 'In Method >> ';
					nextPutAll: method sourceCode;
					cr; 
					cr ] ]
]

{
	#category : #formatting,
	#'squeak_changestamp' : 'mr 5/23/2026 11:48'
}
SKLintTest >> writeResult: result on: stream [
	
	stream
		nextPutAll: '======';
		cr;
		nextPutAll: result testData name;
		nextPutAll: ': ';
		nextPutAll: result value asString;
		nextPutAll: ' occurrences in ';
		nextPutAll: result testObject name;
		cr;
		nextPutAll: '======';
		cr; 
		cr
]
