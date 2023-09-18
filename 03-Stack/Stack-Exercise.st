!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'tp 9/18/2023 10:18:15'!
test01StackPreserveElementsAndOrder

	| stackUsedForSearch stackUsedToCompare prefix sentenceFinderbyPrefix |
	
	sentenceFinderbyPrefix := SentenceFinderByPrefix new.
	
	stackUsedForSearch  := OOStack  new.
	stackUsedToCompare  := OOStack  new.
	
	stackUsedForSearch push: 'winter is coming'.
	stackUsedToCompare push: 'winter is coming'.
	stackUsedForSearch push: 'winning si everything'.
	stackUsedToCompare push: 'winning si everything'.
	stackUsedForSearch push: 'the winds of Winter'.
	stackUsedToCompare push: 'the winds of Winter'.
	stackUsedForSearch push: 'Winter is here'.
	stackUsedToCompare push: 'Winter is here'.
		
	prefix := 'Wint'.
	
	sentenceFinderbyPrefix findAllWithPrefix: prefix inOOStack: stackUsedForSearch.
	
	self assert: stackUsedForSearch size = stackUsedToCompare size.
	
	1 to: stackUsedForSearch size
		do: [ :unused |
			|elementInStackUsedForSearch elementInStackForCompare |
			elementInStackUsedForSearch := stackUsedForSearch pop.
			elementInStackForCompare := stackUsedToCompare pop.
			self assert: elementInStackUsedForSearch = elementInStackForCompare .
			]
		
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'tp 9/17/2023 22:52:59'!
test02FindPrefixInAMultipleElementsStack

	| stack prefix sentenceFinderbyPrefix expectedPrefixes|
	
	sentenceFinderbyPrefix := SentenceFinderByPrefix new.
	
	stack  := OOStack  new.
	stack push: 'winter is coming'.
	stack push: 'winning si everything'.
	stack push: 'the winds of Winter'.
	stack push: 'Winter is here'.
	
	prefix := 'Wint'.
	
	expectedPrefixes := OrderedCollection new.
	expectedPrefixes add: 'Winter is here'.
		
	self assert: expectedPrefixes = (sentenceFinderbyPrefix findAllWithPrefix: prefix inOOStack: stack).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'tp 9/18/2023 10:21:19'!
test03EmptyStackDoesNotFoundAnything

	| stack prefix sentenceFinderbyPrefix expectedPrefixes|
	
	sentenceFinderbyPrefix := SentenceFinderByPrefix new.
	
	stack := OOStack new.
	
	prefix := 'Wint'.
	
	expectedPrefixes := OrderedCollection new.
	
	self assert: expectedPrefixes = (sentenceFinderbyPrefix findAllWithPrefix: prefix inOOStack: stack).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'tp 9/18/2023 10:34:15'!
test04PrefixWithSpacesDoesNotFind
	
	| stack prefix sentenceFinderbyPrefix expectedPrefixes|
	
	sentenceFinderbyPrefix := SentenceFinderByPrefix new.
	
	stack  := OOStack  new.
	stack push: 'winter is coming'.
	stack push: 'winning si everything'.
	stack push: 'the winds of Winter'.
	stack push: 'Winter is here'.
	
	prefix := 'Winter '.
	
	expectedPrefixes := OrderedCollection new.
		
	self assert: expectedPrefixes = (sentenceFinderbyPrefix findAllWithPrefix: prefix inOOStack: stack).! !


!classDefinition: #StackElementTest category: 'Stack-Exercise'!
TestCase subclass: #StackElementTest
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElementTest methodsFor: 'test' stamp: 'ma 9/17/2023 12:49:20'!
test01InitializeWithValue

	| stackElement |
	
	stackElement := StackElement initializeWith: 'test'.
	
	self assert: stackElement value = 'test'! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operations' stamp: 'ma 9/17/2023 13:41:38'!
isEmpty
	^elements size = 1! !

!OOStack methodsFor: 'operations' stamp: 'tp 9/17/2023 20:44:46'!
pop
	
	^elements last pop: self! !

!OOStack methodsFor: 'operations' stamp: 'ma 9/17/2023 12:24:03'!
push: anElement
	^elements add: (StackElement initializeWith: anElement) ! !

!OOStack methodsFor: 'operations' stamp: 'ma 9/17/2023 13:29:22'!
size
	^elements size -1! !

!OOStack methodsFor: 'operations' stamp: 'tp 9/17/2023 20:44:50'!
top

	^elements last top: self! !


!OOStack methodsFor: 'private operations' stamp: 'tp 9/17/2023 20:46:22'!
emptyPop

	^self emptyStackError! !

