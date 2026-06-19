"
The SKButtonReset implements the button to reset to the current challenge while maintaining the workspace code.
"
Class {
	#name : #SKButtonReset,
	#superclass : #SKButton,
	#category : #SqueakKara,
	#'squeak_changestamp' : 'ND 6/18/2026 22:05'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/19/2026 09:36'
}
SKButtonReset >> action [

	| newEnvironment |

	newEnvironment := SKEnvironment new perform: self environment currentChallenge.
	newEnvironment workspaces with: self environment workspaces do: [ 
		:workspace1 :workspace2 | workspace1 contents: workspace2 contents].
	
	self environment close.
	
	^ newEnvironment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ND 6/18/2026 21:56'
}
SKButtonReset >> textureFileName [
	
	^ 'reset.png'
]
