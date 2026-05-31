Class {
	#name : #SKLintTest,
	#superclass : #TestCase,
	#category : #SqueakKaraTests
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
	#'squeak_changestamp' : 'mr 5/29/2026 11:50'
}
SKLintTest >> resultTextForBoolean: aResult [
	
	| className lintCaseName |
	
	className := aResult testObject name.
	lintCaseName := aResult testData name.
	
	^ lintCaseName, ' in ', className
]

{
	#category : #formatting,
	#'squeak_changestamp' : 'mr 5/29/2026 11:51'
}
SKLintTest >> resultTextForNumber: aResult [

	| pluralS numberOccurences lintCaseName className |
	
	pluralS := aResult value > 1 ifTrue: [ 's' ] ifFalse: [ '' ].
	lintCaseName := aResult testData name.
	numberOccurences := aResult value asString.
	className := aResult testObject name.
	
	^  lintCaseName, 
		': ', 
		numberOccurences, 
		' occurence ', 
		pluralS , 
		'in ', 
		className
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
	#'squeak_changestamp' : 'mr 5/29/2026 11:53'
}
SKLintTest >> writeMatchingMethodsFor: aResult on: aStream [

	aResult testObject methods do: [ :method |
		method results
			select: [ :methodResult | methodResult value ]
			thenDo: [ :methodResult |
				| className |
				
				className := aResult testObject name.
				aStream
					nextPutAll: 'In ';
					nextPutAll: className;
					nextPutAll: ' >> ';
					nextPutAll: method sourceCode;
					cr; 
					cr ] ]
]

{
	#category : #formatting,
	#'squeak_changestamp' : 'mr 5/29/2026 11:56'
}
SKLintTest >> writeResult: aResult on: aStream [
	
	| resultText equalsLine |
	
	resultText := aResult value isNumber 
		ifTrue: [ self resultTextForNumber: aResult ] 
		ifFalse: [ self resultTextForBoolean: aResult ].

	equalsLine := String new: resultText size withAll: $=.
	
	aStream
		nextPutAll: equalsLine; cr;
		nextPutAll: resultText; cr;
		nextPutAll: equalsLine; cr; 
		cr
]