!OOStack methodsFor: 'private operations' stamp: 'tp 9/17/2023 20:45:47'!
emptyStackError

	^self error: OOStack stackEmptyErrorDescription! !

!OOStack methodsFor: 'private operations' stamp: 'tp 9/17/2023 20:46:10'!
emptyTop

	^self emptyStackError! !

!OOStack methodsFor: 'private operations' stamp: 'tp 9/17/2023 23:00:49'!
noEmptyPop
	^ elements remove: elements last! !

!OOStack methodsFor: 'private operations' stamp: 'tp 9/17/2023 23:00:43'!
noEmptyTop
	^ elements last! !


!OOStack methodsFor: 'initialize' stamp: 'tp 9/17/2023 14:33:37'!
initialize
	elements:= OrderedCollection new.
	elements add: StackBase new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'auxiliar' stamp: 'tp 9/18/2023 10:50:14'!
findAllWithPrefix: aPrefix inOOStack: anOOStack andStoreAllElementsIn: anEmptyCollection

	| collectionWithPrefixes |
	
	collectionWithPrefixes := OrderedCollection new.
	
	1 to: anOOStack size 
		do: [ :unused |
			| element |
			element := anOOStack pop.
			anEmptyCollection add: element .
			(self theElement: element hasThePrefixAtStart: aPrefix) ifTrue: [ collectionWithPrefixes add: element ].
			].
	
	^ collectionWithPrefixes! !

!SentenceFinderByPrefix methodsFor: 'auxiliar' stamp: 'tp 9/17/2023 20:52:13'!
restoreTheStack: anOOStackToBeRestored withCollection: aCollectionWithAllElements
	
	1 to: aCollectionWithAllElements size
		do: [ :unused |
			| lastElement |
			lastElement  := aCollectionWithAllElements removeLast .
			anOOStackToBeRestored push: lastElement .
			].
	! !

!SentenceFinderByPrefix methodsFor: 'auxiliar' stamp: 'tp 9/18/2023 10:40:56'!
theElement: element hasThePrefixAtStart: aPrefix

	^ (element value findString: aPrefix startingAt: 0) = 1! !

!SentenceFinderByPrefix methodsFor: 'auxiliar' stamp: 'tp 9/18/2023 10:37:36'!
thePrefixHasEmptySpaces: aPrefix

	^ ((aPrefix findString: ' ' startingAt: 1) = 0) not! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'tp 9/18/2023 10:37:29'!
findAllWithPrefix: aPrefix inOOStack: anOOStack

	| collectionWithPrefixes collectionWithAllElements |
	
	(aPrefix isEmpty or: [self thePrefixHasEmptySpaces: aPrefix]) ifTrue: [
		collectionWithPrefixes := OrderedCollection new.
		^ collectionWithPrefixes 
		].
	
	collectionWithAllElements := OrderedCollection  new.
	
	collectionWithPrefixes := self  findAllWithPrefix: aPrefix 
							inOOStack: anOOStack 
							andStoreAllElementsIn: collectionWithAllElements.
	
	self restoreTheStack: anOOStack withCollection: collectionWithAllElements.
	
	^ collectionWithPrefixes! !


!classDefinition: #StackElement category: 'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'redirectOperations' stamp: 'tp 9/17/2023 23:01:00'!
pop: anStack
	^ anStack noEmptyPop value! !

!StackElement methodsFor: 'redirectOperations' stamp: 'tp 9/17/2023 23:00:56'!
top: anStack
	^ anStack noEmptyTop value! !


!StackElement methodsFor: 'initialize' stamp: 'ma 9/17/2023 12:22:08'!
initializeWith: anElement
	value:= anElement! !


!StackElement methodsFor: 'logic' stamp: 'ma 9/17/2023 12:55:15'!
= anElement
	^value = anElement value! !


!StackElement methodsFor: 'accesing' stamp: 'ma 9/17/2023 12:20:28'!
value
	^value
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackElement class' category: 'Stack-Exercise'!
StackElement class
	instanceVariableNames: ''!

!StackElement class methodsFor: 'as yet unclassified' stamp: 'ma 9/17/2023 12:45:52'!
initializeWith: anElement
	^self new initializeWith: anElement ! !


!classDefinition: #StackBase category: 'Stack-Exercise'!
StackElement subclass: #StackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBase methodsFor: 'redirect' stamp: 'tp 9/17/2023 14:37:34'!
pop: anStack
	anStack emptyPop! !

!StackBase methodsFor: 'redirect' stamp: 'ma 9/17/2023 13:49:19'!
top: anStack
	anStack emptyTop! !
