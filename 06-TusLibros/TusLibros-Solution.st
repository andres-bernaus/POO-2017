!classDefinition: #LibrosTests category: #TusLibros-Solution!
TestCase subclass: #LibrosTests
	instanceVariableNames: 'aCart aPriceList aCashier aEmptyCart aLoadedCart aValidCreditCardNumber aValidUnexpiredCard aExpiredCreditCard aSalesBook aDummyMerchantProcessor aLoadedCartTotalPrice aClientRegister aRestInterface'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 18:22:19'!
setUp

	aPriceList := Dictionary new.

	aPriceList at: 'Libro1' put: 800.
	aPriceList at: 'Libro2' put: 300.

	aEmptyCart := Cart newWithCatalog: aPriceList keys asSet.
	aCart := Cart newWithCatalog: aPriceList keys asSet.
	
	aLoadedCart := Cart newWithCatalog: aPriceList keys asSet.
	aLoadedCart addBook: 'Libro1'.
	aLoadedCart addBook: 'Libro2'.
	aLoadedCartTotalPrice := (aPriceList at: 'Libro1') + (aPriceList at: 'Libro2').
	
	aDummyMerchantProcessor := SimulatedMerchantProcessor newWhenDebitDo: [].
	
	aSalesBook := OrderedCollection new.
	aCashier := Cashier newWithPriceList: aPriceList 
							salesBook: aSalesBook
							currentDateAndTime: DateAndTime today
							merchantProcessor: aDummyMerchantProcessor.
	
	aValidCreditCardNumber := '1111111111111111'.
	aValidUnexpiredCard := CreditCard newWithNumber: aValidCreditCardNumber
												ownerName: 'Juan' 
												expirationDate: DateAndTime tomorrow.
	
	aExpiredCreditCard := CreditCard newWithNumber: aValidCreditCardNumber
												ownerName: 'Juan' 
												expirationDate: DateAndTime yesterday.
	
	aClientRegister := Dictionary new.
	aClientRegister at: 'Juan Perez' put: '123Juan'.
	aClientRegister at: 'Cliente3' put: 'Cliente3'.
	
	aRestInterface := RestInterface newWithClients: aClientRegister
										  	 withProductList: aPriceList
										 	 merchantProcessor: aDummyMerchantProcessor
										 	 cartsRegister: Dictionary new.
	! !

!LibrosTests methodsFor: 'testing' stamp: 'abern 6/15/2017 20:06:32'!
test001NewCartsAreEmpty

	| aNewCart |

	aNewCart := Cart newWithCatalog: aPriceList.

	self assert: aNewCart isEmpty ! !

!LibrosTests methodsFor: 'testing' stamp: 'abern 6/15/2017 19:33:11'!
test01CartsWithAnAddedItemAreNotEmpty

	| aNewCart |

	aNewCart := Cart newWithCatalog: aPriceList keys asSet.
	
	aNewCart addBook: 'Libro1'.

	self deny: aNewCart isEmpty ! !

!LibrosTests methodsFor: 'testing' stamp: 'abern 6/15/2017 20:07:51'!
test02WhenAddingAnItemToACartThatItemIsContainedInIt

	aCart addBook: 'Libro1'.

	self assert: (aCart contains: 'Libro1').! !

!LibrosTests methodsFor: 'testing' stamp: 'abern 6/15/2017 20:08:06'!
test03WhenAddingTwoDiferentItemBothItemsAreContainedInTheCart

	self assert: (aLoadedCart contains: 'Libro1').	
	self assert: (aLoadedCart contains: 'Libro2').	
	self assert: aLoadedCart size = 2.
	! !

!LibrosTests methodsFor: 'testing' stamp: 'abern 6/15/2017 20:05:56'!
test04WhenAddingAnItemToACartTheAmountOfContainedItemsIncreasesByOne
	
	self assert: aCart size = 0.

	aCart addBook: 'Libro1'.

	self assert: aCart size = 1.! !

!LibrosTests methodsFor: 'testing' stamp: 'abern 6/15/2017 20:05:41'!
test05WhenAddingThreeCopiesOfTheSameBookToACartThoseThreeCopiesAreIncludedInIt

	aCart addBook: 'Libro1' withAmount: 3.
	
	self assert: (aCart contains: 'Libro1').
	
	self assert: (aCart amountOfContainedCopiesOf: 'Libro1') = 3.
	
	self assert: (aCart  size = 3).
	
	! !

