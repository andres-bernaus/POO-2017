!classDefinition: #DistanceTests category: #'Distance-Solution'!
TestCase subclass: #DistanceTests
	instanceVariableNames: 'oneMeter twoMeters halfAMeter oneKilometer oneHoundredCentimeters oneThousandMilimeters halfAKilometer oneMilimiter oneCentimeter oneDecimeter oneDecameter oneHectometer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/30/2017 13:58:13'!
assertAnIntervalOfDistancesContainsTheCorrectElementsOfThatClass: aDistanceSubclass

	| intervalOfDistances oneUnitOfDistance threeUnitsOfDistance twoUnitsOfDistance |
	
	oneUnitOfDistance := aDistanceSubclass withAmount: 1.

	twoUnitsOfDistance := aDistanceSubclass withAmount: 2.
	
	threeUnitsOfDistance := aDistanceSubclass withAmount: 3.
	
	intervalOfDistances := oneUnitOfDistance to: threeUnitsOfDistance .

	self assert: (intervalOfDistances at: 1) = oneUnitOfDistance .

	self assert: (intervalOfDistances at: 2) = twoUnitsOfDistance .
	
	self assert: (intervalOfDistances at: 3) = threeUnitsOfDistance .
	

	! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/30/2017 16:55:22'!
assertCanCreateIntervalsOfClass: aDistanceClassBound usingAsStepTheDistanceSubclass: aDistanceClassStep 
	
	| oneUnitOfDistance twoUnitsOfDistance aStepAmount aNewInterval |
	
	oneUnitOfDistance := aDistanceClassBound withAmount: 1.
	
	twoUnitsOfDistance := aDistanceClassBound withAmount: 2.
	
	aStepAmount := aDistanceClassStep withAmount: 1.
	
	aNewInterval := (oneUnitOfDistance to: twoUnitsOfDistance by: aStepAmount).

	self assert: aNewInterval size - 1 = (oneUnitOfDistance length / ((aStepAmount convertTo: oneUnitOfDistance) length)) integerPart.
	self assert: ((aNewInterval at: 1) isKindOf: aDistanceClassStep)! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/30/2017 11:38:37'!
assertCorrectIntervalSizeWithDistanceClass: aDistanceSubclass

	| oneUnitOfDistance threeUnitsOfDistance halfAUnitOfDistance fourUnitsOfDistance |
	
	halfAUnitOfDistance := aDistanceSubclass withAmount: 0.5.
	
	oneUnitOfDistance := aDistanceSubclass withAmount: 1.
	
	threeUnitsOfDistance := aDistanceSubclass withAmount: 3.
	
	fourUnitsOfDistance := aDistanceSubclass withAmount: 4.

	self assert: (halfAUnitOfDistance to: oneUnitOfDistance ) size = 1.
	self assert: (oneUnitOfDistance to: threeUnitsOfDistance ) size = 3.
	self assert: (threeUnitsOfDistance to: fourUnitsOfDistance) size = 2.

	! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/27/2017 18:11:24'!
assertDistanceCannotBeDividedByZero: aDistance

	self should: [aDistance / 0]	raise: ZeroDivide ! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/27/2017 14:09:30'!
setUp

	oneMeter := Distance inMeters: 1.
	
	twoMeters := Distance inMeters: 2.

	halfAMeter := Distance inMeters: 0.5.
	
	oneKilometer := Distance inKilometers: 1.

	oneHoundredCentimeters := Distance inCentimeters: 100.
	
	oneThousandMilimeters := Distance inMilimeters: 1000.
	
	halfAKilometer := Distance inKilometers: 0.5.
	
	oneMilimiter := Distance inMilimeters: 1.
	
	oneCentimeter := Distance inCentimeters: 1.
	
	oneDecimeter := Distance inDecimeters: 1.
	
	oneDecameter := Distance inDecameters: 1.
	
	oneHectometer := Distance inHectometers: 1.! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/23/2017 09:40:56'!
test01OneMeterEqualsOneMeter

	| aMeter |
	
	aMeter := Distance inMeters: 1.

	self assert: oneMeter = aMeter.! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/23/2017 09:42:04'!
test02OneMeterDoesNotEqualTwoMeters

	self assert: oneMeter ~= twoMeters.! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/23/2017 11:31:33'!
test03OneMeterPlusOneMeterEqualsTwoMeters

	self assert: (oneMeter + oneMeter )  = twoMeters ! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/23/2017 11:39:01'!
test04OneMeterEqualsOneHoundredCentimeters

	self assert: oneMeter = oneHoundredCentimeters ! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/23/2017 12:45:09'!
test05SubstractingOneHoundredCentimetersFromTwoMetersEqualsAThousandMilimeters

	self assert: (twoMeters - oneHoundredCentimeters ) = oneThousandMilimeters ! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/23/2017 12:46:06'!
test06twoMetersEqualsOneMeterMultipliedByTwo

	self assert: (oneMeter * 2) = twoMeters ! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/23/2017 12:47:28'!
test07OneMeterDividedByTwoEqualsalfAMeter

	self assert: (oneMeter / 2) = halfAMeter ! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/23/2017 12:48:38'!
test08OneKilometerIsGreaterThanOneMeter

	self assert: oneKilometer > oneMeter ! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/23/2017 12:49:26'!
test09OneMeterIsLessThanTwoMeters

	self assert: oneMeter < twoMeters ! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/23/2017 12:50:39'!
test10OneKilometerIsGreaterEqualThanOneMeter

	self assert: oneKilometer >= oneMeter ! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/23/2017 12:52:01'!
test11OneMeterIsLessOrEqualThanTwoMeters

	self assert: oneMeter <= twoMeters ! !

