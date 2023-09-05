!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'BR 9/4/2023 21:44:06'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook|
	
	customerBook := CustomerBook new.
	
	self do: [customerBook addCustomerNamed: 'John Lennon'.] takeLessThan: 50.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BR 9/4/2023 21:50:51'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self newCustomerBookAndAddCustomer: paulMcCartney.
	  
	self do: [customerBook removeCustomerNamed: paulMcCartney.] takeLessThan: 100.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tp 9/5/2023 12:52:07'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	
	self xx: [ customerBook addCustomerNamed: ''. 
			self fail]  
		yy: Error 
		zz: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tp 9/5/2023 12:10:04'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.		
	customerBook := self newCustomerBookAndAddCustomer: johnLennon.
	
	self xx: [ customerBook removeCustomerNamed: 'Paul McCartney'.]  
		yy: NotFound 
		zz: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tp 9/5/2023 12:57:26'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self newCustomerBookAndAddCustomer: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tp 9/5/2023 12:58:09'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self newCustomerBookAndAddCustomer: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tp 9/5/2023 12:12:29'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
	johnLennon := 'John Lennon'.		
	customerBook := self newCustomerBookAndAddCustomer: johnLennon.
		
	self xx: [ customerBook suspendCustomerNamed: 'George Harrison'.]  
		yy: CantSuspend 
		zz: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'tp 9/5/2023 12:32:02'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	johnLennon := 'John Lennon'.		
	customerBook := self newCustomerBookAndAddCustomer: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self  xx: [ customerBook suspendCustomerNamed: johnLennon.]  
		yy: CantSuspend 
		zz: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)].
! !


!CustomerBookTest methodsFor: 'auxiliar' stamp: 'tp 9/5/2023 13:02:03'!
aa: xx bb: yy

	self assert: xx equals: yy  numberOfActiveCustomers.! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'BR 9/4/2023 21:43:40'!
do: aClosure takeLessThan: quantityOfMilliseconds

	| millisecondsAfterRunning millisecondsBeforeRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (quantityOfMilliseconds * millisecond)! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'BR 9/4/2023 21:49:54'!
newCustomerBookAndAddCustomer: aCustomerName
	| customerBook |
	
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aCustomerName .
	^ customerBook ! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'tp 9/5/2023 12:54:39'!
xx: aClosure yy: asda zz: aSecondClosure

	[aClosure value.
		self fail]
		on: asda 
		do: aSecondClosure.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/4/2023 17:02:48'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/4/2023 17:02:52'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