!LibrosTests methodsFor: 'testing' stamp: 'abern 6/15/2017 19:44:01'!
test06AddingANonPositiveAmountOfItemsToACartRaisesAnError

	self should: [aCart addBook: 'Libro1' withAmount: -1 ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: 
	[:anError |
		self assert: (anError messageText = 'La cantidad de elementos debe ser entera y positiva').
		self assert: aCart isEmpty.
	]
	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 11:07:53'!
test07AddingAnItemToACartThatDoesNotExistsInTheCatalogRaisesAnError

	
	self should: [aCart addBook: 'Libre3']
	raise: Error -MessageNotUnderstood 
	withExceptionDo: 
	[:anError |
		self assert: 'El item no pertenece al catalogo' equals: anError messageText.
		self assert: aCart isEmpty.
	]
	
	! !

!LibrosTests methodsFor: 'testing' stamp: 'abern 6/15/2017 19:44:38'!
test08AddingANonIntegerAmountOfItemsToACartRaisesAnError

	self should: [aCart addBook: 'Libro1' withAmount: 0.5 ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: 
	[:anError |
		self assert: (anError messageText = 'La cantidad de elementos debe ser entera y positiva').
		self assert: aCart isEmpty.
	]
	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/24/2017 13:35:40'!
test09aCartWithNoItemsRaisesAnErrorWhenCheckingOut

	| aNewCashier aNewCart |
	
	aNewCart := Cart newWithCatalog: aPriceList keys asSet.
	
	aNewCashier := Cashier newWithPriceList: aPriceList 
								 salesBook: OrderedCollection new
								currentDateAndTime: DateAndTime today
								merchantProcessor: aDummyMerchantProcessor.
	
	self should: [aNewCashier checkOut: aNewCart withCard: DateAndTime today]
		 raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | 
								self assert: (anError messageText = 'No se puede hacer checkout de un carro vacio').
								self assert: aCashier listSales isEmpty]! !

!LibrosTests methodsFor: 'testing' stamp: 'abern 6/15/2017 20:08:13'!
test10ACartWithTwoDifferentItemsReturnsABagContainingBothItems

	self assert: (aLoadedCart listItems includes: 'Libro1').
	self assert: (aLoadedCart listItems includes: 'Libro2').! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/24/2017 15:38:27'!
test11WhenCheckingoutAValidCartASaleIsLoggedIntoTheSalesBook

	aCashier checkOut: aLoadedCart withCard: aValidUnexpiredCard.
	
	self deny: aCashier listSales isEmpty.
	
	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/24/2017 15:44:22'!
test12WhenCheckingOutACartWithOneItemItCreatesASaleWithThatItem

	| aCartWithOneElement expectedSale |

	aCartWithOneElement := Cart newWithCatalog: aPriceList keys asSet.
	aCartWithOneElement addBook: 'Libro1'.

	aCashier checkOut: aCartWithOneElement withCard: aValidUnexpiredCard.

	expectedSale := Sale newWithItem: 'Libro1' price: 800.

	self assert: (aSalesBook includes: expectedSale).! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/24/2017 15:36:36'!
test13WhenACashierAddsASaleInTheSalesBookThatSaleIsListedInAllCashiersSalesBooks

	| anotherCashier |
	
	anotherCashier := Cashier newWithPriceList: aPriceList 
									salesBook: aSalesBook 
									currentDateAndTime: DateAndTime today
									merchantProcessor: aDummyMerchantProcessor.
	
	aCashier checkOut: aLoadedCart withCard: aValidUnexpiredCard.
	
	self deny: anotherCashier listSales isEmpty.
	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/24/2017 16:02:18'!
test14usingAnInvalidCreditCardWhenCheckingOutRaisesAnError
	
	| aSimulatedMerchantProcessor |
	
	aSimulatedMerchantProcessor := SimulatedMerchantProcessor newWhenDebitDo: [^#OK].
	
	self should: [aCashier checkOut: aLoadedCart withCard: aExpiredCreditCard]
	raise:  Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
			self assert: anError messageText = 'No se puede realizar el checkout si la tarjeta esta vencida'.
			self assert:  aCashier listSales isEmpty.
			self assert: aSimulatedMerchantProcessor didNotReceiveRequest. 
		]

	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 16:04:35'!
test15CreatingACreditCardWithOtherThan16DigitsRaisesAnError
	
	self should: [CreditCard newWithNumber: '1234567891011121314'
									ownerName: 'Juan P'
									expirationDate: DateAndTime yesterday]
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [:anError | self assert: anError messageText equals: 'La tarjeta debe tener 16 digitos'].
		
	self should: [CreditCard newWithNumber: '12345678910111'
									ownerName: 'Juan P'
									expirationDate: DateAndTime yesterday]
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [:anError | self assert: anError messageText equals: 'La tarjeta debe tener 16 digitos'].
		
	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/24/2017 13:35:13'!
test16WhenAccessingACreditCardNameOrNumberItReturnsTheCorrectOriginalValues
	
	| aCreditCard |
	
	aCreditCard := CreditCard newWithNumber: '1234567891011129' 
									ownerName: 'Juan'  expirationDate: DateAndTime today.
									
	self assert: 'Juan' equals: aCreditCard ownerName.
	self assert: '1234567891011129' equals: aCreditCard number .
	
	
	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/24/2017 13:35:03'!
test17ACreditCardsWithAFutureExipirationDateIsNotExpired

	| aValidCreditCard |
	
	aValidCreditCard := CreditCard newWithNumber: aValidCreditCardNumber
										 ownerName: 'Juan'  
										expirationDate: DateAndTime tomorrow.
	
	self deny: (aValidCreditCard isExpiredIn: DateAndTime today).
	
	
	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 09:04:26'!
test18ACreditCardsWithAPastExipirationDateIsExipired

	| aExpiredCreditCard |
	
	aExpiredCreditCard := CreditCard newWithNumber: aValidCreditCardNumber
										 ownerName: 'Juan'  
										expirationDate: DateAndTime yesterday.
	
	self assert: (aExpiredCreditCard isExpiredIn: DateAndTime today).
	
	
	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 09:05:54'!
test19WhenCheckingOutAValidPurchaseWithEnoughCreditTheCashierSendsTheCorrectTotalAndCardToTheMerchantProcessor

	| aSimulatedMerchantProcessor aCashier |
	
	aSimulatedMerchantProcessor := SimulatedMerchantProcessor newWhenDebitDo: [].
	
	aCashier := Cashier newWithPriceList: aPriceList 
							 salesBook: aSalesBook 
							 currentDateAndTime: DateAndTime today
							merchantProcessor: aSimulatedMerchantProcessor.
	
	aCashier checkOut: aLoadedCart withCard: aValidUnexpiredCard.
	
	self assert: aValidUnexpiredCard equals: aSimulatedMerchantProcessor lastProcessedCreditCard.
	self assert: aLoadedCartTotalPrice equals: aSimulatedMerchantProcessor lastProcessedDebitAmount.
	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/24/2017 13:32:06'!
test20MakingAPurchaseWithAStolenCardRaisesAnError

	| aSimulatedMerchantProcessor aCashier |
	
	aSimulatedMerchantProcessor := SimulatedMerchantProcessor newWhenDebitDo: [^self error: 'La tarjeta utilizada es robada'].
	
	aCashier := Cashier newWithPriceList: aPriceList 
							 salesBook: aSalesBook 
							 currentDateAndTime: DateAndTime today
							merchantProcessor: aSimulatedMerchantProcessor.
	
	self should: [aCashier checkOut: aLoadedCart withCard: aValidUnexpiredCard]
		  raise: Error - MessageNotUnderstood 	
		  withExceptionDo: [:anError | 
									self assert: 'La tarjeta utilizada es robada' equals: anError messageText.
									self assert: aSalesBook isEmpty]

	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/24/2017 16:07:46'!
test21UsingACreditCardWithNotEnoughCreditToCheckOutACartRaisesAnError

	| aSimulatedMerchantProcessor aCashier |
	
	aSimulatedMerchantProcessor := SimulatedMerchantProcessor newWhenDebitDo: [^self error: 'La tarjeta no tiene suficiente credito para completar la operacion'].
	
	aCashier := Cashier newWithPriceList: aPriceList 
							 salesBook: aSalesBook 
							 currentDateAndTime: DateAndTime today
							merchantProcessor: aSimulatedMerchantProcessor.
	
	self should: [aCashier checkOut: aLoadedCart withCard: aValidUnexpiredCard]
		  raise: Error - MessageNotUnderstood 	
		  withExceptionDo: [:anError | 
									self assert: 'La tarjeta no tiene suficiente credito para completar la operacion' equals: anError messageText.
									self assert: aSalesBook isEmpty]

	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/24/2017 18:41:01'!
test22WhenCreatingACartWithAValidUserIDAndPasswordThatCartIsAddedToTheCartList

	| restInterface |
	
	restInterface := RestInterface newWithClients: aClientRegister
										  withProductList: aPriceList
										  merchantProcessor: aDummyMerchantProcessor
										  cartsRegister: Dictionary new.
	
	aClientRegister at: 'Juan Perez' put: '123Juan'.
	restInterface createCartforClient: 'Juan Perez' password: '123Juan'.
	
	self deny: restInterface listAllCarts isEmpty.! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 09:48:11'!
test23TryingToCreateACartInRestWithAUserIDNotRegisteredRaisesAnError
	
	| aRestInterface |
	
	aRestInterface := RestInterface newWithClients: Dictionary new
										  	 withProductList: aPriceList
										 	 merchantProcessor: aDummyMerchantProcessor
										 	 cartsRegister: Dictionary new.
	
	
	self should: [aRestInterface createCartforClient: 'Juan Perez' password: '123Juan']
		  raise: Error - MessageNotUnderstood 
		  withExceptionDo: [:anError | 
								self assert: aRestInterface listAllCarts isEmpty.
								self assert: 'El userID ingresado es invalido' equals: anError messageText].
		! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 09:48:46'!
test24TryingToCreateACartInRestWithAnIncorrectPasswordRaisesAnError
	
	self should: [aRestInterface createCartforClient: 'Juan Perez' password: '123']
		  raise: Error - MessageNotUnderstood 
		  withExceptionDo: [:anError | 
								self assert: aRestInterface listAllCarts isEmpty.
								self assert: 'La password ingresada es invalida' equals: anError messageText].
		! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 09:48:40'!
test25WhenCreatingACartThroughTheInterfaceWithAValidUserIDAndPasswordTheCartIsEmpty

	| aNewCartID |
	
	aNewCartID := aRestInterface createCartforClient: 'Juan Perez' password: '123Juan'.
	
	self assert: (aRestInterface listAllCarts at: aNewCartID) listItems isEmpty.! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 12:48:19'!
test26AddingAnItemToANonExistingCartRaisesAnError

	| aCartID |
	
	aCartID := aRestInterface createCartforClient: 'Juan Perez' password: '123Juan'.

	self should: [aRestInterface addToCart: 4 item: 'Libro1' amount:1] 
		  raise: Error - MessageNotUnderstood
		  withExceptionDo: [:anError | 
								self assert: 'El carro con el ID ingresado no existe' equals: anError messageText.
								self assert: 1 equals: aRestInterface listAllCarts size.
								self assert: (aRestInterface listCart: aCartID) isEmpty]! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 12:49:21'!
test27AddingAbookWithAISBNThatIsNotInTheCatalogRaisesAnError

	| aCart1ID aCart2ID |

	aClientRegister at: 'Cliente2' put: 'Cliente2'.
	aClientRegister at: 'Cliente1' put: 'Cliente1'.
	
	aCart1ID := aRestInterface createCartforClient: 'Cliente2' password: 'Cliente2'.
	aCart2ID := aRestInterface createCartforClient: 'Cliente1' password: 'Cliente1'.

	self should: [aRestInterface addToCart: aCart2ID item: 'Libro3' amount:1] 
		  raise: Error - MessageNotUnderstood
		  withExceptionDo: [:anError | 
								self assert: 'El item no pertenece al catalogo' equals: anError messageText.
								self assert: (aRestInterface listCart: aCart1ID ) isEmpty.
								self assert: (aRestInterface listCart: aCart2ID ) isEmpty]
	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 12:54:19'!
test28AddingAbookWithANonPositiveOrNonIntegerAmountRaisesAnError

	| aCart1ID aCart2ID |

	aCart1ID := aRestInterface createCartforClient: 'Juan Perez' password: '123Juan'.
	aCart2ID := aRestInterface createCartforClient: 'Juan Perez' password: '123Juan'.
	
	self should: [aRestInterface addToCart: aCart1ID item: 'Libro1' amount: 0.5] 
		  raise: Error - MessageNotUnderstood
		  withExceptionDo: [:anError | 
								self assert: 'La cantidad de elementos debe ser entera y positiva' equals: anError messageText.
								self assert: (aRestInterface listCart: aCart1ID ) isEmpty.
								self assert: (aRestInterface listCart: aCart2ID ) isEmpty].
	
	self should: [aRestInterface addToCart: aCart2ID item: 'Libro1' amount: (-1)] 
		  raise: Error - MessageNotUnderstood
		  withExceptionDo: [:anError | 
								self assert: 'La cantidad de elementos debe ser entera y positiva' equals: anError messageText.
								self assert: (aRestInterface listCart: aCart1ID ) isEmpty.
								self assert: (aRestInterface listCart: aCart2ID ) isEmpty]! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 13:09:21'!
test29WhenAddingAValidISBNAndItemAmountToAValidCartThatItemIsIncludedInThatCartsitemList

	| aCartID |
	
	aCartID := aRestInterface createCartforClient: 'Juan Perez' password: '123Juan'.
	
	aRestInterface addToCart: aCartID item: 'Libro1' amount: 2.
	aRestInterface addToCart: aCartID item: 'Libro2' amount: 1.
	
	self assert: 2 equals: ((aRestInterface listCart: aCartID) occurrencesOf: 'Libro1').
	self assert: 1 equals: ((aRestInterface listCart: aCartID) occurrencesOf: 'Libro2').! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 14:24:19'!
test30CheckingOutAnEmptyCartRaisesAnError
	
	| aCartID |

	aCartID := aRestInterface createCartforClient: 'Juan Perez' password: '123Juan'.
	
	self should: [aRestInterface checkOutCart: aCartID 
									  withCreditCardNumber: aValidCreditCardNumber
									  expiresIn: DateAndTime tomorrow
									  owner: 'Juan Perez'] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
								self assert: (aRestInterface listPurchasesOfClient: 'Juan Perez' password: '123Juan') isEmpty.
								self assert: 'No se puede hacer checkout de un carro vacio' equals: anError messageText]! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 16:06:19'!