!DistanceTests methodsFor: 'Testing' stamp: 'abern 5/23/2017 19:07:35'!
test12OneMeterIsLessOrEqualThanOneKilometers

	self assert: oneMeter <= oneKilometer! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/30/2017 14:02:54'!
test13AddingAnyDistanceToOneMeterResultsInADistanceGreaterThanOneMeter
	self assert: oneMeter < (oneMeter + oneMilimiter).
	
	self assert: oneMeter < (oneMeter + oneCentimeter).
	
	self assert: oneMeter < (oneMeter + oneDecimeter).
	
	self assert: oneMeter < (oneMeter + oneMeter).
	
	self assert: oneMeter < (oneMeter + oneDecameter).
	
	self assert: oneMeter < (oneMeter + oneHectometer).
	
	self assert: oneMeter < (oneMeter + halfAKilometer).! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/30/2017 14:03:57'!
test14AddingAnyDistanceToOneCentimeterResultsInADistanceGreaterThanOneCentimeter

	self assert: oneCentimeter < (oneCentimeter + oneMilimiter).
	
	self assert: oneCentimeter < (oneCentimeter + oneCentimeter).
	
	self assert: oneCentimeter < (oneCentimeter + oneDecimeter).
	
	self assert: oneCentimeter < (oneCentimeter + oneMeter).
	
	self assert: oneCentimeter < (oneCentimeter + oneDecameter).
	
	self assert: oneCentimeter < (oneCentimeter + oneHectometer).
	
	self assert: oneCentimeter < (oneCentimeter + halfAKilometer).! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/30/2017 14:04:36'!
test15AddingAnyDistanceToOneMilimeterResultsInADistanceGreaterThanOneMilimeter

	
	self assert: oneMilimiter < (oneMilimiter + oneMilimiter).
	
	self assert: oneMilimiter < (oneMilimiter + oneCentimeter).
	
	self assert: oneMilimiter < (oneMilimiter + oneDecimeter).
	
	self assert: oneMilimiter < (oneMilimiter + oneMeter).
	
	self assert: oneMilimiter < (oneMilimiter + oneDecameter).
	
	self assert: oneMilimiter < (oneMilimiter + oneHectometer).
	
	self assert: oneMilimiter < (oneMilimiter + halfAKilometer).! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/30/2017 14:05:12'!
test16AddingAnyDistanceToOneKilometerResultsInADistanceGreaterThanOneKilometer

		
	self assert: oneKilometer < (oneKilometer + oneMilimiter).
	
	self assert: oneKilometer < (oneKilometer + oneCentimeter).
	
	self assert: oneKilometer < (oneKilometer + oneDecimeter).
	
	self assert: oneKilometer < (oneKilometer + oneMeter).
	
	self assert: oneKilometer < (oneKilometer + oneDecameter).
	
	self assert: oneKilometer < (oneKilometer + oneHectometer).
	
	self assert: oneKilometer < (oneKilometer + halfAKilometer).! !

!DistanceTests methodsFor: 'Testing' stamp: 'abern 5/23/2017 20:04:58'!
test17SubstractingAnyDistanceToOneKilometerResultsInADistanceLowerThanOneKilometer

	self assert: oneKilometer > (oneKilometer - oneMilimiter).
	
	self assert: oneKilometer > (oneKilometer - oneCentimeter).
	
	self assert: oneKilometer > (oneKilometer - oneMilimiter).
	
	self assert: oneKilometer > (oneKilometer - halfAKilometer).! !

!DistanceTests methodsFor: 'Testing' stamp: 'abern 5/23/2017 20:05:50'!
test18SubstractingAnyDistanceToOneMilimeterResultsInADistanceLowerThanOneMilimeter

	self assert: oneMilimiter > (oneMilimiter - oneMilimiter).
	
	self assert: oneMilimiter > (oneMilimiter - oneCentimeter).
	
	self assert: oneMilimiter > (oneMilimiter - oneMilimiter).
	
	self assert: oneMilimiter > (oneMilimiter - halfAKilometer).! !

!DistanceTests methodsFor: 'Testing' stamp: 'abern 5/23/2017 20:08:52'!
test19SubstractingAnyDistanceToOneCentimeterResultsInADistanceLowerThanOneCentimeter

	self assert: oneCentimeter > (oneCentimeter - oneMilimiter).
	
	self assert: oneCentimeter > (oneCentimeter - oneCentimeter).
	
	self assert: oneCentimeter > (oneCentimeter - oneMilimiter).
	
	self assert: oneCentimeter > (oneCentimeter - halfAKilometer).! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/27/2017 17:10:38'!
test20MultiplyingAMilimeterByFactorsOfTenResultsInAEqualMagnitudeOfHigherUnitsOfLength

	self assert: oneMilimiter * 1 = oneMilimiter.

	self assert: oneMilimiter * 10 = oneCentimeter.
	
	self assert: oneMilimiter * 100 = oneDecimeter.
	
	self assert: oneMilimiter * 1000 = oneMeter.
	
	self assert: oneMilimiter * 10000 = oneDecameter.
	
	self assert: oneMilimiter * 100000 = oneHectometer.
	
	self assert: oneMilimiter * 1000000 = oneKilometer.! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/27/2017 14:47:00'!
test21MultiplyingAndDividingACentimeterByFactorsOfTenResultsInAEqualMagnitudeOfOtherUnitsOfLength

	self assert: oneCentimeter / 10 = oneMilimiter.

	self assert: oneCentimeter * 1 = oneCentimeter.
	
	self assert: oneCentimeter * 10 = oneDecimeter.
	
	self assert: oneCentimeter * 100 = oneMeter.
	
	self assert: oneCentimeter * 1000 = oneDecameter.
	
	self assert: oneCentimeter * 10000 = oneHectometer.
	
	self assert: oneCentimeter * 100000 = oneKilometer.! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/27/2017 16:44:08'!
