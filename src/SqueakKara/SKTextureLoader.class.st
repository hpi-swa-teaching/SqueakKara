Class {
	#name : #SKTextureLoader,
	#superclass : #Object,
	#instVars : [
		'assetLoader'
	],
	#category : #SqueakKara
}

{
	#category : #assessing,
	#'squeak_changestamp' : 'JJG 6/5/2024 17:11'
}
SKTextureLoader >> assetLoader [

	^ assetLoader ifNil: [assetLoader := GitAssetLoader for: self repositoryName basePath: self basePath]
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'JJG 6/5/2024 17:08'
}
SKTextureLoader >> basePath [

	 ^ 'assets'
]

{
	#category : #assessing,
	#'squeak_changestamp' : 'JJG 6/5/2024 17:09'
}
SKTextureLoader >> getTexture: aFilename [

	^ self assetLoader loadForm: aFilename

	
]

{
	#category : #assessing,
	#'squeak_changestamp' : 'JJG 6/5/2024 17:12'
}
SKTextureLoader >> getTexture: aFilename scaledToWidth: aNumber [

	^ (self getTexture: aFilename) scaledToSize: aNumber @ aNumber

	
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'JJG 6/5/2024 17:07'
}
SKTextureLoader >> repositoryName [

	^ 'SqueakKara'
]