test31CheckingOutACartWithAnInvalidCreditCardNumberRaisesAnError
	
	| aCartID |

	aCartID := aRestInterface createCartforClient: 'Juan Perez' password: '123Juan'.
	aRestInterface addToCart: aCartID item: 'Libro1' amount: 1.
	
	self should: [aRestInterface checkOutCart: aCartID 
									  withCreditCardNumber: '123'
									  expiresIn: DateAndTime tomorrow
									  owner: 'Juan Perez'] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
								self assert: (aRestInterface listPurchasesOfClient: 'Juan Perez' password: '123Juan') isEmpty.
								self assert: 'La tarjeta debe tener 16 digitos' equals: anError messageText]! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 16:07:06'!
test32CheckingOutACartWithAExpiredCreditCardRaisesAnError
	
	| aCartID |

	aCartID := aRestInterface createCartforClient: 'Juan Perez' password: '123Juan'.
	aRestInterface addToCart: aCartID item: 'Libro1' amount: 1.
	
	self should: [aRestInterface checkOutCart: aCartID 
									  withCreditCardNumber: aValidCreditCardNumber 
									  expiresIn: DateAndTime yesterday 
									  owner: 'Juan Perez'] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
								self assert: (aRestInterface listPurchasesOfClient: 'Juan Perez' password: '123Juan') isEmpty.
								self assert: 'No se puede realizar el checkout si la tarjeta esta vencida' equals: anError messageText]! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 16:49:26'!
