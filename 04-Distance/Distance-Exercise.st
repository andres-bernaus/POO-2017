!classDefinition: #DistanceTests category: #'Distance-Exercise'!
TestCase subclass: #DistanceTests
	instanceVariableNames: 'oneMeter twoMeters halfAMeter oneKilometer oneHoundredCentimeters oneThousandMilimeters halfAKilometer oneMilimiter oneCentimeter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Exercise'!

!DistanceTests methodsFor: 'Testing' stamp: 'abern 5/23/2017 19:23:36'!
setUp

	oneMeter := Distance inMeters: 1.
	
	twoMeters := Distance inMeters: 2.

	halfAMeter := Distance inMeters: 0.5.
	
	oneKilometer := Distance inKilometers: 1.

	oneHoundredCentimeters := Distance inCentimeters: 100.
	
	oneThousandMilimeters := Distance inMilimeters: 1000.
	
	halfAKilometer := Distance inKilometers: 0.5.
	
	oneMilimiter := Distance inMilimeters: 1.
	
	oneCentimeter := Distance inCentimeters: 1.! !

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

!DistanceTests methodsFor: 'Testing' stamp: 'abern 5/23/2017 19:24:07'!
test13AddingAnyDistanceToOneMeterResultsInADistanceGreaterThanOneMeter

	self assert: oneMeter < (oneMeter + oneMilimiter).
	
	self assert: oneMeter < (oneMeter + oneCentimeter).
	
	self assert: oneMeter < (oneMeter + oneMilimiter).
	
	self assert: oneMeter < (oneMeter + halfAKilometer).! !

!DistanceTests methodsFor: 'Testing' stamp: 'abern 5/23/2017 19:24:53'!
test14AddingAnyDistanceToOneCentimeterResultsInADistanceGreaterThanOneCentimeter

	self assert: oneCentimeter < (oneCentimeter + oneMilimiter).
	
	self assert: oneCentimeter < (oneCentimeter + oneCentimeter).
	
	self assert: oneCentimeter < (oneCentimeter + oneMilimiter).
	
	self assert: oneCentimeter < (oneCentimeter + halfAKilometer).! !

!DistanceTests methodsFor: 'Testing' stamp: 'abern 5/23/2017 19:37:30'!
test15AddingAnyDistanceToOneMilimeterResultsInADistanceGreaterThanOneMilimeter

	self assert: oneMilimiter < (oneMilimiter + oneMilimiter).
	
	self assert: oneMilimiter < (oneMilimiter + oneCentimeter).
	
	self assert: oneMilimiter < (oneMilimiter + oneMilimiter).
	
	self assert: oneMilimiter < (oneMilimiter + halfAKilometer).! !

!DistanceTests methodsFor: 'Testing' stamp: 'abern 5/23/2017 19:50:00'!
test16AddingAnyDistanceToOneKilometerResultsInADistanceGreaterThanOneKilometer

	self assert: oneKilometer < (oneKilometer + oneMilimiter).
	
	self assert: oneKilometer < (oneKilometer + oneCentimeter).
	
	self assert: oneKilometer < (oneKilometer + oneMilimiter).
	
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


!classDefinition: #Centimeter category: #'Distance-Exercise'!
Object subclass: #Centimeter
	instanceVariableNames: 'magnitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Exercise'!

!Centimeter methodsFor: 'Initialization' stamp: 'C.A. 5/23/2017 11:44:05'!
initilizeWith: aCentimeterAmount
	
	magnitude := aCentimeterAmount ! !


!Centimeter methodsFor: 'as yet unclassified' stamp: 'abern 5/23/2017 20:11:25'!
+ aDistance

	^self class withAmount: (magnitude + aDistance magnitudeInCentimeters)! !

!Centimeter methodsFor: 'as yet unclassified' stamp: 'abern 5/23/2017 20:11:30'!
- aDistance
	
	^self class withAmount: (magnitude - aDistance magnitudeInCentimeters )! !


!Centimeter methodsFor: 'converting' stamp: 'abern 5/23/2017 19:29:36'!
magnitudeInCentimeters
	
	^magnitude! !

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

