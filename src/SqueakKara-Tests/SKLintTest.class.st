Class {
	#name : #SKLintTest,
	#superclass : #TestCase,
	#category : #'SqueakKara-Tests'
}

{
	#category : #formatting,
	#'squeak_changestamp' : 'mr 5/23/2026 17:32'
}
SKLintTest >> formatResultsReport: results [
	
	^ String streamContents: [ :stream |
		stream nextPut: Character cr.
		
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
	#'squeak_changestamp' : 'mr 5/23/2026 17:32'
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
	#'squeak_changestamp' : 'mr 5/23/2026 17:36'
}
SKLintTest >> writeResult: result on: stream [
	
	| pluralS resultText equalsLine minusLine |
	
	pluralS := result value > 1 ifTrue: [ 's' ] ifFalse: [ '' ].
	resultText := 
		result testData name, ': ', 
		result value, ' occurence', pluralS, 'in ', result testObject name.
		
	equalsLine := String new: resultText size withAll: $=.
	minusLine := String new: resultText size withAll: $-.
	
	stream
		nextPutAll: equalsLine; cr;
		nextPutAll: resultText; cr;
		nextPutAll: minusLine; cr; 
		cr
]