test22MultiplyingAndDividingADecimeterByFactorsOfTenResultsInAEqualMagnitudeOfOtherUnitsOfLength

	self assert: oneDecimeter / 100 = oneMilimiter.

	self assert: oneDecimeter / 10 = oneCentimeter.
	
	self assert: oneDecimeter * 1 = oneDecimeter.
	
	self assert: oneDecimeter * 10 = oneMeter.
	
	self assert: oneDecimeter * 100 = oneDecameter.
	
	self assert: oneDecimeter * 1000 = oneHectometer.
	
	self assert: oneDecimeter * 10000 = oneKilometer.! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/27/2017 16:49:52'!
test23MultiplyingAndDividingAMeterByFactorsOfTenResultsInAEqualMagnitudeOfOtherUnitsOfLength

	self assert: oneMeter / 1000 = oneMilimiter.

	self assert: oneMeter / 100 = oneCentimeter.
	
	self assert: oneMeter / 10 = oneDecimeter.
	
	self assert: oneMeter * 1 = oneMeter.
	
	self assert: oneMeter * 10 = oneDecameter.
	
	self assert: oneMeter * 100 = oneHectometer.
	
	self assert: oneMeter * 1000 = oneKilometer.! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/27/2017 16:55:01'!
test24MultiplyingAndDividingADecameterByFactorsOfTenResultsInAEqualMagnitudeOfOtherUnitsOfLength

	self assert: oneDecameter / 10000 = oneMilimiter.

	self assert: oneDecameter / 1000 = oneCentimeter.
	
	self assert: oneDecameter / 100 = oneDecimeter.
	
	self assert: oneDecameter / 10 = oneMeter.
	
	self assert: oneDecameter * 1 = oneDecameter.
	
	self assert: oneDecameter * 10 = oneHectometer.
	
	self assert: oneDecameter * 100 = oneKilometer.! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/27/2017 17:02:37'!
test25MultiplyingAndDividingAHectometerByFactorsOfTenResultsInAEqualMagnitudeOfOtherUnitsOfLength

	self assert: oneHectometer / 100000 = oneMilimiter.

	self assert: oneHectometer / 10000 = oneCentimeter.
	
	self assert: oneHectometer / 1000 = oneDecimeter.
	
	self assert: oneHectometer / 100 = oneMeter.
	
	self assert: oneHectometer / 10 = oneDecameter.
	
	self assert: oneHectometer * 1 = oneHectometer.
	
	self assert: oneHectometer * 10 = oneKilometer.! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/27/2017 17:08:09'!
test26DividingAKilometerByFactorsOfTenResultsInAEqualMagnitudeOfOtherUnitsOfLength

	self assert: oneKilometer / 1000000 = oneMilimiter.

	self assert: oneKilometer / 100000 = oneCentimeter.
	
	self assert: oneKilometer / 10000 = oneDecimeter.
	
	self assert: oneKilometer / 1000 = oneMeter.
	
	self assert: oneKilometer / 100 = oneDecameter.
	
	self assert: oneKilometer / 10 = oneHectometer.
	
	self assert: oneKilometer * 1 = oneKilometer.! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/27/2017 18:12:06'!
test27DividingAUnitOfLengthByZeroResultsInADivideByZeroError

	self assertDistanceCannotBeDividedByZero: oneMilimiter.
	
	self assertDistanceCannotBeDividedByZero: oneCentimeter.
	
	self assertDistanceCannotBeDividedByZero: oneDecimeter.
	
	self assertDistanceCannotBeDividedByZero: oneMeter.
	
	self assertDistanceCannotBeDividedByZero: oneDecameter.
	
	self assertDistanceCannotBeDividedByZero: oneHectometer.
	
	self assertDistanceCannotBeDividedByZero: oneKilometer.! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/30/2017 11:39:39'!
test28AnIntervalOfDistancesFromOneUnitToThreeContainsThreeElements

	self assertCorrectIntervalSizeWithDistanceClass: Milimeter.
	self assertCorrectIntervalSizeWithDistanceClass: Centimeter.
	self assertCorrectIntervalSizeWithDistanceClass: Decimeter.
	self assertCorrectIntervalSizeWithDistanceClass: Meter.
	self assertCorrectIntervalSizeWithDistanceClass: Decameter.
	self assertCorrectIntervalSizeWithDistanceClass: Hectometer.
	self assertCorrectIntervalSizeWithDistanceClass: Kilometer.
	! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/30/2017 13:58:31'!
test29AnIntervalOfDistancesFromOneUnitToThreeUnitsContainsOneTwoAndThreeOfThatUnit

	self assertAnIntervalOfDistancesContainsTheCorrectElementsOfThatClass: Milimeter.
	self assertAnIntervalOfDistancesContainsTheCorrectElementsOfThatClass: Centimeter.
	self assertAnIntervalOfDistancesContainsTheCorrectElementsOfThatClass: Decimeter.
	self assertAnIntervalOfDistancesContainsTheCorrectElementsOfThatClass: Meter.
	self assertAnIntervalOfDistancesContainsTheCorrectElementsOfThatClass: Decameter.
	self assertAnIntervalOfDistancesContainsTheCorrectElementsOfThatClass: Hectometer.
	self assertAnIntervalOfDistancesContainsTheCorrectElementsOfThatClass: Kilometer.
	! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/30/2017 16:49:57'!
