Class {
	#name : #SKBlockSource,
	#superclass : #Morph,
	#category : #'SqueakKara-Core'
}

{
	#category : #'block definitions - operators',
	#'squeak_changestamp' : 'SLH 6/16/2026 17:34'
}
SKBlockSource >> andBlock [

	^ SKBooleanBlock new
		addBooleanPart;
		addLabel: 'and';
		addBooleanPart;
		value: [:bool1 :bool2 | '((',bool1,') and: [',bool2,'])'];
		category: #sensing;
		updateLayout;
		yourself
]

{
	#category : #categories,
	#'squeak_changestamp' : 'SSP 6/14/2026 16:50'
}
SKBlockSource >> controlCategory [

	^ SKBlockCategory new
		title: 'Control';
		addBlock: self ifBlock;
		addBlock: self ifElseBlock;
		addBlock: self forLoop;
		addBlock: self untilLoop;
		addBlock: self functionCall;
		addBlock: self functionStart;
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
	#'squeak_changestamp' : 'SS 6/14/2026 17:35'
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
	#'squeak_changestamp' : 'SSP 6/13/2026 14:00'
}
SKBlockSource >> initialize [

	super initialize.
	
	self color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		layoutInset: 10;
		hResizing: #spaceFill;
	 	vResizing: #shrinkWrap;
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
	#category : #categories,
	#'squeak_changestamp' : 'SLH 6/16/2026 21:11'
}
SKBlockSource >> movementCategory [

	^ SKBlockCategory new
		title: 'Movement';
		addBlock: self moveBlock;
		addBlock: self moveStepsBlock;
		addBlock: self pushBlock;
		addBlock: self turnLeftBlock;
		addBlock: self turnRightBlock;
		yourself
]

{
	#category : #'block definitions - sensing',
	#'squeak_changestamp' : 'SLH 6/16/2026 17:38'
}
SKBlockSource >> mushroomAheadBlock [

	^ SKBooleanBlock new
		addLabel: 'mushroom ahead';
		value: ['kara mushroomAhead'];
		category: #sensing;
		updateLayout;
		yourself
]

{
	#category : #'block definitions - operators',
	#'squeak_changestamp' : 'SLH 6/16/2026 17:35'
}
SKBlockSource >> notBlock [

	^ SKBooleanBlock new
		addLabel: 'not';
		addBooleanPart;
		value: [:bool | '(', bool, ') not'];
		category: #sensing;
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
	#category : #categories,
	#'squeak_changestamp' : 'SLH 6/16/2026 21:10'
}
SKBlockSource >> operatorCategory [
	
	^ SKBlockCategory new
		title: 'Operators';
		addBlock: self andBlock;
		addBlock: self orBlock;
		addBlock: self notBlock;
		yourself
]

{
	#category : #'block definitions - operators',
	#'squeak_changestamp' : 'SLH 6/16/2026 17:35'
}
SKBlockSource >> orBlock [

	^ SKBooleanBlock new
		addBooleanPart;
		addLabel: 'or';
		addBooleanPart;
		value: [:bool1 :bool2 | '((',bool1,') or: [',bool2,'])'];
		category: #sensing;
		updateLayout;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'SLH 6/16/2026 21:10'
}
SKBlockSource >> populate [

	self addMorphBack: self movementCategory;
		addMorphBack: self controlCategory;
		addMorphBack: self sensingCategory;
		addMorphBack: self operatorCategory
]

{
	#category : #'block definitions - movement',
	#'squeak_changestamp' : 'SLH 6/16/2026 17:40'
}
SKBlockSource >> pushBlock [

	^ SKActionBlock new
		addLabel: 'push';
		action: ['kara push'];
		category: #movement;
		updateLayout;
		yourself
]

{
	#category : #categories,
	#'squeak_changestamp' : 'SLH 6/16/2026 21:11'
}
SKBlockSource >> sensingCategory [
	
	^ SKBlockCategory new
		title: 'Sensing';
		addBlock: self trunkAheadBlock;
		addBlock: self mushroomAheadBlock;
		addBlock: self onCloverleafBlock;
		yourself
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'SSP 6/13/2026 14:25'
}
SKBlockSource >> startDrag: anEvent [

	| hit duplicate |
	
	(hit := self targetMorphAt: anEvent) ifNil: [^ self].
	duplicate := hit duplicate leftSource: true.
	duplicate position: anEvent hand position - (hit extent // 2).
	anEvent hand grabMorph: duplicate
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'SS 6/14/2026 17:32'
}
SKBlockSource >> targetMorphAt: anEvent [
	
	^ (self morphsAt: anEvent cursorPoint)
		detect: [:m | m isKindOf: SKBlock]
		ifNone: [nil]
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
