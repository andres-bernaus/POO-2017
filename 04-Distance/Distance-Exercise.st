!classDefinition: #DistanceTests category: #'Distance-Exercise'!
TestCase subclass: #DistanceTests
	instanceVariableNames: 'oneMeter twoMeters halfAMeter oneKilometer oneHoundredCentimeters oneThousandMilimeters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Exercise'!

!DistanceTests methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 12:43:27'!
setUp

	oneMeter := Distance inMeters: 1.
	
	twoMeters := Distance inMeters: 2.

	halfAMeter := Distance inMeters: 0.5.
	
	oneKilometer := Distance inKilometers: 1.

	oneHoundredCentimeters := Distance inCentimeters: 100.
	
	oneThousandMilimeters := Distance inMilimeters: 1000.! !

!DistanceTests methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 09:40:56'!
test01OneMeterEqualsOneMeter

	| aMeter |
	
	aMeter := Distance inMeters: 1.

	self assert: oneMeter = aMeter.! !

!DistanceTests methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 09:42:04'!
test02OneMeterDoesNotEqualTwoMeters

	self assert: oneMeter ~= twoMeters.! !

!DistanceTests methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 11:31:33'!
test03OneMeterPlusOneMeterEqualsTwoMeters

	self assert: (oneMeter + oneMeter )  = twoMeters ! !

!DistanceTests methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 11:39:01'!
test04OneMeterEqualsOneHoundredCentimeters

	self assert: oneMeter = oneHoundredCentimeters ! !

!DistanceTests methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 12:45:09'!
test05SubstractingOneHoundredCentimetersFromTwoMetersEqualsAThousandMilimeters

	self assert: (twoMeters - oneHoundredCentimeters ) = oneThousandMilimeters ! !

!DistanceTests methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 12:46:06'!
test06twoMetersEqualsOneMeterMultipliedByTwo

	self assert: (oneMeter * 2) = twoMeters ! !

!DistanceTests methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 12:47:28'!
test07OneMeterDividedByTwoEqualsalfAMeter

	self assert: (oneMeter / 2) = halfAMeter ! !

!DistanceTests methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 12:48:38'!
test08OneKilometerIsGreaterThanOneMeter

	self assert: oneKilometer > oneMeter ! !

!DistanceTests methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 12:49:26'!
test09OneMeterIsLessThanTwoMeters

	self assert: oneMeter < twoMeters ! !

!DistanceTests methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 12:50:39'!
test10OneKilometerIsGreaterEqualThanOneMeter

	self assert: oneKilometer >= oneMeter ! !

!DistanceTests methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 12:52:01'!
test11OneMeterIsLessOrEqualThanTwoMeters

	self assert: oneMeter <= twoMeters ! !


!classDefinition: #Centimeter category: #'Distance-Exercise'!
Object subclass: #Centimeter
	instanceVariableNames: 'magnitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Exercise'!

!Centimeter methodsFor: 'Initialization' stamp: 'C.A. 5/23/2017 11:44:05'!
initilizeWith: aCentimeterAmount
	
	magnitude := aCentimeterAmount ! !


!Centimeter methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 11:44:27'!
magnitude
	^magnitude ! !


!Centimeter methodsFor: 'converting' stamp: 'C.A. 5/23/2017 12:40:31'!
magnitudeInMeters
	^magnitude * 0.01! !

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

!Meter methodsFor: 'comparing' stamp: 'C.A. 5/23/2017 13:22:04'!
<= aDistance
	
	^(self > aDistance) not! !

!Meter methodsFor: 'comparing' stamp: 'C.A. 5/23/2017 11:47:36'!
= aDistance

	^magnitude =  aDistance magnitudeInMeters.
! !

!Meter methodsFor: 'comparing' stamp: 'C.A. 5/23/2017 13:22:58'!
> aDistance
	
	^magnitude > aDistance  magnitudeInMeters! !


!Meter methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 13:13:16'!
* aScalar

	^self class withAmount: magnitude * aScalar! !

!Meter methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 11:37:24'!
+ aMeter 


	^self class withAmount: (magnitude + aMeter magnitude)! !

!Meter methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 13:10:58'!
- aDistance
	^self class withAmount: (magnitude - aDistance magnitudeInMeters)! !

!Meter methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 13:14:12'!
/ aScalar

	^self class withAmount: magnitude / aScalar! !

!Meter methodsFor: 'as yet unclassified' stamp: 'C.A. 5/23/2017 11:27:53'!
magnitude
	^magnitude! !


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


!Milimeter methodsFor: 'converting' stamp: 'C.A. 5/23/2017 13:03:08'!
magnitudeInMeters
	^magnitude * 0.001! !

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