test30CanGenerateIntervalsOfMetersOfAnyDistanceUnitAsStep

	self assertCanCreateIntervalsOfClass: Meter usingAsStepTheDistanceSubclass:  Milimeter.
	self assertCanCreateIntervalsOfClass: Meter usingAsStepTheDistanceSubclass:  Centimeter.
	self assertCanCreateIntervalsOfClass: Meter usingAsStepTheDistanceSubclass:  Decimeter.
	self assertCanCreateIntervalsOfClass: Meter usingAsStepTheDistanceSubclass:  Meter.
	self assertCanCreateIntervalsOfClass: Meter usingAsStepTheDistanceSubclass:  Decameter.
	self assertCanCreateIntervalsOfClass: Meter usingAsStepTheDistanceSubclass:  Hectometer.
	self assertCanCreateIntervalsOfClass: Meter usingAsStepTheDistanceSubclass:  Kilometer.
	! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/30/2017 17:36:32'!
test31CanGenerateIntervalsStartingAndEndingWithAnyUnitOfDistance

	
	self assert: (oneMilimiter to: oneMeter) size = 1000.
	self assert: (oneCentimeter to: oneMeter ) size = 100.
	self assert: (oneDecimeter to: oneDecameter) size = 100.
	self assert: (oneMeter to: oneKilometer ) size = 1000.
	self assert: (oneMeter to: oneHectometer ) size = 100.
	self assert: (oneDecameter to: oneKilometer ) size = 100.
	self assert: (oneHectometer to: oneKilometer ) size = 10.
	! !

!DistanceTests methodsFor: 'Testing' stamp: 'C.A. 5/30/2017 17:43:37'!
test32CanIterateThroughTheElementsOfAnIntervalOfDistances

	| aNewInterval |
	
	aNewInterval := OrderedCollection new.

	(oneMeter  to: oneKilometer by: oneMeter do: [:aDistanceInMeters | 
																(aDistanceInMeters length > 500) ifTrue: [aNewInterval add: aDistanceInMeters]]).
															
	self assert: aNewInterval size = 500.
	! !


!classDefinition: #Distance category: #'Distance-Solution'!
Object subclass: #Distance
	instanceVariableNames: 'magnitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Distance methodsFor: 'intervals' stamp: 'C.A. 5/30/2017 10:34:22'!
to: aDistance
	
	^self to: aDistance by: (self class withAmount: 1).! !

!Distance methodsFor: 'intervals' stamp: 'C.A. 5/30/2017 15:17:30'!
to: anEndPointDistance by: aDistanceIntervalStep
	
	| aNewIntervalOfDistances endDistanceLength initialDistanceLength |
	
	aNewIntervalOfDistances := OrderedCollection new.
	
	initialDistanceLength := (self convertTo: aDistanceIntervalStep) length.
	endDistanceLength := (anEndPointDistance convertTo: aDistanceIntervalStep) length .
	
	(initialDistanceLength to: endDistanceLength by: aDistanceIntervalStep length) do: [:aDistanceLength | 
																								aNewIntervalOfDistances add: (aDistanceIntervalStep class withAmount: aDistanceLength)].
	
	^aNewIntervalOfDistances ! !

!Distance methodsFor: 'intervals' stamp: 'C.A. 5/30/2017 11:15:48'!
to: anEndPointDistance by: aDistanceIntervalStep do: aClosure
	
	(self to:anEndPointDistance by:aDistanceIntervalStep) do: aClosure ! !


!Distance methodsFor: 'accessing' stamp: 'C.A. 5/30/2017 10:27:19'!
length
	
	^magnitude! !


!Distance methodsFor: 'operating' stamp: 'C.A. 5/30/2017 10:39:59'!
* aScalar

	^self class withAmount: magnitude * aScalar! !

!Distance methodsFor: 'operating' stamp: 'C.A. 5/30/2017 10:53:29'!
+ aDistance

	^self subclassResponsibility
	
	! !

!Distance methodsFor: 'operating' stamp: 'C.A. 5/30/2017 10:53:34'!
- aDistance

	^self subclassResponsibility
	
	! !

!Distance methodsFor: 'operating' stamp: 'C.A. 5/30/2017 10:43:29'!
/ aScalar

	aScalar isZero ifTrue: [^(ZeroDivide dividend: self) signal].

	^self class withAmount: magnitude / aScalar! !


!Distance methodsFor: 'comparing' stamp: 'C.A. 5/30/2017 10:55:59'!
< aDistance

	^self subclassResponsibility ! !

!Distance methodsFor: 'comparing' stamp: 'C.A. 5/30/2017 10:55:26'!
<= aDistance

	^(self > aDistance) not! !

!Distance methodsFor: 'comparing' stamp: 'C.A. 5/30/2017 11:00:15'!
= aDistance

	^self subclassResponsibility ! !

!Distance methodsFor: 'comparing' stamp: 'C.A. 5/30/2017 10:55:56'!
> aDistance

	^self subclassResponsibility ! !

!Distance methodsFor: 'comparing' stamp: 'C.A. 5/30/2017 10:55:37'!
>= aDistance

	^(self < aDistance) not! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Distance class' category: #'Distance-Solution'!
Distance class
	instanceVariableNames: ''!

!Distance class methodsFor: 'instance creation' stamp: 'C.A. 5/23/2017 11:41:19'!
inCentimeters: aCentimeterAmount

	^Centimeter withAmount: aCentimeterAmount .! !

!Distance class methodsFor: 'instance creation' stamp: 'C.A. 5/27/2017 14:17:35'!
inDecameters: aDecameterAmount

	^Decameter withAmount: aDecameterAmount .! !

!Distance class methodsFor: 'instance creation' stamp: 'C.A. 5/27/2017 14:16:14'!
inDecimeters: aDecimeterAmount

	^Decimeter withAmount: aDecimeterAmount.! !

!Distance class methodsFor: 'instance creation' stamp: 'C.A. 5/27/2017 14:20:43'!
inHectometers: aHectometerAmount

	^Hectometer withAmount: aHectometerAmount.! !

