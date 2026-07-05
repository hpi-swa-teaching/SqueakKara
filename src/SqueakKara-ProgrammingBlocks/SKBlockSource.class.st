"
A SKBlockSource is the scrollable List of all available Blocks. Duplicates of the individual blocks can be dragged from this source to be placed in (usually) a SKBlockEditor 

Instance Variables
	variablesCategory:		<Object>

variablesCategory
	- reference to the variables Category of this instance to easier allow adding new variables to that category

"
Class {
	#name : #SKBlockSource,
	#superclass : #Morph,
	#instVars : [
		'variablesCategory'
	],
	#category : #'SqueakKara-ProgrammingBlocks',
	#'squeak_changestamp' : 'FR 6/30/2026 21:43'
}

{
	#category : #'block definitions - variables',
	#'squeak_changestamp' : 'FR 6/30/2026 01:17'
}
SKBlockSource >> addToVariableBlock [

	^ SKActionBlock new
		addLabel: 'add';
		addIntegerPart;
		addLabel: 'to Variable';
		addEmptyIntegerPart;
		action: [:int :var | var,':= ',var, ' + ', int];
		updateLayout;
		yourself
]

{
	#category : #'block definitions - variables',
	#'squeak_changestamp' : 'FR 6/30/2026 20:22'
}
SKBlockSource >> addVariable [

	self variablesCategory addBlock: (SKIntegerBlock new 
		addLabel: ('Variable ', (self blockEditor variables size + 1));
		value: 'variable', (self blockEditor variables size + 1);
		updateLayout;
		yourself).
	self blockEditor variables add: ('variable', (self blockEditor variables size + 1))
]

{
	#category : #'block definitions - variables',
	#'squeak_changestamp' : 'FR 6/30/2026 01:15'
}
SKBlockSource >> addVariablesButton [

	^ SimpleButtonMorph new label: 'add Variable';
		"layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		wrapCentering: #center;"
		target: self;
		actionSelector: #addVariable;
		color: Color lightGray twiceLighter;
		yourself
]

{
	#category : #'block definitions - operators',
	#'squeak_changestamp' : 'FR 6/23/2026 18:21'
}
SKBlockSource >> andBlock [

	^ SKBooleanBlock new
		addBooleanPart;
		addLabel: 'and';
		addBooleanPart;
		value: [:bool1 :bool2 | '((',bool1,') and: [',bool2,'])'];
		category: #operators;
		updateLayout;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 7/3/2026 03:00'
}
SKBlockSource >> blockEditor [

	self flag: #todo. 
	"make this nicer. passing the blockEditor in an instance var kills squeak when adding some blocks as the code of the blocks is stored in a block Closure including its sender (the blockSource) and by extension the blockEditor itself -> very big very fast"
	^ ((self owner owner owner owner firstSubmorph submorphs at: 2) submorphs at: 3) firstSubmorph 
]

{
	#category : #categories,
	#'squeak_changestamp' : 'FR 6/24/2026 02:55'
}
SKBlockSource >> collapseAll [

	self submorphsDo: [:each | each collapse]
]

{
	#category : #categories,
	#'squeak_changestamp' : 'FR 6/23/2026 19:45'
}
SKBlockSource >> controlCategory [

	^ SKBlockCategory new
		title: 'Control';
		setColorsToMatchCategory: #default;
		addBlock: self ifBlock;
		addBlock: self ifElseBlock;
		addBlock: self forLoop;
		addBlock: self untilLoop;
		addBlock: self functionCall;
		addBlock: self functionStart;
		yourself
]

{
	#category : #'block definitions - operators',
	#'squeak_changestamp' : 'FR 6/29/2026 20:57'
}
SKBlockSource >> equalBlock [

	^ SKBooleanBlock new
		addIntegerPart;
		addLabel: '=';
		addIntegerPart;
		value: [:int1 :int2 | '((',int1,') = (',int2,'))'];
		category: #operators;
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
	#'squeak_changestamp' : 'FR 7/3/2026 02:51'
}
SKBlockSource >> functionCall [

	| newBlock |

	newBlock := SKActionBlock new
		addLabel: 'send';
		addStringPartWithText: 'Message 1';
		action: [:input | 'placeholder', input];
		updateLayout;
		yourself.
	newBlock action: [:input | ((newBlock ownerThatIsA: SKBlockEditor) functionStartWithName: input) getCode].
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
	#category : #'block definitions - operators',
	#'squeak_changestamp' : 'FR 6/29/2026 20:59'
}
SKBlockSource >> greaterBlock [

	^ SKBooleanBlock new
		addIntegerPart;
		addLabel: '>';
		addIntegerPart;
		value: [:int1 :int2 | '((',int1,') > (',int2,'))'];
		category: #operators;
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
	#'squeak_changestamp' : 'FR 6/24/2026 02:55'
}
SKBlockSource >> initialize [

	super initialize.
	
	self color: Color transparent;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		layoutInset: SKBlockStyle unit * 2;
		hResizing: #shrinkWrap;
	 	vResizing: #shrinkWrap;
		cellPositioning: #topLeft;
		cellGap:  SKBlockStyle unit * 5;
		populate;
		adjustLayoutBounds;
		layoutChanged;
		minWidth: self width;
		collapseAll
]

