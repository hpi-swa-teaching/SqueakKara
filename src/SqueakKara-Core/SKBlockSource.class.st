Class {
	#name : #SKBlockSource,
	#superclass : #Morph,
	#category : #'SqueakKara-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 19:13'
}
SKBlockSource >> addControlBlocks [
		
	self addMorphBack: self ifBlock.
	self addMorphBack: self ifElseBlock.
	self addMorphBack: self forLoop.
	self addMorphBack: self untilLoop.
	self addMorphBack: self functionCall.
	self addMorphBack: self functionStart.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 18:30'
}
SKBlockSource >> addMovementBlocks [
	
	self addMorphBack: self moveBlock.
	self addMorphBack: self moveStepsBlock.
	self addMorphBack: self turnLeftBlock.
	self addMorphBack: self turnRightBlock.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 18:32'
}
SKBlockSource >> addSensingBlocks [
		
	"self addMorphBack: self andBlock."
	self addMorphBack: self trunkAheadBlock.
	self addMorphBack: self onCloverleafBlock
]

{
	#category : #'block definitions - sensing',
	#'squeak_changestamp' : 'FR 6/9/2026 18:31'
}
SKBlockSource >> andBlock [

	^ SKBooleanBlock new
		addBooleanPart;
		addLabel: 'and';
		addBooleanPart;
		value: [:bool1 :bool2 | '(',bool1,' and:[',bool2,'])'];
		category: #sensing;
		updateLayout;
		yourself
]

{
	#category : #'block definitions - control',
	#'squeak_changestamp' : 'FR 6/9/2026 18:24'
}
SKBlockSource >> forLoop [

	^ SKActionBlock new
		addLabel: 'repeat';
		addIntegerPart;
		addLabel: 'times';
		addBlockGap;
		action: [:repetitions :trueBranch |
			'(', repetitions,') timesRepeat: [', String cr, trueBranch, ']'];
		updateLayout;
		yourself
]

{
	#category : #'block definitions - control',
	#'squeak_changestamp' : 'FR 6/9/2026 23:27'
}
SKBlockSource >> functionCall [

	| newBlock |

	newBlock := SKActionBlock new
		addLabel: 'send';
		addStringPartWithText: 'Message 1';
		action: [:input | ((self ownerThatIsA: SKBlockEditor) functionStarts at: input) value];
		updateLayout;
		yourself.
	newBlock action: [:input | ((newBlock ownerThatIsA: SKBlockEditor) functionStarts at: input) value].
	^ newBlock
]

{
	#category : #'block definitions - control',
	#'squeak_changestamp' : 'FR 6/9/2026 22:39'
}
SKBlockSource >> functionStart [

	^ SKFunctionStart new
		isStart: true;
		action: '';
		updateLayout;
		yourself
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:13'
}
SKBlockSource >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'block definitions - control',
	#'squeak_changestamp' : 'FR 6/9/2026 18:23'
}
SKBlockSource >> ifBlock [

	^ SKActionBlock new
		addLabel: 'if';
		addBooleanPart;
		addLabel: 'then';
		addBlockGap;
		action: [:condition :trueBranch |
			'(', condition,') ifTrue: [', String cr, trueBranch, ']'];
		updateLayout;
		yourself 
]

{
	#category : #'block definitions - control',
	#'squeak_changestamp' : 'FR 6/9/2026 18:24'
}
SKBlockSource >> ifElseBlock [

	^ SKActionBlock new
		addLabel: 'if';
		addBooleanPart;
		addLabel: 'then';
		addBlockGap;
		addLabel: 'else';
		addBlockGap;
		action: [:condition :trueBranch :falseBranch |
			'(', condition,') ifTrue: [', String cr, trueBranch, '] ifFalse: [', String cr, falseBranch, ']'];
		updateLayout;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Lars Kuhr 6/9/2026 15:15'
}
SKBlockSource >> initialize [

	super initialize.
	
	self color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		layoutInset: 10;
		hResizing: #spaceFill;
	 	vResizing: #spaceFill;
		cellPositioning: #topLeft;
		cellGap: 10;
		populate
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:12'
}
SKBlockSource >> mouseDown: anEvent [ 

	(self targetMorphAt: anEvent)
		ifNotNil: [anEvent hand
				waitForClicksOrDrag: self
				event: anEvent
				selectors: {nil. nil. nil. #startDrag:}
				threshold: HandMorph dragThreshold]
]

{
	#category : #'block definitions - movement',
	#'squeak_changestamp' : 'FR 6/9/2026 18:28'
}
SKBlockSource >> moveBlock [

	^ SKActionBlock new
		addLabel: 'move';
		action: ['kara move'];
		category: #movement;
		updateLayout;
		yourself
]

{
	#category : #'block definitions - movement',
	#'squeak_changestamp' : 'FR 6/9/2026 18:28'
}
SKBlockSource >> moveStepsBlock [

	^ SKActionBlock new
		addLabel: 'move';
		addIntegerPart;
		addLabel: 'steps';
		action: [:steps | steps,' timesRepeat: [kara move]']; 
		category: #movement;
		updateLayout;
		yourself
]

{
	#category : #'block definitions - sensing',
	#'squeak_changestamp' : 'FR 6/9/2026 18:32'
}
SKBlockSource >> onCloverleafBlock [

	^ SKBooleanBlock new
		addLabel: 'on cloverleaf';
		value: ['kara onCloverleaf'];
		category: #sensing;
		updateLayout;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/9/2026 18:06'
}
SKBlockSource >> populate [
	
	self addMovementBlocks.
	self addControlBlocks.
	self addSensingBlocks.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'SLH 6/6/2026 01:13'
}
SKBlockSource >> startDrag: anEvent [

	| hit |
	
	(hit := self targetMorphAt: anEvent) ifNil:[^self].
	anEvent hand grabMorph: (hit duplicate leftSource: true)
	
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Lars Kuhr 5/27/2026 09:12'
}
SKBlockSource >> targetMorphAt: anEvent [

	| hits |
	
	hits := self morphsAt: anEvent cursorPoint.
	hits := hits select:[:m| m owner == self].
	(hits isEmpty or:[hits size >1]) ifTrue:[^nil].
	^hits first

]

{
	#category : #'block definitions - sensing',
	#'squeak_changestamp' : 'FR 6/9/2026 18:32'
}
SKBlockSource >> trunkAheadBlock [

	^ SKBooleanBlock new
		addLabel: 'trunk ahead';
		value: ['kara trunkAhead'];
		category: #sensing;
		updateLayout;
		yourself
]

{
	#category : #'block definitions - movement',
	#'squeak_changestamp' : 'FR 6/9/2026 18:29'
}
SKBlockSource >> turnLeftBlock [

	^ SKActionBlock new
		addLabel: 'turn left';
		action: ['kara turn: left'];
		category: #movement;
		updateLayout;
		yourself
]

{
	#category : #'block definitions - movement',
	#'squeak_changestamp' : 'FR 6/9/2026 18:29'
}
SKBlockSource >> turnRightBlock [

	^ SKActionBlock new
		addLabel: 'turn right';
		action: ['kara turn: right'];
		category: #movement;
		updateLayout;
		yourself
]

{
	#category : #'block definitions - control',
	#'squeak_changestamp' : 'FR 6/9/2026 18:25'
}
SKBlockSource >> untilLoop [

	^ SKActionBlock new
		addLabel: 'repeat until';
		addBooleanPart;
		addBlockGap;
		action: [:condition :loopBranch |
			'[', condition,'] whileFalse: [', String cr, loopBranch, ']'];
		updateLayout;
		yourself
]