!Distance class methodsFor: 'instance creation' stamp: 'C.A. 5/23/2017 10:55:44'!
inKilometers: aKilometerAmount

	^Kilometer withAmount: aKilometerAmount .! !

!Distance class methodsFor: 'instance creation' stamp: 'C.A. 5/23/2017 10:18:53'!
inMeters: aMeterAmount

	^Meter withAmount: aMeterAmount.! !

!Distance class methodsFor: 'instance creation' stamp: 'C.A. 5/23/2017 10:56:31'!
inMilimeters: aMilimeterAmount

	^Milimeter withAmount: aMilimeterAmount .! !


!classDefinition: #Centimeter category: #'Distance-Solution'!
Distance subclass: #Centimeter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Centimeter methodsFor: 'Initialization' stamp: 'C.A. 5/30/2017 13:54:54'!
initializeWith: aCentimeterAmount
	
	magnitude := aCentimeterAmount ! !


!Centimeter methodsFor: 'converting' stamp: 'C.A. 5/30/2017 16:27:41'!
convertTo: aDistanceUnit
	
	^aDistanceUnit convertingFrom: self.! !

!Centimeter methodsFor: 'converting' stamp: 'abern 5/23/2017 19:29:36'!
magnitudeInCentimeters
	
	^magnitude! !

!Centimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:57:38'!
magnitudeInDecameters
	
	^magnitude / 1000! !

!Centimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:41:31'!
magnitudeInDecimeters
	
	^magnitude / 10! !

!Centimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 17:03:56'!
magnitudeInHectometers
	
	^magnitude / 10000! !

!Centimeter methodsFor: 'converting' stamp: 'abern 5/23/2017 19:54:06'!
magnitudeInKilometers

	^magnitude * 0.00001! !

!Centimeter methodsFor: 'converting' stamp: 'C.A. 5/23/2017 12:40:31'!
magnitudeInMeters
	^magnitude * 0.01! !

!Centimeter methodsFor: 'converting' stamp: 'abern 5/23/2017 19:42:57'!
magnitudeInMilimeters
	
	^magnitude * 10! !


!Centimeter methodsFor: 'comparing' stamp: 'abern 5/23/2017 19:33:17'!
< aDistance
	
	^magnitude < aDistance magnitudeInCentimeters! !

!Centimeter methodsFor: 'comparing' stamp: 'C.A. 5/27/2017 14:56:50'!
= aDistance

	^magnitude =  aDistance magnitudeInCentimeters 
! !

!Centimeter methodsFor: 'comparing' stamp: 'abern 5/23/2017 20:10:11'!
> aDistance

	^magnitude > aDistance magnitudeInCentimeters ! !


!Centimeter methodsFor: 'operating' stamp: 'abern 5/23/2017 20:11:25'!
+ aDistance

	^self class withAmount: (magnitude + aDistance magnitudeInCentimeters)! !

!Centimeter methodsFor: 'operating' stamp: 'abern 5/23/2017 20:11:30'!
- aDistance
	
	^self class withAmount: (magnitude - aDistance magnitudeInCentimeters )! !


!Centimeter methodsFor: 'private' stamp: 'C.A. 5/30/2017 16:36:50'!
convertingFrom: aDistanceUnit
	
	^self class withAmount: aDistanceUnit magnitudeInCentimeters ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Centimeter class' category: #'Distance-Solution'!
Centimeter class
	instanceVariableNames: ''!

!Centimeter class methodsFor: 'instance creation' stamp: 'C.A. 5/30/2017 13:56:12'!
withAmount: aCentimeterAmount
	
	| aNewCentimeter |
	
	aNewCentimeter := self new.
	
	aNewCentimeter initializeWith: aCentimeterAmount .
	
	^aNewCentimeter .! !


!classDefinition: #Decameter category: #'Distance-Solution'!
Distance subclass: #Decameter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Decameter methodsFor: 'initialization' stamp: 'C.A. 5/27/2017 14:08:13'!
initializeWith: aMeterAmount
	
	magnitude := aMeterAmount.! !


!Decameter methodsFor: 'comparing' stamp: 'C.A. 5/27/2017 14:08:13'!
< aDistance
	
	^magnitude < aDistance magnitudeInMeters! !

!Decameter methodsFor: 'comparing' stamp: 'C.A. 5/27/2017 14:57:16'!
= aDistance

	^magnitude =  aDistance magnitudeInDecameters.
! !

!Decameter methodsFor: 'comparing' stamp: 'C.A. 5/27/2017 14:08:13'!
> aDistance
	
	^magnitude > aDistance  magnitudeInMeters! !


!Decameter methodsFor: 'converting' stamp: 'C.A. 5/30/2017 16:28:00'!
convertTo: aDistanceUnit
	
	^aDistanceUnit convertingFrom: self.! !

!Decameter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 15:33:49'!
magnitudeInCentimeters

	^magnitude * 1000! !

!Decameter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:59:40'!
magnitudeInDecameters
	
	^magnitude ! !

!Decameter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:46:01'!
magnitudeInDecimeters
	
	^magnitude * 100! !

!Decameter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 17:05:05'!
magnitudeInHectometers
	
	^magnitude / 10! !

!Decameter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 17:46:21'!
magnitudeInKilometers
	
	^magnitude / 100! !

!Decameter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:52:55'!
magnitudeInMeters
	^magnitude * 10! !

!Decameter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 14:32:28'!
magnitudeInMilimeters
	
	^magnitude * 10000! !


!Decameter methodsFor: 'operating' stamp: 'C.A. 5/27/2017 14:08:13'!
+ aDistance


	^self class withAmount: (magnitude + aDistance magnitudeInMeters)! !

!Decameter methodsFor: 'operating' stamp: 'C.A. 5/27/2017 14:08:13'!
- aDistance
	^self class withAmount: (magnitude - aDistance magnitudeInMeters)! !