{
	#category : #'block definitions - operators',
	#'squeak_changestamp' : 'FR 6/29/2026 20:59'
}
SKBlockSource >> lessBlock [

	^ SKBooleanBlock new
		addIntegerPart;
		addLabel: '<';
		addIntegerPart;
		value: [:int1 :int2 | '((',int1,') < (',int2,'))'];
		category: #operators;
		updateLayout;
		yourself
]

{
	#category : #'block definitions - operators',
	#'squeak_changestamp' : 'FR 6/29/2026 21:00'
}
SKBlockSource >> minusBlock [

	^ SKIntegerBlock new
		addIntegerPart;
		addLabel: '-';
		addIntegerPart;
		value: [:int1 :int2 | '((',int1,') - (',int2,'))'];
		category: #operators;
		updateLayout;
		yourself
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
	#'squeak_changestamp' : 'FR 6/23/2026 19:45'
}
SKBlockSource >> movementCategory [

	^ SKBlockCategory new
		title: 'Movement';
		setColorsToMatchCategory: #movement;
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
	#'squeak_changestamp' : 'FR 6/23/2026 18:21'
}
SKBlockSource >> notBlock [

	^ SKBooleanBlock new
		addLabel: 'not';
		addBooleanPart;
		value: [:bool | '(', bool, ') not'];
		category: #operators;
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
	#'squeak_changestamp' : 'FR 6/29/2026 20:55'
}
SKBlockSource >> operatorCategory [
	
	^ SKBlockCategory new
		title: 'Operators';
		setColorsToMatchCategory: #operators;
		addBlock: self plusBlock;
		addBlock: self minusBlock;
		addBlock: self equalBlock;
		addBlock: self greaterBlock;
		addBlock: self lessBlock;
		addBlock: self andBlock;
		addBlock: self orBlock;
		addBlock: self notBlock;
		yourself
]

{
	#category : #'block definitions - operators',
	#'squeak_changestamp' : 'FR 6/23/2026 18:21'
}
SKBlockSource >> orBlock [

	^ SKBooleanBlock new
		addBooleanPart;
		addLabel: 'or';
		addBooleanPart;
		value: [:bool1 :bool2 | '((',bool1,') or: [',bool2,'])'];
		category: #operators;
		updateLayout;
		yourself
]

{
	#category : #'block definitions - operators',
	#'squeak_changestamp' : 'FR 6/29/2026 21:00'
}
SKBlockSource >> plusBlock [

	^ SKIntegerBlock new
		addIntegerPart;
		addLabel: '+';
		addIntegerPart;
		value: [:int1 :int2 | '((',int1,') + (',int2,'))'];
		category: #operators;
		updateLayout;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'FR 6/30/2026 00:05'
}
SKBlockSource >> populate [

	self addMorphBack: self movementCategory;
		addMorphBack: self controlCategory;
		addMorphBack: self sensingCategory;
		addMorphBack: self operatorCategory;
		addMorphBack: self variablesCategory
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
	#'squeak_changestamp' : 'FR 6/23/2026 19:46'
}
SKBlockSource >> sensingCategory [
	
	^ SKBlockCategory new
		title: 'Sensing';
		setColorsToMatchCategory: #sensing;
		addBlock: self trunkAheadBlock;
		addBlock: self mushroomAheadBlock;
		addBlock: self onCloverleafBlock;
		yourself
]

{
	#category : #'block definitions - variables',
	#'squeak_changestamp' : 'FR 6/30/2026 18:59'
}
SKBlockSource >> setVariableBlock [

	^ SKActionBlock new
		addLabel: 'set Variable';
		addEmptyIntegerPart;
		addLabel: 'to';
		addIntegerPart;
		action: [:var :int | var,':= ',int];
		updateLayout;
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

{
	#category : #categories,
	#'squeak_changestamp' : 'FR 6/30/2026 01:18'
}
SKBlockSource >> variablesCategory [
	
	^ variablesCategory ifNil: [variablesCategory := SKBlockCategory new
		title: 'Variables';
		setColorsToMatchCategory: #default;
		addBlock: self setVariableBlock;
		addBlock: self addToVariableBlock;
		addBlock: self addVariablesButton;
		
		yourself. ^ variablesCategory]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'FR 6/30/2026 00:36'
}
SKBlockSource >> variablesCategory: anObject [
	variablesCategory := anObject
]
