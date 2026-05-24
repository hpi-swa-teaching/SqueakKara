Class {
	#name : #BaselineOfSqueakKara,
	#superclass : #BaselineOf,
	#category : #BaselineOfSqueakKara
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'mr 5/24/2026 19:38'
}
BaselineOfSqueakKara >> baseline: spec [
         <baseline>
         spec
             for: #'common'
             do: [
                 spec    
                     baseline: 'GitS' with: [
                         spec repository: 'github://hpi-swa/git-s:latest-release/src'. ].
                 spec
                     package: 'SqueakKara' with: [spec requires: #('GitS'); postLoadDoIt: #postLoad];
                     package: 'SqueakKaraTests' with: [spec requires: #('default')];
                     yourself.
                 spec
                     group: 'default' with: #('SqueakKara');
                     group: 'tests' with: #('SqueakKaraTests');
                     yourself].
]

{
	#category : #baseline,
	#'squeak_changestamp' : 'LK 6/14/2024 19:08'
}
BaselineOfSqueakKara >> postLoad [
]
