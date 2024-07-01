"
SKTrunk adds the proper texture and a way to identify it as a trunk to the functionality provided by SKGridObject.
"
Class {
	#name : #SKTrunk,
	#superclass : #SKGridObject,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:56'
}

{
	#category : #type,
	#'squeak_changestamp' : 'jt 6/11/2024 13:01'
}
SKTrunk >> isTrunk [
	
	^ true
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'jt 6/11/2024 19:54'
}
SKTrunk >> textureFilename [

	^ 'Trunk.png'
]
