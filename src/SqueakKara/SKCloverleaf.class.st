"
SKCloverleaf adds the proper texture and a way to identify it as a cloverleaf to the functionality provided by SKGridObject.
"
Class {
	#name : #SKCloverleaf,
	#superclass : #SKGridObject,
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 15:55'
}

{
	#category : #type,
	#'squeak_changestamp' : 'jt 6/11/2024 13:02'
}
SKCloverleaf >> isCloverleaf [

	^ true
]

{
	#category : #appearance,
	#'squeak_changestamp' : 'jt 6/11/2024 19:55'
}
SKCloverleaf >> textureFilename [

	^ 'Cloverleaf.png'
]