test33WhenListingPurchasesForACustomerOnlyPurchasesMadeByThatCustomerAreShown
	
	| aCart1ID aCart2ID |

	
	aCart1ID := aRestInterface createCartforClient: 'Juan Perez' password: '123Juan'.
	aCart2ID := aRestInterface createCartforClient: 'Cliente3' password: 'Cliente3'.
	
	aRestInterface addToCart: aCart1ID item: 'Libro1' amount: 1.
	aRestInterface addToCart: aCart2ID item: 'Libro2' amount: 1.
	
	aRestInterface checkOutCart: aCart1ID withCreditCardNumber: aValidCreditCardNumber expiresIn: DateAndTime tomorrow owner: 'Juan'.
	aRestInterface checkOutCart: aCart2ID withCreditCardNumber: aValidCreditCardNumber expiresIn: DateAndTime tomorrow owner: 'Cliente3'.
	
	self assert: 1 equals: (aRestInterface listPurchasesOfClient: 'Juan Perez' password: '123Juan') size.
	self assert: ((aRestInterface listPurchasesOfClient: 'Juan Perez' password: '123Juan') first item = 'Libro1').
	self assert: (aPriceList at: 'Libro1') equals: (aRestInterface listPurchasesOfClient: 'Juan Perez' password: '123Juan') first price.
	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 17:30:15'!
