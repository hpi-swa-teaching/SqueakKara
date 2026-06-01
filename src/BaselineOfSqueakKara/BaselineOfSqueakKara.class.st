Class {
	#name : #BaselineOfSqueakKara,
	#superclass : #BaselineOf,
	#category : #BaselineOfSqueakKara
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'mr 5/31/2026 20:46'
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
                     baseline: 'SwaLint' with: [
                         spec repository: 'github://hpi-swa-teaching/SwaLint:main/packages'. ].
                 spec
                     package: 'SqueakKara' with: [spec requires: #('GitS'); postLoadDoIt: #postLoad];
                     package: 'SqueakKaraTests' with: [spec requires: #('default' 'SwaLint')];
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