!Decameter methodsFor: 'private' stamp: 'C.A. 5/30/2017 16:35:59'!
convertingFrom: aDistanceUnit
	
	^self class withAmount: aDistanceUnit magnitudeInDecameters ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Decameter class' category: #'Distance-Solution'!
Decameter class
	instanceVariableNames: ''!

!Decameter class methodsFor: 'instance creation' stamp: 'C.A. 5/27/2017 14:08:13'!
withAmount: aMeterAmount
	
	| aNewMeter |
	
	aNewMeter := self new.
	
	aNewMeter initializeWith: aMeterAmount. 
	
	^aNewMeter! !


!classDefinition: #Decimeter category: #'Distance-Solution'!
Distance subclass: #Decimeter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Decimeter methodsFor: 'Initialization' stamp: 'C.A. 5/30/2017 13:54:36'!
initializeWith: aCentimeterAmount
	
	magnitude := aCentimeterAmount ! !


!Decimeter methodsFor: 'converting' stamp: 'C.A. 5/30/2017 16:29:27'!
convertTo: aDistanceUnit
	
	^aDistanceUnit convertingFrom: self.! !

!Decimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 15:02:29'!
magnitudeInCentimeters
	
	^magnitude * 10! !

!Decimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:58:16'!
magnitudeInDecameters
	
	^magnitude / 100! !

!Decimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 14:55:39'!
magnitudeInDecimeters
	
	^magnitude ! !

!Decimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 17:04:17'!
magnitudeInHectometers
	
	^magnitude / 1000! !

!Decimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 17:45:33'!
magnitudeInKilometers

	^magnitude / 10000! !

!Decimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:52:05'!
magnitudeInMeters
	^magnitude / 10! !

!Decimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 14:29:48'!
magnitudeInMilimeters
	
	^magnitude * 100! !


!Decimeter methodsFor: 'comparing' stamp: 'C.A. 5/27/2017 14:07:43'!
< aDistance
	
	^magnitude < aDistance magnitudeInCentimeters! !

!Decimeter methodsFor: 'comparing' stamp: 'C.A. 5/27/2017 14:57:04'!
= aDistance

	^magnitude =  aDistance magnitudeInDecimeters .
! !

!Decimeter methodsFor: 'comparing' stamp: 'C.A. 5/27/2017 14:07:43'!
> aDistance

	^magnitude > aDistance magnitudeInCentimeters ! !


!Decimeter methodsFor: 'operating' stamp: 'C.A. 5/27/2017 14:07:43'!
+ aDistance

	^self class withAmount: (magnitude + aDistance magnitudeInCentimeters)! !

!Decimeter methodsFor: 'operating' stamp: 'C.A. 5/27/2017 14:07:43'!
- aDistance
	
	^self class withAmount: (magnitude - aDistance magnitudeInCentimeters )! !


!Decimeter methodsFor: 'private' stamp: 'C.A. 5/30/2017 16:35:35'!
convertingFrom: aDistanceUnit
	
	^self class withAmount: aDistanceUnit magnitudeInDecimeters! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Decimeter class' category: #'Distance-Solution'!
Decimeter class
	instanceVariableNames: ''!

!Decimeter class methodsFor: 'instance creation' stamp: 'C.A. 5/30/2017 13:56:20'!
withAmount: aCentimeterAmount
	
	| aNewCentimeter |
	
	aNewCentimeter := self new.
	
	aNewCentimeter initializeWith: aCentimeterAmount .
	
	^aNewCentimeter .! !


!classDefinition: #Hectometer category: #'Distance-Solution'!
Distance subclass: #Hectometer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Hectometer methodsFor: 'initialization' stamp: 'C.A. 5/27/2017 14:08:26'!
initializeWith: aMeterAmount
	
	magnitude := aMeterAmount.! !


!Hectometer methodsFor: 'comparing' stamp: 'C.A. 5/27/2017 14:08:26'!
< aDistance
	
	^magnitude < aDistance magnitudeInMeters! !

!Hectometer methodsFor: 'comparing' stamp: 'C.A. 5/27/2017 14:57:36'!
= aDistance

	^magnitude =  aDistance magnitudeInHectometers.
! !

!Hectometer methodsFor: 'comparing' stamp: 'C.A. 5/27/2017 14:08:26'!
> aDistance
	
	^magnitude > aDistance  magnitudeInMeters! !


!Hectometer methodsFor: 'converting' stamp: 'C.A. 5/30/2017 16:34:56'!
convertTo: aDistanceUnit
	
	^aDistanceUnit convertingFrom: self.! !

!Hectometer methodsFor: 'converting' stamp: 'C.A. 5/27/2017 15:35:07'!
magnitudeInCentimeters
	
	^magnitude * 10000! !

!Hectometer methodsFor: 'converting' stamp: 'C.A. 5/27/2017 17:00:40'!
magnitudeInDecameters
	
	^magnitude * 10! !

!Hectometer methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:46:17'!
magnitudeInDecimeters
	
	^magnitude * 1000! !

!Hectometer methodsFor: 'converting' stamp: 'C.A. 5/27/2017 17:05:25'!
magnitudeInHectometers
	
	^magnitude ! !

!Hectometer methodsFor: 'converting' stamp: 'C.A. 5/27/2017 17:46:35'!
magnitudeInKilometers
	
	^magnitude / 10! !

!Hectometer methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:53:08'!
magnitudeInMeters
	^magnitude * 100! !

!Hectometer methodsFor: 'converting' stamp: 'C.A. 5/27/2017 14:36:56'!
magnitudeInMilimeters
	
	^magnitude * 100000! !