test34ExpiredCartsAreRemoveCorrectlyFromTheCartLists
	
	| aCart1ID aCart2ID |

	
	aCart1ID := aRestInterface createCartforClient: 'Juan Perez' password: '123Juan'.
	aCart2ID := aRestInterface createCartforClient: 'Cliente3' password: 'Cliente3'.
	
	aRestInterface cartExpired: aCart2ID.
	
	self assert: 1 equals: aRestInterface listAllCarts size.
	self assert: (aRestInterface listAllCarts includesKey: aCart1ID).
	self deny: (aRestInterface listAllCarts includesKey: aCart2ID).
	
	! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 18:23:34'!
test35WhenAddingAnItemOrListingACartTheExpirationTimerOfTheCartGetsUpdated
	
	| aCartID lastExpirationTime |
	
	aCartID := aRestInterface createCartforClient: 'Juan Perez' password: '123Juan'.
	
	lastExpirationTime := aRestInterface expirationTime: aCartID.
	
	aRestInterface addToCart: aCartID item: 'Libro1' amount: 2.
	
	self assert: (lastExpirationTime < (aRestInterface expirationTime: aCartID)).
	lastExpirationTime := aRestInterface expirationTime: aCartID.
	
	aRestInterface listCart: aCartID.
	
	self assert: (lastExpirationTime < (aRestInterface expirationTime: aCartID)).! !

!LibrosTests methodsFor: 'testing' stamp: 'C.A. 6/27/2017 18:35:21'!
test36InteractingWithAExpiredCartRaisesAnError

	| aCart1ID |

	
	aCart1ID := aRestInterface createCartforClient: 'Juan Perez' password: '123Juan'.
	aRestInterface setDate: DateAndTime yesterday.
	self should: [aRestInterface addToCart: aCart1ID item: 'Libro1' amount: 1]
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [:anError | 
								self assert: 'El carro ha expirado' equals: anError messageText]
		
	
	! !


!classDefinition: #Cart category: #TusLibros-Solution!
Object subclass: #Cart
	instanceVariableNames: 'containedItems catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cart methodsFor: 'accessing' stamp: 'abern 6/13/2017 19:14:28'!
amountOfContainedCopiesOf: anItem
	
	^containedItems occurrencesOf: anItem ! !

!Cart methodsFor: 'accessing' stamp: 'abern 6/13/2017 19:02:35'!
contains: anItem

	^containedItems includes: anItem ! !

!Cart methodsFor: 'accessing' stamp: 'abern 6/13/2017 19:00:22'!
isEmpty
	
	^containedItems isEmpty.! !

!Cart methodsFor: 'accessing' stamp: 'abern 6/15/2017 20:00:39'!
listItems
	
	^containedItems copy.! !

!Cart methodsFor: 'accessing' stamp: 'abern 6/15/2017 18:52:50'!
size
	
	^containedItems size.! !


