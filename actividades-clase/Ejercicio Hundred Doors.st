!classDefinition: #HundredDoorsTests category: 'Ejercicio Hundred Doors'!
TestCase subclass: #HundredDoorsTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio Hundred Doors'!

!HundredDoorsTests methodsFor: 'tests' stamp: 'tp 10/2/2023 21:35:21'!
test01AllDoorsStartClosed

	| doorFlipper |

	doorFlipper := DoorFlipper with: 1.
	
	self assert: (doorFlipper closedAt: 1).! !

!HundredDoorsTests methodsFor: 'tests' stamp: 'tp 10/2/2023 21:38:55'!
test02AllDoorsCloseAfterFlip

	| doorFlipper |

	doorFlipper := DoorFlipper with: 1.
	
	doorFlipper flip.
	
	self deny: (doorFlipper closedAt: 1).! !

!HundredDoorsTests methodsFor: 'tests' stamp: 'tp 10/2/2023 21:41:16'!
test04AllDoorsFlipWithCorrectStep

	| doorFlipper |

	doorFlipper := DoorFlipper with: 2.
	
	doorFlipper flipBy: 2.
	
	self assert: (doorFlipper closedAt: 1).
	self deny: (doorFlipper closedAt: 2).! !

!HundredDoorsTests methodsFor: 'tests' stamp: 'tp 10/2/2023 21:46:57'!
test05CanFlipDoorsWithStep

	| doorFlipper |

	doorFlipper := DoorFlipper with: 100.
	
	doorFlipper flipAll.
	
	self assert: (doorFlipper closedAt: 1).
	self assert: (doorFlipper closedAt: 4).! !


!classDefinition: #DoorFlipper category: 'Ejercicio Hundred Doors'!
Object subclass: #DoorFlipper
	instanceVariableNames: 'quantityOfDoors closed'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio Hundred Doors'!

!DoorFlipper methodsFor: 'initialization' stamp: 'tp 10/2/2023 21:43:46'!
initializeWith: aQuantityOfDoors 
	closed := Array new: aQuantityOfDoors withAll: true! !


!DoorFlipper methodsFor: 'testing' stamp: 'tp 10/2/2023 21:45:29'!
closedAt: aDoorNumber
	^ closed at: aDoorNumber ! !


!DoorFlipper methodsFor: 'flipping' stamp: 'tp 10/2/2023 21:45:02'!
flip
	self flipBy: 1.! !

!DoorFlipper methodsFor: 'flipping' stamp: 'tp 10/2/2023 21:43:00'!
flipBy: aStep 
	aStep to: closed size by: aStep 
		do: [:aDoorNumber | closed at: aDoorNumber put: (closed at: aDoorNumber ) not].
		! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DoorFlipper class' category: 'Ejercicio Hundred Doors'!
DoorFlipper class
	instanceVariableNames: ''!

!DoorFlipper class methodsFor: 'instance creation' stamp: 'tp 10/2/2023 20:43:25'!
with: aQuantityOfDoors
	
	^self new initializeWith: aQuantityOfDoors ! !
