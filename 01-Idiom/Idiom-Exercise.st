!classDefinition: #NotFound category: #'Idiom-Exercise'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!


!classDefinition: #IdiomTest category: #'Idiom-Exercise'!
TestCase subclass: #IdiomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!

!IdiomTest methodsFor: 'testing' stamp: 'abbe 4/23/2017 14:28:05'!
check:aClosure on:anErrorType do:anotherClosure



	[aClosure value
		
	self fail]

	on:anErrorType
	
	do:anotherClosure! !

!IdiomTest methodsFor: 'testing' stamp: 'abbe 4/23/2017 14:29:41'!
isEvaluated:aClosure inMilliseconds:aLimitMilliseconds



	|millisecondsBeforeRunning millisecondsAfterRunning|
	
	
	millisecondsBeforeRunning := Time millisecondClockValue.
	
	aClosure value.
	
	millisecondsAfterRunning := Time millisecondClockValue.
	
	
	
	^ (millisecondsAfterRunning-millisecondsBeforeRunning) < aLimitMilliseconds! !

!IdiomTest methodsFor: 'testing' stamp: 'abbe 4/23/2017 14:30:21'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	|aClosure customerBook aCustomerName|
	
	customerBook := CustomerBook  new.
	
	aCustomerName := 'John Lennon'.
	
	aClosure := [customerBook addCustomerNamed: aCustomerName.	].
	
	self assert: (self isEvaluated: aClosure inMilliseconds:50)! !

!IdiomTest methodsFor: 'testing' stamp: 'abbe 4/23/2017 14:30:55'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney aClosure |
	
	
	customerBook := CustomerBook  new.
	
	paulMcCartney := 'Paul McCartney'.
	
	
	
	customerBook addCustomerNamed: paulMcCartney.
	
	aClosure:=[customerBook removeCustomerNamed: paulMcCartney.].
	
	
	
	self assert: (self isEvaluated:aClosure inMilliseconds:100)! !

!IdiomTest methodsFor: 'testing' stamp: 'abbe 4/23/2017 14:54:01'!
test03CanNotAddACustomerWithEmptyName

	| customerBook assertionsToCheck |
	

	customerBook _ CustomerBook new.
	assertionsToCheck _ [:anError | 
								self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
								self assert: customerBook isEmpty].

	self should: [customerBook addCustomerNamed:''] raise: Error withExceptionDo: assertionsToCheck.! !

!IdiomTest methodsFor: 'testing' stamp: 'abbe 4/23/2017 15:01:11'!
test04CanNotRemoveAndInvalidCustomer

	| customerBook johnLennon assertionsToCheck |
	

	customerBook _ CustomerBook new.
	johnLennon _ 'John Lennon'.
	customerBook addCustomerNamed: johnLennon. 
	
	assertionsToCheck _ [:anError | 
								self assert: customerBook numberOfCustomers = 1.
								self assert: (customerBook includesCustomerNamed: johnLennon)].

	self should: [customerBook removeCustomerNamed: 'Paul McCartney'] raise: NotFound withExceptionDo: assertionsToCheck.! !

!IdiomTest methodsFor: 'testing' stamp: 'abbe 4/23/2017 15:02:26'!
when:aClosure on:anErrorType check:conditions



	[aClosure value.
		
	self fail]

	on:anErrorType
	
	do:[:anError | 1 to: (conditions size) do: [:i | ((conditions at:i) value:anError) ifFalse: [^false] ] ]! !


!classDefinition: #CustomerBook category: #'Idiom-Exercise'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!

!CustomerBook methodsFor: 'testing' stamp: 'abbe 4/23/2017 15:04:47'!
includesCustomerNamed: aName



	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'abbe 4/23/2017 15:04:55'!
isEmpty

	
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'abbe 4/23/2017 15:04:37'!
initialize



	super initialize.
	
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'abbe 4/23/2017 15:02:53'!
addCustomerNamed: aName



	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'abbe 4/23/2017 15:03:06'!
numberOfCustomers


	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'abbe 4/23/2017 15:03:16'!
removeCustomerNamed: aName



	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'abbe 4/23/2017 15:03:24'!
signalCustomerAlreadyExists 



	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'abbe 4/23/2017 15:03:47'!
signalCustomerNameCannotBeEmpty



	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'Idiom-Exercise'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