!Cart methodsFor: 'initialization' stamp: 'abern 6/15/2017 19:21:34'!
initializeWithCatalog: aProductCatalog
	
	catalog := aProductCatalog .
	containedItems := Bag new.! !


!Cart methodsFor: 'adding' stamp: 'abern 6/15/2017 19:10:51'!
addBook: anItem

	self addBook: anItem withAmount: 1.! !

!Cart methodsFor: 'adding' stamp: 'C.A. 6/27/2017 11:07:21'!
addBook: anItem withAmount: aCopiesAmount

	(catalog includes: anItem) ifFalse:[^self error: 'El item no pertenece al catalogo'].
	(aCopiesAmount < 1) ifTrue: [^self error: 'La cantidad de elementos debe ser entera y positiva'].
	(aCopiesAmount isInteger) ifFalse: [^self error: 'La cantidad de elementos debe ser entera y positiva'].
	
	
	containedItems add: anItem withOccurrences: aCopiesAmount 

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros-Solution!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'abern 6/15/2017 19:20:14'!
newWithCatalog: aProductCatalog

	| aNewCart |
	
	aNewCart := self new.
	
	aNewCart initializeWithCatalog: aProductCatalog.
	
	^aNewCart 
	
	! !


!classDefinition: #Cashier category: #TusLibros-Solution!
Object subclass: #Cashier
	instanceVariableNames: 'priceList salesBook currentDateAndTime merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cashier methodsFor: 'initialization' stamp: 'C.A. 6/24/2017 11:49:46'!
initializeWithPriceList: aPriceList salesBook: aSalesBook currentDateAndTime: aDateAndTime merchantProcessor: aMerchantProcessor 
	
	salesBook := aSalesBook.
	priceList := aPriceList.
	currentDateAndTime := aDateAndTime.
	merchantProcessor := aMerchantProcessor.! !


!Cashier methodsFor: 'evaluating' stamp: 'C.A. 6/27/2017 18:21:16'!
checkOut: aCart withCard: aCreditCard
	
	| aTotalPrice aListOfPotentialSales |
	
	(aCart isEmpty) ifTrue:[^self error: 'No se puede hacer checkout de un carro vacio'].
	(aCreditCard isExpiredIn: DateAndTime now) ifTrue:[^self error: 'No se puede realizar el checkout si la tarjeta esta vencida'].
		
	aTotalPrice := 0.
	
	aListOfPotentialSales := OrderedCollection new.
	
	aCart listItems do: [:anItem | 
						aTotalPrice := aTotalPrice + (priceList at: anItem).
						aListOfPotentialSales add: (Sale newWithItem: anItem price: (priceList at: anItem)).
						].
	
	merchantProcessor debit: aTotalPrice from: aCreditCard.
	
	salesBook addAll: aListOfPotentialSales.
	
	^aTotalPrice.! !


!Cashier methodsFor: 'accessing' stamp: 'abern 6/19/2017 15:11:52'!
listSales
	
	^salesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros-Solution!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'C.A. 6/24/2017 11:25:43'!
newWithPriceList: aPriceList salesBook: aSalesBook currentDateAndTime: aDateAndTime merchantProcessor: aMerchantProcessor 
	
	| aNewCashier |
	
	aNewCashier := Cashier new.
	
	aNewCashier initializeWithPriceList: aPriceList 
					salesBook: aSalesBook 
					currentDateAndTime: aDateAndTime
					merchantProcessor: aMerchantProcessor.
	
	^aNewCashier ! !


!classDefinition: #CreditCard category: #TusLibros-Solution!
Object subclass: #CreditCard
	instanceVariableNames: 'ownerName cardNumber expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!CreditCard methodsFor: 'initialization' stamp: 'C.A. 6/22/2017 12:32:44'!
initializeWithNumber: aCreditCardNumber ownerName: aCreditCardOwnerName expirationDate: aDate 

	ownerName := aCreditCardOwnerName.
	cardNumber := aCreditCardNumber.
	expirationDate := aDate.! !


!CreditCard methodsFor: 'accessing' stamp: 'C.A. 6/22/2017 12:33:26'!
number
	
	^cardNumber ! !

!CreditCard methodsFor: 'accessing' stamp: 'C.A. 6/22/2017 12:33:06'!
ownerName
	
	^ownerName ! !


!CreditCard methodsFor: 'evaluating' stamp: 'C.A. 6/22/2017 15:01:09'!
isExpiredIn: aDate 
	
	^expirationDate < aDate ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros-Solution!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'C.A. 6/27/2017 16:03:31'!
newWithNumber: aCreditCardNumber ownerName: aFullName expirationDate: aDate 

	| aNewCreditCard |
	
	(aCreditCardNumber size = 16) ifFalse: [^self error: 'La tarjeta debe tener 16 digitos'].
	
	aNewCreditCard := self new.
	
	aNewCreditCard initializeWithNumber: aCreditCardNumber 
						ownerName: aFullName 
						expirationDate: aDate.
						
	^aNewCreditCard ! !