!Hectometer methodsFor: 'operating' stamp: 'C.A. 5/27/2017 14:08:26'!
+ aDistance


	^self class withAmount: (magnitude + aDistance magnitudeInMeters)! !

!Hectometer methodsFor: 'operating' stamp: 'C.A. 5/27/2017 14:08:26'!
- aDistance
	^self class withAmount: (magnitude - aDistance magnitudeInMeters)! !


!Hectometer methodsFor: 'private' stamp: 'C.A. 5/30/2017 16:34:38'!
convertingFrom: aDistanceUnit
	
	^self class withAmount: aDistanceUnit magnitudeInHectometers ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Hectometer class' category: #'Distance-Solution'!
Hectometer class
	instanceVariableNames: ''!

!Hectometer class methodsFor: 'instance creation' stamp: 'C.A. 5/27/2017 14:08:26'!
withAmount: aMeterAmount
	
	| aNewMeter |
	
	aNewMeter := self new.
	
	aNewMeter initializeWith: aMeterAmount. 
	
	^aNewMeter! !


!classDefinition: #Kilometer category: #'Distance-Solution'!
Distance subclass: #Kilometer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Kilometer methodsFor: 'initialization' stamp: 'C.A. 5/30/2017 13:55:16'!
initializeWith: aKilometerAmount
	
	magnitude := aKilometerAmount .! !


!Kilometer methodsFor: 'comparing' stamp: 'C.A. 5/23/2017 13:21:19'!
< aDistance
	
	^magnitude < aDistance magnitudeInKilometers! !

!Kilometer methodsFor: 'comparing' stamp: 'C.A. 5/27/2017 14:57:45'!
= aDistance

	^magnitude =  aDistance magnitudeInKilometers.
! !

!Kilometer methodsFor: 'comparing' stamp: 'C.A. 5/25/2017 16:49:03'!
> aDistance
	
	^magnitude > aDistance magnitudeInKilometers.! !


!Kilometer methodsFor: 'converting' stamp: 'C.A. 5/30/2017 16:33:58'!
convertTo: aDistanceUnit
	
	^aDistanceUnit convertingFrom: self.! !

!Kilometer methodsFor: 'converting' stamp: 'abern 5/23/2017 19:34:09'!
magnitudeInCentimeters
	
	^magnitude * 100000! !

!Kilometer methodsFor: 'converting' stamp: 'C.A. 5/27/2017 17:01:03'!
magnitudeInDecameters
	
	^magnitude * 100! !

!Kilometer methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:46:59'!
magnitudeInDecimeters
	
	^magnitude * 10000! !

!Kilometer methodsFor: 'converting' stamp: 'C.A. 5/27/2017 17:05:58'!
magnitudeInHectometers
	
	^magnitude * 10! !

!Kilometer methodsFor: 'converting' stamp: 'abern 5/23/2017 19:53:19'!
magnitudeInKilometers
	
	^magnitude ! !

!Kilometer methodsFor: 'converting' stamp: 'abern 5/23/2017 19:10:15'!
magnitudeInMeters
	
	^magnitude * 1000! !

!Kilometer methodsFor: 'converting' stamp: 'abern 5/23/2017 19:46:26'!
magnitudeInMilimeters
	
	^magnitude * 1000000! !


!Kilometer methodsFor: 'operating' stamp: 'abern 5/23/2017 19:51:00'!
+ aDistance
	^self class withAmount: (magnitude + aDistance magnitudeInKilometers)! !

!Kilometer methodsFor: 'operating' stamp: 'abern 5/23/2017 20:02:58'!
- aDistance

	^self class withAmount: (magnitude - aDistance magnitudeInKilometers)! !


!Kilometer methodsFor: 'private' stamp: 'C.A. 5/30/2017 16:33:27'!
convertingFrom: aDistanceUnit
	
	^self class withAmount: aDistanceUnit magnitudeInKilometers ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Kilometer class' category: #'Distance-Solution'!
Kilometer class
	instanceVariableNames: ''!

!Kilometer class methodsFor: 'instance creation' stamp: 'C.A. 5/30/2017 13:56:01'!
withAmount: aKilometerAmount
	
	| aNewKilometer |
	
	aNewKilometer := self new.
	
	aNewKilometer initializeWith: aKilometerAmount.
	
	^aNewKilometer.! !


!classDefinition: #Meter category: #'Distance-Solution'!
Distance subclass: #Meter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Meter methodsFor: 'initialization' stamp: 'C.A. 5/23/2017 11:11:08'!
initializeWith: aMeterAmount
	
	magnitude := aMeterAmount.! !


!Meter methodsFor: 'comparing' stamp: 'C.A. 5/23/2017 13:19:33'!
< aDistance
	
	^magnitude < aDistance magnitudeInMeters! !

!Meter methodsFor: 'comparing' stamp: 'C.A. 5/23/2017 11:47:36'!
= aDistance

	^magnitude =  aDistance magnitudeInMeters.
! !

!Meter methodsFor: 'comparing' stamp: 'abern 5/23/2017 19:09:26'!
> aDistance
	
	^magnitude > aDistance  magnitudeInMeters! !


!Meter methodsFor: 'converting' stamp: 'C.A. 5/30/2017 16:37:31'!
convertTo: aDistanceClass
	
	^aDistanceClass convertingFrom: self.! !

!Meter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 15:04:03'!
magnitudeInCentimeters
	
	^magnitude * 100! !

!Meter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:59:25'!
magnitudeInDecameters
	
	^magnitude / 10! !

!Meter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:45:32'!
magnitudeInDecimeters
	
	^magnitude * 10! !

!Meter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 17:04:40'!
magnitudeInHectometers
	
	^magnitude / 100! !

!Meter methodsFor: 'converting' stamp: 'C.A. 5/23/2017 13:17:41'!
magnitudeInKilometers
	
	^magnitude * 0.001! !

