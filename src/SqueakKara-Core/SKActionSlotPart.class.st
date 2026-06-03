Class {
	#name : #SKActionSlotPart,
	#superclass : #SKInputSlotPart,
	#category : #'SqueakKara-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 19:45'
}
SKActionSlotPart >> connectionPoint [

	^ self topCenter + self block tabOffsetInner.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 19:49'
}
SKActionSlotPart >> defaultValue [

	^ nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 20:07'
}
SKActionSlotPart >> initialize [
	
	super initialize.
	
	self color: Color blue;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap.
		
	self defaultUI: (RectangleMorph new color: Color red; borderColor: Color orange; hResizing: #spaceFill).
	
	self addMorphBack: self defaultUI.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'SLH 6/3/2026 19:37'
}
SKActionSlotPart >> type [

	^ #Action.
]
