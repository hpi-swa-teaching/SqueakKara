Class {
	#name : #BaselineOfSqueakKara,
	#superclass : #BaselineOf,
	#category : #BaselineOfSqueakKara
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'SLH 7/5/2026 11:12'
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
                     package: 'SqueakKara-Core' with: [spec requires: #('Squot'); postLoadDoIt: #postLoad];
                     package: 'SqueakKara-ProgrammingBlocks' with: [spec requires: #('SqueakKara-Core')];
                     package: 'SqueakKara-Tests' with: [spec requires: #('default')];
                     yourself.
                 spec
                     group: 'default' with: #('SqueakKara-Core' ' SqueakKara-ProgrammingBlocks');
                     group: 'tests' with: #('SqueakKara-Tests');
                     yourself].
]

{
	#category : #baseline,
	#'squeak_changestamp' : 'LK 6/14/2024 19:08'
}
BaselineOfSqueakKara >> postLoad [
]
