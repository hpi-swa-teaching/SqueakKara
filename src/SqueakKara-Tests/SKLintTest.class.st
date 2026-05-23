Class {
	#name : #SKLintTest,
	#superclass : #TestCase,
	#category : #'SqueakKara-Tests'
}

{
	#category : #formatting,
	#'squeak_changestamp' : 'mr 5/23/2026 12:33'
}
SKLintTest >> formatResultsReport: results [
	
	^ String streamContents: [ :stream |
		results do: [ :result |
			self writeResult: result on: stream.
			self writeMatchingMethodsFor: result on: stream ] ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mr 5/23/2026 11:59'
}
SKLintTest >> lintTestCases [

	^ {	#instanceVariableAccessIsConsistent: .
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
	#'squeak_changestamp' : 'mr 5/23/2026 11:59'
}
SKLintTest >> testLinting [
	
	| packageName target environment tests testRunner resultEnvironment testResults |

	packageName := self packageName.
	PackageInfo allPackages detect: [ :package | package name = packageName ] ifNone: [ self fail: 'Package not found: ', packageName ].
	
	target := SL2Target withSystemCategories: { packageName }.
	environment := SLDefaultEnvironment new.
	environment selectedClasses: target classes.
	
	tests := OrderedCollection new.
	self lintTestCases do: [ :lintTestCase | tests add: (environment testDataFor: lintTestCase) ].
	environment selectedTests: tests.
	
	testRunner := SLTestRunner new.
	resultEnvironment := testRunner runOnEnvironment: environment.
	testResults := resultEnvironment results.
	
	self assert: testResults isEmpty description: (String cr, (self formatResultsReport: testResults))
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
	#'squeak_changestamp' : 'mr 5/23/2026 12:22'
}
SKLintTest >> writeResult: result on: stream [
	
	| pluralS |
	
	pluralS := result value > 1 ifTrue: [ 's' ] ifFalse: [ '' ].
	
	stream
		nextPutAll: '======';
		cr;
		nextPutAll: result testData name;
		nextPutAll: ': ';
		nextPutAll: result value asString;
		nextPutAll: ' occurrence', pluralS, ' in ';
		nextPutAll: result testObject name;
		cr;
		nextPutAll: '======';
		cr; 
		cr
]
