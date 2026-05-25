"
SKTextureLoader is used to load and scale all textures.
"
Class {
	#name : #SKTextureLoader,
	#superclass : #Object,
	#instVars : [
		'assetLoader'
	],
	#category : #'SqueakKara-Core',
	#'squeak_changestamp' : 'JJG 7/1/2024 16:01'
}

{
	#category : #assessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:54'
}
SKTextureLoader >> assetLoader [

	^ assetLoader ifNil: [ self assetLoader: (GitAssetLoader for: self repositoryName basePath: self basePath)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LM 4/28/2026 20:54'
}
SKTextureLoader >> assetLoader: aGitAssetLoader [

	^ assetLoader := aGitAssetLoader
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
	#'squeak_changestamp' : 'ND 5/25/2026 20:43'
}
SKTextureLoader >> getAnimatedMorphFromGif: aFilename [

	^ self assetLoader loadAnimatedImageMorph: aFilename

	
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
