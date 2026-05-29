Class {
	#name : #SKLintTest,
	#superclass : #TestCase,
	#category : #'SqueakKara-Tests'
}

{
	#category : #formatting,
	#'squeak_changestamp' : 'mr 5/29/2026 11:41'
}
SKLintTest >> formatResultsReport: aCollection [
	
	^ String streamContents: [ :stream |
		stream nextPut: Character cr.
		
		aCollection do: [ :result |
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
	#category : #formatting,
	#'squeak_changestamp' : 'mr 5/29/2026 11:37'
}
SKLintTest >> resultTextForBoolean: aResult [

	^ aResult testData name, ' in ', aResult testObject name
]

{
	#category : #formatting,
	#'squeak_changestamp' : 'mr 5/29/2026 11:39'
}
SKLintTest >> resultTextForNumber: aResult [

	| pluralS |
	
	pluralS := aResult value > 1 ifTrue: [ 's' ] ifFalse: [ '' ].
	
	^  aResult testData name, 
		': ', 
		aResult value asString, 
		'occurence ', 
		pluralS , 
		'in ', 
		aResult testObject name
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
	#'squeak_changestamp' : 'mr 5/29/2026 11:40'
}
SKLintTest >> writeMatchingMethodsFor: aResult on: aStream [

	aResult testObject methods do: [ :method |
		method results
			select: [ :methodResult | methodResult value ]
			thenDo: [ :methodResult |
				aStream
					nextPutAll: 'In Method >> ';
					nextPutAll: method sourceCode;
					cr; 
					cr ] ]
]

{
	#category : #formatting,
	#'squeak_changestamp' : 'mr 5/29/2026 11:40'
}
SKLintTest >> writeResult: aResult on: aStream [
	
	| resultText equalsLine minusLine |
	
	resultText := aResult value isNumber 
		ifTrue: [ self resultTextForNumber: aResult ] 
		ifFalse: [ self resultTextForBoolean: aResult ].

	equalsLine := String new: resultText size withAll: $=.
	minusLine := String new: resultText size withAll: $-.
	
	aStream
		nextPutAll: equalsLine; cr;
		nextPutAll: resultText; cr;
		nextPutAll: minusLine; cr; 
		cr
]
