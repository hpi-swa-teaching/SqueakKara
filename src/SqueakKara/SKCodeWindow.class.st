Class {
	#name : #SKCodeWindow,
	#superclass : #Object,
	#instVars : [
		'browser'
	],
	#category : #SqueakKara
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KD 5/20/2024 21:25'
}
SKCodeWindow >> initialize [
	"comment stating purpose of message"

	| window categoryName|
	
	categoryName := 'KaraFiles'.
	(SystemOrganization categories includes: categoryName) ifFalse: [SystemOrganization addCategory: categoryName].
	browser := ToolSet browseCategory: categoryName.
	(browser myDependents at: 2) abandon.
	window := browser myDependents first.
]