!classDefinition: #MerchantProcessorBehavior category: #TusLibros-Solution!
Object subclass: #MerchantProcessorBehavior
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!MerchantProcessorBehavior methodsFor: 'evaluating' stamp: 'C.A. 6/24/2017 13:29:37'!
debit: aPriceAmount from: aCreditCard 
	
	self subclassResponsibility ! !


!classDefinition: #SimulatedMerchantProcessor category: #TusLibros-Solution!
MerchantProcessorBehavior subclass: #SimulatedMerchantProcessor
	instanceVariableNames: 'debitClosure lastProcessedCard lastDebitedAmount processedACard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!SimulatedMerchantProcessor methodsFor: 'initializing' stamp: 'C.A. 6/24/2017 16:05:39'!
initializeWithDebitClosure: aDebitClosure 
	
	debitClosure := aDebitClosure.
	processedACard := false.! !


!SimulatedMerchantProcessor methodsFor: 'evaluating' stamp: 'C.A. 6/24/2017 15:23:03'!
debit: aPriceAmount from: aCreditCard 
	
	processedACard := true.
	lastDebitedAmount := aPriceAmount.
	lastProcessedCard := aCreditCard.
	
	debitClosure value.! !


!SimulatedMerchantProcessor methodsFor: 'test log' stamp: 'C.A. 6/24/2017 16:05:54'!
didNotReceiveRequest

	^processedACard not! !

!SimulatedMerchantProcessor methodsFor: 'test log' stamp: 'C.A. 6/24/2017 14:51:12'!
lastProcessedCreditCard

	^lastProcessedCard! !

!SimulatedMerchantProcessor methodsFor: 'test log' stamp: 'C.A. 6/24/2017 14:51:46'!
lastProcessedDebitAmount

	^lastDebitedAmount! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SimulatedMerchantProcessor class' category: #TusLibros-Solution!
SimulatedMerchantProcessor class
	instanceVariableNames: ''!

!SimulatedMerchantProcessor class methodsFor: 'instance creation' stamp: 'C.A. 6/24/2017 11:22:37'!
newWhenDebitDo: aDebitClosure 
	
	^self new initializeWithDebitClosure: aDebitClosure.! !


!classDefinition: #RestInterface category: #TusLibros-Solution!
Object subclass: #RestInterface
	instanceVariableNames: 'clientsLogin productsList merchantProcessor cartsList lastCartID salesBook cartOwnerRegister cartsExpirationTimes currentDateAndTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!RestInterface methodsFor: 'initialization' stamp: 'C.A. 6/27/2017 18:28:21'!
initializeWithClients: aClientRegister withProductList: aProductPriceList merchantProcessor: aMerchantProcessor cartsRegister: aAvailableRegisteredCartsList

	clientsLogin := aClientRegister.
	productsList := aProductPriceList.
	merchantProcessor := aMerchantProcessor.
	cartsList := aAvailableRegisteredCartsList.
	cartOwnerRegister := Dictionary new.
	lastCartID := 0.
	cartsExpirationTimes := Dictionary new.
	currentDateAndTime := DateAndTime now.
	
	salesBook := Dictionary new.
	clientsLogin keys do: [:aClientID | salesBook at: aClientID put: OrderedCollection new]! !


!RestInterface methodsFor: 'private' stamp: 'C.A. 6/27/2017 17:24:35'!
cartExpired: aCartID
	
	
	cartsList removeKey: aCartID.
	cartOwnerRegister removeKey: aCartID.! !

!RestInterface methodsFor: 'private' stamp: 'C.A. 6/27/2017 18:33:18'!
checkExpiration: aCartID
	
	((cartsExpirationTimes at: aCartID) < currentDateAndTime) ifFalse:[^self error: 'El carro ha expirado']! !

!RestInterface methodsFor: 'private' stamp: 'C.A. 6/27/2017 09:33:12'!
checkValidUser: aUserID withPassword: aPassword

	(clientsLogin includesKey: aUserID) ifFalse: [^self error: 'El userID ingresado es invalido'].
	((clientsLogin at: aUserID) = aPassword) ifFalse: [^self error: 'La password ingresada es invalida'].
	
	^true! !

!RestInterface methodsFor: 'private' stamp: 'C.A. 6/27/2017 18:10:52'!
expirationTime: aCartID 
	
	^cartsExpirationTimes at:aCartID ! !

!RestInterface methodsFor: 'private' stamp: 'C.A. 6/27/2017 10:50:54'!
findCart: aCartID ifFound: aBlockClosure 
	
	cartsList 	at: aCartID
				ifPresent:  [:cart | aBlockClosure value: cart]
				ifAbsent: [^self error: 'El carro con el ID ingresado no existe']
			! !

!RestInterface methodsFor: 'private' stamp: 'C.A. 6/24/2017 18:55:50'!
getNewCartID
	
	lastCartID := lastCartID + 1.
	
	^lastCartID.! !

!RestInterface methodsFor: 'private' stamp: 'C.A. 6/24/2017 18:57:00'!
listAllCarts
	
	^cartsList.! !

