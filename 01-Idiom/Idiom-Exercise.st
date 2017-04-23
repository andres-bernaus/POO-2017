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

!IdiomTest methodsFor: 'testing' stamp: 'C.A. 4/20/2017 21:26:31'!
check:aClosure on:anErrorType do:anotherClosure

	[aClosure value
	self fail]
	on:anErrorType
	do:anotherClosure! !

!IdiomTest methodsFor: 'testing' stamp: 'C.A. 4/20/2017 20:58:14'!
isEvaluated:aClosure inMilliseconds:aLimitMilliseconds

	|millisecondsBeforeRunning millisecondsAfterRunning|
	
	millisecondsBeforeRunning := Time millisecondClockValue.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue.
	
	^ (millisecondsAfterRunning-millisecondsBeforeRunning) < aLimitMilliseconds! !

!IdiomTest methodsFor: 'testing' stamp: 'C.A. 4/20/2017 21:04:17'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	|aClosure customerBook aCustomerName|

	customerBook := CustomerBook  new.
	aCustomerName := 'John Lennon'.
	
	aClosure := [customerBook addCustomerNamed: aCustomerName.	].
	
	self assert: (self isEvaluated: aClosure inMilliseconds:50)
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'C.A. 4/20/2017 21:06:45'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney aClosure |
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	aClosure:=[customerBook removeCustomerNamed: paulMcCartney.].
	
	self assert: (self isEvaluated:aClosure inMilliseconds:100)
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'C.A. 4/20/2017 21:57:20'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook anArray|

	customerBook := CustomerBook new.
	
	anArray:= Array new:2.
	anArray at:1 put: [ :anError | anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage ] .
	anArray at:2 put: [ :anError | customerBook isEmpty ] .

	self assert: (self when:[ customerBook addCustomerNamed: ''.]
		on: Error 
		check: anArray)! !

!IdiomTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/16/2012 16:50'!
test04CanNotRemoveAndInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!IdiomTest methodsFor: 'testing' stamp: 'C.A. 4/20/2017 22:00:59'!
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

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
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