!Centimeter methodsFor: 'comparing' stamp: 'abern 5/23/2017 20:10:11'!
> aDistance

	^magnitude > aDistance magnitudeInCentimeters ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Centimeter class' category: #'Distance-Exercise'!
Centimeter class
	instanceVariableNames: ''!

!Centimeter class methodsFor: 'instance creation' stamp: 'C.A. 5/23/2017 11:42:51'!
withAmount: aCentimeterAmount
	
	| aNewCentimeter |
	
	aNewCentimeter := self new.
	
	aNewCentimeter initilizeWith: aCentimeterAmount .
	
	^aNewCentimeter .! !


!classDefinition: #Distance category: #'Distance-Exercise'!
Object subclass: #Distance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Distance class' category: #'Distance-Exercise'!
Distance class
	instanceVariableNames: ''!

!Distance class methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 11:41:19'!
inCentimeters: aCentimeterAmount

	^Centimeter withAmount: aCentimeterAmount .! !

!Distance class methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 10:55:44'!
inKilometers: aKilometerAmount

	^Kilometer withAmount: aKilometerAmount .! !

!Distance class methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 10:18:53'!
inMeters: aMeterAmount

	^Meter withAmount: aMeterAmount.! !

!Distance class methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 10:56:31'!
inMilimeters: aMilimeterAmount

	^Milimeter withAmount: aMilimeterAmount .! !


!classDefinition: #Kilometer category: #'Distance-Exercise'!
Object subclass: #Kilometer
	instanceVariableNames: 'magnitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Exercise'!

!Kilometer methodsFor: 'initialization' stamp: 'C.A. 5/23/2017 11:10:44'!
initilizeWith: aKilometerAmount
	
	magnitude := aKilometerAmount .! !


!Kilometer methodsFor: 'comparing' stamp: 'C.A. 5/23/2017 13:21:19'!
< aDistance
	
	^magnitude < aDistance magnitudeInKilometers! !

!Kilometer methodsFor: 'comparing' stamp: 'C.A. 5/23/2017 13:16:55'!
> aDistance
	
	^magnitude > aDistance magnitudeInKilometers.! !

!Kilometer methodsFor: 'comparing' stamp: 'C.A. 5/23/2017 13:20:28'!
>= aDistance
	
	^ (self < aDistance) not! !


!Kilometer methodsFor: 'converting' stamp: 'abern 5/23/2017 19:34:09'!
magnitudeInCentimeters
	
	^magnitude * 100000! !

!Kilometer methodsFor: 'converting' stamp: 'abern 5/23/2017 19:53:19'!
magnitudeInKilometers
	
	^magnitude ! !

!Kilometer methodsFor: 'converting' stamp: 'abern 5/23/2017 19:10:15'!
magnitudeInMeters
	
	^magnitude * 1000! !

!Kilometer methodsFor: 'converting' stamp: 'abern 5/23/2017 19:46:26'!
magnitudeInMilimeters
	
	^magnitude * 1000000! !


!Kilometer methodsFor: 'as yet unclassified' stamp: 'abern 5/23/2017 19:51:00'!
+ aDistance
	^self class withAmount: (magnitude + aDistance magnitudeInKilometers)! !

!Kilometer methodsFor: 'as yet unclassified' stamp: 'abern 5/23/2017 20:02:58'!
- aDistance

	^self class withAmount: (magnitude - aDistance magnitudeInKilometers)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Kilometer class' category: #'Distance-Exercise'!
Kilometer class
	instanceVariableNames: ''!

!Kilometer class methodsFor: 'instance creation' stamp: 'C.A. 5/23/2017 11:09:44'!
withAmount: aKilometerAmount
	
	| aNewKilometer |
	
	aNewKilometer := self new.
	
	aNewKilometer initilizeWith: aKilometerAmount.
	
	^aNewKilometer.! !


!classDefinition: #Meter category: #'Distance-Exercise'!
Object subclass: #Meter
	instanceVariableNames: 'magnitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Exercise'!

!Meter methodsFor: 'initialization' stamp: 'C.A. 5/23/2017 11:11:08'!
initializeWith: aMeterAmount
	
	magnitude := aMeterAmount.! !


!Meter methodsFor: 'comparing' stamp: 'C.A. 5/23/2017 13:19:33'!
< aDistance
	
	^magnitude < aDistance magnitudeInMeters! !