!Meter methodsFor: 'converting' stamp: 'C.A. 5/23/2017 12:44:35'!
magnitudeInMeters
	^magnitude! !

!Meter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 14:30:26'!
magnitudeInMilimeters
	
	^magnitude * 1000! !


!Meter methodsFor: 'operating' stamp: 'abern 5/23/2017 19:20:57'!
+ aDistance


	^self class withAmount: (magnitude + aDistance magnitudeInMeters)! !

!Meter methodsFor: 'operating' stamp: 'C.A. 5/23/2017 13:10:58'!
- aDistance
	^self class withAmount: (magnitude - aDistance magnitudeInMeters)! !


!Meter methodsFor: 'private' stamp: 'C.A. 5/30/2017 16:27:16'!
convertingFrom: aDistanceUnit
	
	^self class withAmount: aDistanceUnit magnitudeInMeters ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Meter class' category: #'Distance-Solution'!
Meter class
	instanceVariableNames: ''!

!Meter class methodsFor: 'instance creation' stamp: 'C.A. 5/23/2017 11:11:39'!
withAmount: aMeterAmount
	
	| aNewMeter |
	
	aNewMeter := self new.
	
	aNewMeter initializeWith: aMeterAmount. 
	
	^aNewMeter! !



!classDefinition: #Milimeter category: #'Distance-Solution'!
Distance subclass: #Milimeter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Milimeter methodsFor: 'Initilization' stamp: 'C.A. 5/23/2017 11:14:43'!
initializeWith: aMilimeterAmount
	
	magnitude := aMilimeterAmount.! !


!Milimeter methodsFor: 'converting' stamp: 'C.A. 5/30/2017 16:28:34'!
convertTo: aDistanceUnit
	
	^aDistanceUnit convertingFrom: self.! !

!Milimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:55:55'!
magnitudeInCentimeters
	
	^magnitude / 10! !

!Milimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:56:53'!
magnitudeInDecameters
	
	^magnitude / 10000! !

!Milimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 16:40:45'!
magnitudeInDecimeters
	
	^magnitude / 100! !

!Milimeter methodsFor: 'converting' stamp: 'C.A. 5/27/2017 17:03:23'!
magnitudeInHectometers
	
	^magnitude / 100000! !

!Milimeter methodsFor: 'converting' stamp: 'abern 5/23/2017 19:52:02'!
magnitudeInKilometers
	
	^magnitude * 0.000001! !

!Milimeter methodsFor: 'converting' stamp: 'C.A. 5/23/2017 13:03:08'!
magnitudeInMeters
	^magnitude * 0.001! !

!Milimeter methodsFor: 'converting' stamp: 'abern 5/23/2017 19:39:41'!
magnitudeInMilimeters
	
	^magnitude! !


!Milimeter methodsFor: 'comparing' stamp: 'abern 5/23/2017 19:40:39'!
< aDistance

	^ magnitude  < aDistance magnitudeInMilimeters! !

!Milimeter methodsFor: 'comparing' stamp: 'C.A. 5/27/2017 14:27:20'!
= aDistance

	^magnitude =  aDistance magnitudeInMilimeters.! !

!Milimeter methodsFor: 'comparing' stamp: 'abern 5/23/2017 20:07:38'!
> aDistance

	^magnitude > aDistance magnitudeInMilimeters ! !


!Milimeter methodsFor: 'operating' stamp: 'C.A. 5/27/2017 09:13:52'!
+ aDistance

	^ self class withAmount: (magnitude + aDistance magnitudeInMilimeters)! !

!Milimeter methodsFor: 'operating' stamp: 'abern 5/23/2017 20:06:26'!
- aDistance

	^self class withAmount: (magnitude - aDistance magnitudeInMilimeters)! !


!Milimeter methodsFor: 'private' stamp: 'C.A. 5/30/2017 16:30:16'!
convertingFrom: aDistanceUnit
	
	^self class withAmount: aDistanceUnit magnitudeInMilimeters ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimeter class' category: #'Distance-Solution'!
Milimeter class
	instanceVariableNames: ''!

!Milimeter class methodsFor: 'instance creation' stamp: 'C.A. 5/23/2017 11:13:40'!
withAmount: aMilimeterAmount
	
	| aNewMilimeter |
	
	aNewMilimeter := self new.
	
	aNewMilimeter initializeWith: aMilimeterAmount .
	
	^aNewMilimeter ! !


!classDefinition: #DistanceFactory category: #'Distance-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceFactory methodsFor: 'instance creation' stamp: 'C.A. 5/30/2017 17:46:28'!
minusOneMeter

	^Distance inMeters: -1.! !

!DistanceFactory methodsFor: 'instance creation' stamp: 'C.A. 5/30/2017 17:47:39'!
oneCentimeter

	^Distance inCentimeters: 1.! !

!DistanceFactory methodsFor: 'instance creation' stamp: 'C.A. 5/30/2017 17:47:57'!
oneHundredCentimeters

	^Distance inCentimeters: 100.! !

!DistanceFactory methodsFor: 'instance creation' stamp: 'C.A. 5/30/2017 17:48:14'!
oneMeter

	^Distance inMeters: 1.! !

!DistanceFactory methodsFor: 'instance creation' stamp: 'C.A. 5/30/2017 17:48:31'!
twoHundredCentimeters

	^Distance inCentimeters: 200.! !

!DistanceFactory methodsFor: 'instance creation' stamp: 'C.A. 5/30/2017 17:48:53'!
twoMeters

	^Distance inMeters: 2.! !

!DistanceFactory methodsFor: 'instance creation' stamp: 'C.A. 5/30/2017 17:48:59'!
zeroMeters

	^Distance inMeters: 0.! !