!RestInterface methodsFor: 'private' stamp: 'C.A. 6/27/2017 18:27:44'!
setDate: aDateAndTime 
	
	currentDateAndTime := aDateAndTime.! !


!RestInterface methodsFor: 'interface services' stamp: 'C.A. 6/27/2017 18:29:17'!
addToCart: aCartID item: aBookISBN amount: anItemQuantity
	
	self checkExpiration: aCartID. 
	cartsExpirationTimes at: aCartID put: DateAndTime now.
	self findCart: aCartID ifFound: [:cart | cart addBook: aBookISBN withAmount: anItemQuantity].! !

!RestInterface methodsFor: 'interface services' stamp: 'C.A. 6/27/2017 18:29:42'!
checkOutCart: aCartID withCreditCardNumber: aCreditCardNumber expiresIn: aDateAndTime owner: aClientID

	| aNewCashier aCheckingOutCart aClientCreditCard cartOwnerID |
	
	self findCart: aCartID ifFound: [:cart | aCheckingOutCart := cart].
	self checkExpiration: aCartID.
	cartOwnerID := cartOwnerRegister at: aCartID.
	
	aNewCashier := Cashier newWithPriceList: productsList 
								salesBook: (salesBook at: cartOwnerID)
								currentDateAndTime: DateAndTime now 
								merchantProcessor: merchantProcessor.
	
	aClientCreditCard := CreditCard newWithNumber:  aCreditCardNumber 
											ownerName:  aClientID 
											expirationDate: aDateAndTime.
	
	aNewCashier checkOut: aCheckingOutCart withCard: aClientCreditCard.! !

!RestInterface methodsFor: 'interface services' stamp: 'C.A. 6/27/2017 18:22:41'!
createCartforClient: aClientID password: aClientPassword
	
	| aNewCart aNewCartID |
	
	self checkValidUser: aClientID withPassword: aClientPassword.
	
	aNewCart := Cart newWithCatalog: productsList keys asSet.
	aNewCartID := self getNewCartID.
	
	cartsList at: aNewCartID put: aNewCart.
	cartOwnerRegister at: aNewCartID put: aClientID.
	cartsExpirationTimes at: aNewCartID put: DateAndTime now.
	
	^aNewCartID ! !

!RestInterface methodsFor: 'interface services' stamp: 'C.A. 6/27/2017 18:29:53'!
listCart: aCartID
	
	self checkExpiration: aCartID.
	cartsExpirationTimes at: aCartID put: DateAndTime now.
	self findCart: aCartID ifFound: [:cart | ^cart listItems].! !

!RestInterface methodsFor: 'interface services' stamp: 'C.A. 6/27/2017 14:52:27'!
listPurchasesOfClient: aClientID password: aClientPassword 
	
	self checkValidUser: aClientID withPassword: aClientPassword.
	
	^(salesBook at: aClientID) copy ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RestInterface class' category: #TusLibros-Solution!
RestInterface class
	instanceVariableNames: ''!

!RestInterface class methodsFor: 'instance creation' stamp: 'C.A. 6/27/2017 14:53:59'!
newWithClients: aClientRegister withProductList: aProductList merchantProcessor: aMerchantProcessor cartsRegister: aCartRegister
	
	| aNewRestInterface |
	
	aNewRestInterface := self new.
	
	aNewRestInterface initializeWithClients: aClientRegister 
						withProductList: aProductList 
						merchantProcessor: aMerchantProcessor 
						cartsRegister: aCartRegister.
												
	^aNewRestInterface ! !


!classDefinition: #Sale category: #TusLibros-Solution!
Object subclass: #Sale
	instanceVariableNames: 'totalSaleAmount items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Sale methodsFor: 'Initialization' stamp: 'C.A. 6/27/2017 16:46:49'!
initializeWithItem: aSoldItem price: aSoldItemPrice

 	items := aSoldItem.
	totalSaleAmount := aSoldItemPrice.! !


!Sale methodsFor: 'equality' stamp: 'C.A. 6/27/2017 16:43:16'!
= anObject

	(anObject isKindOf: Sale) ifFalse: [^false].
	
	^(totalSaleAmount = anObject price) and: [items = anObject item].! !

!Sale methodsFor: 'equality' stamp: 'C.A. 6/24/2017 15:56:52'!
hash

	items hash * totalSaleAmount hash! !


!Sale methodsFor: 'accessing' stamp: 'C.A. 6/27/2017 16:41:40'!
item
	
	^items! !

!Sale methodsFor: 'accessing' stamp: 'C.A. 6/27/2017 16:43:06'!
price
	
	^totalSaleAmount! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros-Solution!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'abern 6/19/2017 15:43:16'!
newWithItem: anItem price: anItemPrice
	
	| aNewSale |
	
	(anItemPrice < 0) ifTrue: [^self error: 'El precio del producto no puede ser negativo'].
	
	aNewSale := self new.
	
	aNewSale initializeWithItem: anItem price: anItemPrice.
	
	^aNewSale.! !