!Meter methodsFor: 'comparing' stamp: 'abern 5/23/2017 19:08:19'!
<= aDistance
	
	^(self > aDistance) not! !

!Meter methodsFor: 'comparing' stamp: 'C.A. 5/23/2017 11:47:36'!
= aDistance

	^magnitude =  aDistance magnitudeInMeters.
! !

!Meter methodsFor: 'comparing' stamp: 'abern 5/23/2017 19:09:26'!
> aDistance
	
	^magnitude > aDistance  magnitudeInMeters! !


!Meter methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 13:13:16'!
* aScalar

	^self class withAmount: magnitude * aScalar! !

!Meter methodsFor: 'as yet unclassified' stamp: 'abern 5/23/2017 19:20:57'!
+ aDistance


	^self class withAmount: (magnitude + aDistance magnitudeInMeters)! !

!Meter methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 13:10:58'!
- aDistance
	^self class withAmount: (magnitude - aDistance magnitudeInMeters)! !

!Meter methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 13:14:12'!
/ aScalar

	^self class withAmount: magnitude / aScalar! !


!Meter methodsFor: 'converting' stamp: 'C.A. 5/23/2017 13:17:41'!
magnitudeInKilometers
	
	^magnitude * 0.001! !

!Meter methodsFor: 'converting' stamp: 'C.A. 5/23/2017 12:44:35'!
magnitudeInMeters
	^magnitude! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Meter class' category: #'Distance-Exercise'!
Meter class
	instanceVariableNames: ''!

!Meter class methodsFor: 'instance creation' stamp: 'C.A. 5/23/2017 11:11:39'!
withAmount: aMeterAmount
	
	| aNewMeter |
	
	aNewMeter := self new.
	
	aNewMeter initializeWith: aMeterAmount. 
	
	^aNewMeter! !


!classDefinition: #Milimeter category: #'Distance-Exercise'!
Object subclass: #Milimeter
	instanceVariableNames: 'magnitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Exercise'!

!Milimeter methodsFor: 'Initilization' stamp: 'C.A. 5/23/2017 11:14:43'!
initializeWith: aMilimeterAmount
	
	magnitude := aMilimeterAmount.! !


!Milimeter methodsFor: 'converting' stamp: 'abern 5/23/2017 19:27:39'!
magnitudeInCentimeters
	
	^magnitude * 0.1! !

!Milimeter methodsFor: 'converting' stamp: 'abern 5/23/2017 19:52:02'!
magnitudeInKilometers
	
	^magnitude * 0.000001! !

!Milimeter methodsFor: 'converting' stamp: 'C.A. 5/23/2017 13:03:08'!
magnitudeInMeters
	^magnitude * 0.001! !

!Milimeter methodsFor: 'converting' stamp: 'abern 5/23/2017 19:39:41'!
magnitudeInMilimeters
	
	^magnitude! !


!Milimeter methodsFor: 'as yet unclassified' stamp: 'abern 5/23/2017 19:38:52'!
+ aDistance

	^ self class withAmount: (magnitude + aDistance magnitudeInMilimeters)! !

!Milimeter methodsFor: 'as yet unclassified' stamp: 'abern 5/23/2017 20:06:26'!
- aDistance

	^self class withAmount: (magnitude - aDistance magnitudeInMilimeters)! !


!Milimeter methodsFor: 'comparing' stamp: 'abern 5/23/2017 19:40:39'!
< aDistance

	^ magnitude  < aDistance magnitudeInMilimeters! !

!Milimeter methodsFor: 'comparing' stamp: 'abern 5/23/2017 20:07:38'!
> aDistance

	^magnitude > aDistance magnitudeInMilimeters ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimeter class' category: #'Distance-Exercise'!
Milimeter class
	instanceVariableNames: ''!

!Milimeter class methodsFor: 'instance creation' stamp: 'C.A. 5/23/2017 11:13:40'!
withAmount: aMilimeterAmount
	
	| aNewMilimeter |
	
	aNewMilimeter := self new.
	
	aNewMilimeter initializeWith: aMilimeterAmount .
	
	^aNewMilimeter ! !
