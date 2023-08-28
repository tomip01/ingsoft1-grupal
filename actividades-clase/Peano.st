!classDefinition: #I category: 'Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:02:24'!
+ aNaturalNumber

	^aNaturalNumber next! !

!I class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 20:31:38'!
next
	^II! !


!classDefinition: #II category: 'Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Peano'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:16:51'!
+ aNaturalNumber
	^ self previous + aNaturalNumber next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:41:21'!
- aNaturalNumber
        
	aNaturalNumber = I ifTrue: [^self previous].
	^ self previous - aNaturalNumber previous 
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:19:45'!
next
	next ifNotNil: [^next].
	next:= self cloneNamed: self name, 'I'.
	next previous: self.
	^next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:21:58'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:26:29'!
previous: aNaturalNumber
	previous:= aNaturalNumber! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'ma 8/24/2023 21:50:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'Peano'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Peano'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:39:49'!
+ aNaturalNumber
	^ self previous + aNaturalNumber next! !

!III class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:41:57'!
- aNaturalNumber
        
	aNaturalNumber = I ifTrue: [^self previous].
	^ self previous - aNaturalNumber previous 
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:39:49'!
next
	next ifNotNil: [^next].
	next:= self cloneNamed: self name, 'I'.
	next previous: self.
	^next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:39:49'!
previous
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:39:49'!
previous: aNaturalNumber
	previous:= aNaturalNumber! !


!III class methodsFor: '--** private fileout/in **--' stamp: 'ma 8/24/2023 21:50:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: 'Peano'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Peano'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:42:20'!
+ aNaturalNumber
	^ self previous + aNaturalNumber next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:42:20'!
- aNaturalNumber
        
	aNaturalNumber = I ifTrue: [^self previous].
	^ self previous - aNaturalNumber previous 
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:42:20'!
next
	next ifNotNil: [^next].
	next:= self cloneNamed: self name, 'I'.
	next previous: self.
	^next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:42:20'!
previous
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:42:20'!
previous: aNaturalNumber
	previous:= aNaturalNumber! !


!IIII class methodsFor: '--** private fileout/in **--' stamp: 'ma 8/24/2023 21:50:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: 'Peano'!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: 'Peano'!
IIIII class
	instanceVariableNames: 'next previous'!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:42:26'!
+ aNaturalNumber
	^ self previous + aNaturalNumber next! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:42:26'!
- aNaturalNumber
        
	aNaturalNumber = I ifTrue: [^self previous].
	^ self previous - aNaturalNumber previous 
	! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:42:26'!
next
	next ifNotNil: [^next].
	next:= self cloneNamed: self name, 'I'.
	next previous: self.
	^next.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:42:26'!
previous
	^previous! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'ma 8/24/2023 21:42:26'!
previous: aNaturalNumber
	previous:= aNaturalNumber! !


!IIIII class methodsFor: '--** private fileout/in **--' stamp: 'ma 8/24/2023 21:50:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIII.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!