!classDefinition: #OOStackTest category: #'Stack-Exercise'!
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

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'C.A. 5/4/2017 13:59:18'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
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


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'item size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'C.A. 5/4/2017 13:38:14'!
initialize
	item := OOStackNullItem new.
	size := 0! !


!OOStack methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:04:51'!
isEmpty
	^item isNullItem! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:52:26'!
pop
	|previousValue|
	previousValue := item value.
	item:= item previousItem.
	size:= size - 1.
	^previousValue! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:39:08'!
push: aValue
	|newItem|
	newItem := OOStackNotNullItem newWithPreviousItem:item andValue:aValue.
	size := size + 1.
	item:=newItem! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:39:21'!
size
	^size! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:37:02'!
top
	^item value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'creation' stamp: 'C.A. 5/4/2017 13:02:22'!
new
	|stack|
	stack := super new.
	stack initialize.
	^stack! !


!classDefinition: #OOStackItem category: #'Stack-Exercise'!
Object subclass: #OOStackItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackItem methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:06:06'!
isNullItem
	self subclassResponsibility! !

!OOStackItem methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:31:17'!
previousItem
	self subclassResponsibility! !

!OOStackItem methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:34:41'!
value
	self subclassResponsibility! !


!classDefinition: #OOStackNotNullItem category: #'Stack-Exercise'!
OOStackItem subclass: #OOStackNotNullItem
	instanceVariableNames: 'previousItem value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotNullItem methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:06:45'!
isNullItem
	^false! !

!OOStackNotNullItem methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:32:02'!
previousItem
	^previousItem! !

!OOStackNotNullItem methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:35:09'!
value
	^value! !


!OOStackNotNullItem methodsFor: 'initialization' stamp: 'C.A. 5/4/2017 13:25:39'!
initializeWithPreviousItem:aPreviousItem andValue:aValue
	previousItem:=aPreviousItem.
	value:=aValue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotNullItem class' category: #'Stack-Exercise'!
OOStackNotNullItem class
	instanceVariableNames: ''!

!OOStackNotNullItem class methodsFor: 'creation' stamp: 'C.A. 5/4/2017 13:26:03'!
newWithPreviousItem: aPreviousItem andValue:aValue
	|thisItem|
	thisItem := self new.
	thisItem initializeWithPreviousItem:aPreviousItem andValue:aValue.
	^thisItem! !


!classDefinition: #OOStackNullItem category: #'Stack-Exercise'!
OOStackItem subclass: #OOStackNullItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNullItem methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:06:56'!
isNullItem
	^true! !

!OOStackNullItem methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:58:28'!
previousItem
	self error: OOStack stackEmptyErrorDescription! !

!OOStackNullItem methodsFor: 'as yet unclassified' stamp: 'C.A. 5/4/2017 13:58:38'!
value
	self error: OOStack stackEmptyErrorDescription! !
