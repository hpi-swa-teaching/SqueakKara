Class {
	#name : #BaselineOfSqueakKara,
	#superclass : #BaselineOf,
	#category : #BaselineOfSqueakKara
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'LK 6/12/2024 18:47'
}
BaselineOfSqueakKara >> baseline: spec [
         <baseline>
         spec
             for: #'common'
             do: [
                 spec    
                     baseline: 'Squot' with: [
                         spec repository: 'github://hpi-swa/Squot:mapper/src'. ].
                 spec    
                     baseline: 'SwaLint' with: [
                         spec repository: 'github://hpi-swa-teaching/SwaLint:main/packages'. ].
                 spec
                     package: 'SqueakKara-Core' with: [spec requires: #('Squot'); postLoadDoIt: #postLoad];
                     package: 'SqueakKara-Tests' with: [spec requires: #('default' 'SwaLint')];
                     yourself.
                 spec
                     group: 'default' with: #('SqueakKara-Core');
                     group: 'tests' with: #('SqueakKara-Tests');
                     yourself].
]

{
	#category : #baseline,
	#'squeak_changestamp' : 'LK 6/14/2024 19:08'
}
BaselineOfSqueakKara >> postLoad [
]