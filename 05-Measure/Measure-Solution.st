!classDefinition: #MeasuresTests category: #'Measure-Solution'!
TestCase subclass: #MeasuresTests
	instanceVariableNames: 'meter oneMeter centimeter kilometer oneCentimeter oneKilometer decameter oneDecameter oneMilimeter milimeter celsius oneCelsius twoMeters second minute hour oneHour twoCelsius sixtySeconds oneMinute sixtyMinutes fahrenheit kelvin factory decimeter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/8/2017 17:07:39'!
setUp
	factory := MeasureFactory new.
	
	meter := factory meter.
	decameter := factory decameter.
	kilometer := factory kilometer.
	decimeter := factory decimeter.
	centimeter := factory centimeter.
	milimeter := factory millimeter.
	
	oneMilimeter := Measure withAmount: 1 ofUnit: milimeter.
	oneCentimeter := Measure withAmount: 1 ofUnit: centimeter.
	oneMeter := Measure withAmount: 1 ofUnit: meter.
	twoMeters := Measure withAmount: 2 ofUnit: meter.
	oneDecameter := Measure withAmount: 1 ofUnit: decameter.
	oneKilometer := Measure withAmount: 1 ofUnit: kilometer.
	
	kelvin := CanonicalUnit named: 'kelvin'.
	celsius := NonProportionalDerivedUnit named: 'celsius' withBaseUnit: kelvin 
				convertionToBase: [:aCelsiusAmount | aCelsiusAmount +(27315/100)]
				convertionFromBase: [:aKelvinAmount | aKelvinAmount - (27315/100)].
				
	fahrenheit := NonProportionalDerivedUnit named: 'fahrenheit' withBaseUnit: kelvin 
				convertionToBase: [:aFahrenheitAmount | (5/9) * (aFahrenheitAmount - 32) +(27315/100)]
				convertionFromBase: [:aKelvinAmount | (9/5) * (aKelvinAmount - 273) + 32].
	
	oneCelsius := Measure withAmount: 1 ofUnit: celsius.
	twoCelsius := Measure withAmount: 2 ofUnit: celsius.
	
	
	
	
	second := CanonicalUnit named: 'second'.
	minute := ProportionalDerivedUnit named: 'minute' withBaseUnit: second factor: 60.
	hour := ProportionalDerivedUnit named: 'hour' withBaseUnit: second factor: 3600.
	
	sixtySeconds := 60*second.
	oneMinute := 1 * minute.
	sixtyMinutes := 60 * minute.
	oneHour := Measure withAmount: 1 ofUnit: hour.! !

!MeasuresTests methodsFor: 'testing' stamp: 'abern 6/1/2017 17:46:21'!
test01canCreateUnitNamedMeter

	| aNewUnit |

	aNewUnit := CanonicalUnit named: 'meter'.
	
	self assert: aNewUnit unitName = 'meter'! !

!MeasuresTests methodsFor: 'testing' stamp: 'abern 6/1/2017 20:03:45'!
test02canCreateADistanceOfOneMeters
	
	| oneMeter |

	oneMeter := Measure withAmount: 1 ofUnit: meter.
	
	self assert: oneMeter unit unitName = 'meter'.
	self assert: oneMeter amount = 1.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/2/2017 10:12:14'!
test03oneMeterEqualsOneMeter
	
	| oneMeter anotherMeter |

	oneMeter := Measure withAmount: 1 ofUnit: meter.

	anotherMeter := Measure withAmount: 1 ofUnit: meter.
	
	self assert: oneMeter = anotherMeter.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/3/2017 11:30:54'!
test04oneMeterEqualsOneHundredCentimeters
	
	| oneHundredCentimeters aCentimeterUnit |

	oneMeter := Measure withAmount: 1 ofUnit: meter.

	aCentimeterUnit := ProportionalDerivedUnit named: 'centimeter' withBaseUnit: meter factor: 1/100.
	
	oneHundredCentimeters  := Measure withAmount: 100 ofUnit: aCentimeterUnit. 
	
	self assert: oneMeter = oneHundredCentimeters.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/2/2017 10:08:14'!
test05oneKilometersEqualsOneThousandKilometers
	
	| oneThousandMeters |

	oneKilometer := Measure withAmount: 1 ofUnit: kilometer.

	oneThousandMeters  := Measure withAmount: 1000 ofUnit: meter. 
	
	self assert: oneKilometer = oneThousandMeters.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/3/2017 11:31:03'!
test06creatingADerivedUnitUsingADerivedUnitAsCanonicalRaisesAnException	
	
	self 
		should: [ProportionalDerivedUnit named: 'milimeter' withBaseUnit: kilometer factor: (1/1000000)]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'must use a canonical unit as base unit' ].! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/2/2017 10:07:52'!
test07oneMeterPlusOneMeterEqualsTwoMeters
	
	| twoMeters |

	twoMeters := Measure withAmount: 2 ofUnit: meter.

	self assert: oneMeter  + oneMeter = twoMeters.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/2/2017 10:07:43'!
test08oneMeterPlusOneDecameterEqualsElevenMeters
	
	| minusNineMeters |

	minusNineMeters := Measure withAmount: -9 ofUnit: meter.
	
	self assert: oneMeter  - oneDecameter = minusNineMeters.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/2/2017 10:07:33'!
test09oneKilometerIsGreaterThanOneMeter
	
	
	self assert: oneKilometer > oneMeter.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/2/2017 10:07:22'!
test10oneMilimeterIsLessThanOneMeter
	
	
	self assert: oneMilimeter < oneMeter.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/3/2017 11:10:36'!
test11canCompareDiferentUnitsOfTheSameTypeWithLessOrEqual
	
	
	self assert: oneMilimeter <= oneMilimeter.
	self assert: oneMilimeter <= oneMeter.
	! !

!MeasuresTests methodsFor: 'testing' stamp: 'abern 6/6/2017 21:47:07'!
test12canCompareDiferentUnitsOfTheSameTypeWithGreaterOrEqual
	
	self assert: oneKilometer >= oneKilometer.
	self assert: oneKilometer >= oneMeter.
	! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/3/2017 00:40:29'!
test13canConvertFromMetersToOtherDistanceUnits
	
	| oneHundredCentimeters oneThousandMeters |
	
	oneHundredCentimeters := Measure  withAmount: 100 ofUnit: centimeter.
	oneThousandMeters := Measure  withAmount: 1000 ofUnit: meter.
	
	self assert: (oneMeter convertTo: centimeter) = oneHundredCentimeters.
	self assert: (oneThousandMeters convertTo: kilometer) = oneKilometer.
	! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/3/2017 01:03:02'!
test14canConvertFromKilometersToMeters
	
	| oneThousandMeters |
	
	oneThousandMeters := Measure  withAmount: 1000 ofUnit: meter.

	self assert: (oneThousandMeters convertTo: kilometer) = oneKilometer.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/3/2017 00:56:44'!
test15canConvertFromKilometersToCentimeters
	
	| oneHundredThousandCentimeters |
	
	oneHundredThousandCentimeters := Measure withAmount: 100000 ofUnit: centimeter.
	
	self assert: (oneKilometer convertTo: centimeter) unit = centimeter.
	self assert: (oneKilometer convertTo: centimeter) = oneHundredThousandCentimeters.
	self assert: (oneKilometer convertTo: centimeter) = oneKilometer.
	
! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/3/2017 11:24:01'!
test16oneMeterDoesNotEqualOneCelsius

	| celsiusUnit oneCelsius |
	
	celsiusUnit := CanonicalUnit named: 'celsius'.
	
	oneCelsius := Measure withAmount: 1 ofUnit: celsiusUnit.
	
	self deny: oneCelsius = oneMeter.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/3/2017 12:30:43'!
test17cannotConvertDistanceToTemperature

	self 
		should: [oneCelsius convertTo: meter]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Can not convert units derived from diferent base units' ].! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/3/2017 12:38:24'!
test18MultiplyingMeterByMeterEqualsMeterSquared

	self assert: meter * meter = meter squared

	! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/7/2017 00:24:25'!
test19MultiplyingMeterByMeterByMeterEqualsMeterCubed

	self assert: meter * meter * meter = (meter raisedTo: 3).
	self assert: meter * meter squared = (meter raisedTo: 3).
	! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/7/2017 00:24:28'!
test20MeterAtPower4EqualsMeterSquaredSquared

	self assert: meter squared squared = (meter raisedTo: 4)
	! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/3/2017 22:05:56'!
test21MeterSquaredMultipliedByCentimeterSquaredEqualsMeterXCentimeterSquared

	self assert: (meter squared * centimeter squared) = (meter * centimeter) squared.
	! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/4/2017 15:50:13'!
test22OneMultipliedByMeterEqualsOneMeter

	self assert: 1 * meter = oneMeter.
	self assert: meter * 1 = oneMeter.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/4/2017 18:32:38'!
test23OneMeterMultipliedByTwoEqualsTwoMeters

	self assert: oneMeter * 2 = twoMeters.
	self assert: 2 * oneMeter = twoMeters.
	! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/5/2017 18:52:29'!
test24MeterSquaredDividedByMeterEqualsMeter

	self assert: (meter squared) / meter = meter.

! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/5/2017 20:46:55'!
test25OneMeterMultipliedByOneMeterEqualsOneSquaredMeter

	self assert: oneMeter * oneMeter = (1 * (meter squared)).
	self assert: oneMeter * oneMeter = ((meter squared) * 1).

! !

!MeasuresTests methodsFor: 'testing' stamp: 'abern 6/6/2017 18:04:48'!
test26OneMeterEqualsOneHundredCentimeters

	self assert: oneMeter = (100 * centimeter).
	self assert: oneMeter = (centimeter * 100).
	self assert: 100 * oneCentimeter  = oneMeter .
	self assert: 1 / oneCentimeter  = (100 / oneMeter ).

! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/7/2017 00:24:32'!
test27OneDividedByOneMeterEqualsOneMeterAtPowerMinusOne
	
	self assert: 1 / oneMeter = (oneMeter raisedTo: -1).
! !

!MeasuresTests methodsFor: 'testing' stamp: 'abern 6/6/2017 18:25:46'!
test28OneKilometerDividedByOneMeterEquals1000
	
	self assert: (oneKilometer / oneMeter ) = 1000.
! !

!MeasuresTests methodsFor: 'testing' stamp: 'abern 6/6/2017 18:26:18'!
test29OneKilometerSquaredEquals1000000SquaredMeters
	
	self assert: 1000000 * meter  squared = oneKilometer squared ! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/7/2017 10:43:36'!
test30AnyUnitMinusSelfEqualsCero
	
	self assert: oneMeter - oneMeter = 0.
	self assert: oneHour - oneHour = (oneMeter - oneMeter)! !

!MeasuresTests methodsFor: 'testing' stamp: 'abern 6/6/2017 20:32:52'!
test31OneMeterPlusOneCelsiusMultipliedByMeterEqualsOneSquaredMeterPlusOneMeterCelsius
	
	self assert: (oneMeter + oneCelsius) * oneMeter = (oneMeter squared + (oneCelsius * oneMeter)).
	self assert: oneMeter * (oneMeter + oneCelsius) = (oneMeter squared + (oneMeter * oneCelsius))! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/7/2017 00:37:41'!
test32OneCelsiusPlusOneMeterMultipliedByTwoEquals2CelsiusPlusTwoMeters

	self assert: (oneCelsius + oneMeter) * 2 = (twoMeters + twoCelsius).
	self assert: 2 * (oneCelsius + oneMeter) = (twoMeters + twoCelsius).
	self assert: (oneCelsius + oneMeter) / (1/2) = (twoMeters + twoCelsius).! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/7/2017 11:30:01'!
test33TwoCelsiusPlusTwoMetersDividedByTwoEqualsOneCelsiusPlusOneMeter

	self assert: oneCelsius + oneMeter = (twoMeters + twoCelsius / 2).! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/7/2017 12:56:09'!
test34canAddMoreMeasuresToAMeasureBag

	self assert:  oneHour + oneMeter + oneMeter + oneMeter = (3 * oneMeter + oneHour ).
	self assert:  oneHour + oneMeter + oneMeter + oneHour = (twoMeters + (2 * oneHour)).! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/8/2017 14:16:40'!
test35substractingAllElementsFromAMeasurementBagEqualsZero

	self assert:  oneHour + oneMeter - oneMeter - oneHour = 0.
	self assert:  oneHour + oneMeter - (oneMeter + oneHour) = 0! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/7/2017 14:43:21'!
test36SubstractingOneElementFromAMeasureBagWithTwoMeasuresEqualsTheRemainingMeasure

	self assert: oneMeter + oneHour - oneMeter = oneHour.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/7/2017 16:05:20'!
test37canMultiplyTwoMeasurementBagsCorrectly

	self assert:  oneMeter + oneHour * (oneMeter + oneHour) = (oneMeter squared + (meter * hour * 2) + oneHour squared)! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/8/2017 10:44:18'!
test38TenCelsiusEqualsFiftyFahrenheit

	self assert:  10 * celsius = (50 * fahrenheit).
	! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/8/2017 10:44:53'!
test39ZeroCelsiusEquals32Fahrenheit

	self assert:  0 * celsius = (32 * fahrenheit).
	! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/8/2017 10:45:49'!
test39ZeroKelvinEqualsZeroMeters

	self assert:  0 * kelvin = (0 * meter).
	self assert:  0 * kelvin = 0.
	! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/8/2017 15:40:18'!
test40canCorrectlySimplifyComposedNonProportionalUnits
	
	self assert: (second / celsius) * celsius = second.
	self assert: 10 * (second / celsius) * oneCelsius = (10 * second).
	self assert: 10 * (celsius squared / second /celsius ) = (10 * (celsius /second )).
	
	! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/8/2017 16:16:12'!
test41NegatingAUnitRaisesAnError
	
	self should: [meter negated] raise: Error  description: 'cannot negate a unit'! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/8/2017 16:23:22'!
test42ConvertingAUnitWithMultipleTypesOfUnitsTodiferentUnitsTypesRaisesAnError
	
	self should: [oneCelsius / (1*second) convertTo: centimeter ]
			raise:  Error - MessageNotUnderstood 
			description: 'Can not convert units derived from diferent base units'.
			
	self should: [oneCelsius / (1*second) convertTo: (centimeter squared) ]
			raise:  Error - MessageNotUnderstood 
			description: 'Can not convert units derived from diferent base units'.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/8/2017 16:31:09'!
test43aMeasureBagWith10MetersPlus1FarhenheitNegatedEqualsAMeasureBagWithMinus10MetersMinusOneFarhenheit

	self assert: (10 * meter + (1 * fahrenheit)) negated = ((-10 * meter) - (1 * fahrenheit))! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/8/2017 16:42:06'!
test44ComparingMeasureBagsWithMeasuresRaisesAnError

	self should: [(oneMeter + (10* kelvin))> (10*second)]
			raise:  Error - MessageNotUnderstood 
			description: 'Can not compare diferrent types of units'.
			
	self should: [(oneMeter + (10* kelvin))< (10*second)]
			raise:  Error - MessageNotUnderstood 
			description: 'Can not compare diferrent types of units'.! !

!MeasuresTests methodsFor: 'testing' stamp: 'C.A. 6/8/2017 18:28:14'!
test45canCreateAnIntervalOfUnits

	self assert: (oneMeter to: twoMeters) size = 2	.
	self assert: ((oneMeter to: twoMeters) at: 1) = oneMeter .
	self assert: ((oneMeter to: twoMeters) at: 2) = twoMeters .
		! !


!classDefinition: #Measure category: #'Measure-Solution'!
Object subclass: #Measure
	instanceVariableNames: 'unit amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!Measure methodsFor: 'initialization' stamp: 'abern 6/1/2017 17:25:14'!
initializeWithUnit: aUnit amount: anAmount

	unit := aUnit.
	amount := anAmount.
	! !


!Measure methodsFor: 'accessing' stamp: 'abern 6/1/2017 17:25:49'!
amount
	
	^amount! !

!Measure methodsFor: 'accessing' stamp: 'abern 6/1/2017 17:25:32'!
unit
	
	^unit! !


!Measure methodsFor: 'comparing' stamp: 'C.A. 6/7/2017 13:48:11'!
< anotherMeasure 
	
	^self convertAmountAsBase < anotherMeasure convertAmountAsBase ! !

!Measure methodsFor: 'comparing' stamp: 'abern 6/1/2017 20:28:03'!
<= anotherMeasure 
	
	^(self > anotherMeasure) not! !

!Measure methodsFor: 'comparing' stamp: 'C.A. 6/7/2017 13:48:15'!
> anotherMeasure 
	
	^self convertAmountAsBase > anotherMeasure convertAmountAsBase.! !

!Measure methodsFor: 'comparing' stamp: 'abern 6/1/2017 20:29:34'!
>= anotherMeasure 
	
	^(self < anotherMeasure) not! !


!Measure methodsFor: 'arithmetic' stamp: 'abern 6/6/2017 20:52:30'!
* anotherMeasure

	(anotherMeasure isKindOf: MeasurementBag) ifTrue:[^anotherMeasure multiplyByMeasure: self].

	^Measure withAmount: (self amount * anotherMeasure amount)
	 				ofUnit: (self unit * anotherMeasure unit)! !

!Measure methodsFor: 'arithmetic' stamp: 'C.A. 6/8/2017 13:37:48'!
+ anotherMeasure
	
	(self class = anotherMeasure class) ifTrue:[
		(self unit isComparableWith: anotherMeasure unit) ifFalse: [^MeasurementBag withMeasure: self and: anotherMeasure].
	
		^self class withAmount: (self convertAmountAsBase + anotherMeasure convertAmountAsBase) ofUnit: unit convertToBase.
	].

	(anotherMeasure isKindOf: MeasurementBag) ifFalse: [^self error: 'can only add measures or MeasureBags'].! !

!Measure methodsFor: 'arithmetic' stamp: 'C.A. 6/8/2017 16:37:47'!
- anotherMeasure 
	
	(anotherMeasure isNumber) ifTrue: [^MeasurementBag withMeasure: self and: anotherMeasure negated ].
	
	^anotherMeasure negated + self.! !

!Measure methodsFor: 'arithmetic' stamp: 'abern 6/6/2017 17:22:46'!
/ anotherMeasure

	| dividedUnits numeratorFactor denominatorFactor convertionFactor dividedUnitsInCanonical |
	
	dividedUnits := self unit / anotherMeasure unit.
	
	numeratorFactor :=  self unit convertAmountToBaseUnit: 1.
	denominatorFactor := anotherMeasure unit convertAmountToBaseUnit: 1.
	
	convertionFactor := (numeratorFactor ) / (denominatorFactor).
	
	dividedUnitsInCanonical := dividedUnits convertFactorsToBase.
									
	^Measure withAmount: amount * convertionFactor 
				 ofUnit: dividedUnitsInCanonical ! !

!Measure methodsFor: 'arithmetic' stamp: 'C.A. 6/6/2017 14:48:38'!
divideNumberBySelf: aNumber

	^Measure withAmount: (aNumber / amount)  ofUnit: unit inverse! !

!Measure methodsFor: 'arithmetic' stamp: 'C.A. 6/7/2017 14:06:43'!
negated

	^self * -1! !

!Measure methodsFor: 'arithmetic' stamp: 'C.A. 6/7/2017 00:25:57'!
raisedTo: aIntegerAmount

	| invertedAmount |
	
	invertedAmount := amount raisedToInteger: aIntegerAmount.

	^Measure withAmount: invertedAmount ofUnit: self unit inverse .! !

!Measure methodsFor: 'arithmetic' stamp: 'abern 6/6/2017 18:25:19'!
squared
	
	^Measure withAmount: amount squared ofUnit: unit squared ! !


!Measure methodsFor: 'converting' stamp: 'C.A. 6/7/2017 13:47:11'!
convertAmountAsBase
	
	^unit convertAmountToBaseUnit: amount.! !

!Measure methodsFor: 'converting' stamp: 'abern 6/6/2017 20:25:57'!
convertFactorsToBase
	
	^self unit convertFactorsToBase.! !

!Measure methodsFor: 'converting' stamp: 'C.A. 6/7/2017 13:48:18'!
convertTo: anotherUnit 
	
	| convertedAmount |
	(anotherUnit isKindOf: UnitBehavior) ifFalse: [^self error: 'Colaborator must be a Unit']. 
	(self unit convertToBase = anotherUnit convertToBase) ifFalse: [^self error: 'Can not convert units derived from diferent base units'].
	
	convertedAmount := self convertAmountAsBase / (anotherUnit convertAmountToBaseUnit: 1).
	
	^Measure withAmount: convertedAmount ofUnit: anotherUnit! !

!Measure methodsFor: 'converting' stamp: 'C.A. 6/7/2017 13:50:25'!
convertedToBaseMeasure

	^Measure withAmount: (self convertAmountAsBase )
				 ofUnit: unit convertToBase .! !


!Measure methodsFor: 'equality' stamp: 'C.A. 6/6/2017 14:59:04'!
= anotherObject
	
	| anotherMeasureAmount |
	
	self == anotherObject ifTrue: [ ^ true ].
	self class == anotherObject class ifFalse: [ ^false ].
	
	(anotherObject unit isComparableWith: self unit) ifFalse: [^false].
	
	anotherMeasureAmount := anotherObject amount.
	^(unit convertAmountToBaseUnit: amount) = (anotherObject unit convertAmountToBaseUnit: anotherMeasureAmount).! !

!Measure methodsFor: 'equality' stamp: 'C.A. 6/2/2017 10:05:06'!
hash
	
	^amount hash + unit hash! !


!Measure methodsFor: 'evaluating' stamp: 'C.A. 6/6/2017 13:02:53'!
isZero
	
	^amount = 0.! !


!Measure methodsFor: 'message handling' stamp: 'abern 6/6/2017 21:39:27'!
adaptToInteger: rcvr andSend: selector
	"If no method has been provided for adapting an object to a Integer,
	then it may be adequate to simply adapt it to a number."
	(selector = #/) ifTrue: [^self divideNumberBySelf: rcvr ].
	^ self perform: selector with: rcvr! !


!Measure methodsFor: 'intervals' stamp: 'C.A. 6/8/2017 18:12:45'!
to: aMeasure 
	
	self to:aMeasure by: 1*self unit! !

!Measure methodsFor: 'intervals' stamp: 'C.A. 6/8/2017 18:31:21'!
to: aMeasure by: aStepMeasure

	|  aCollectionWithIntervalValues aStepAmount aStepUnit currentAmount |

	(aMeasure unit isComparableWith: self unit)ifFalse:[^self error: 'must use same type of unit'].
	(aStepMeasure unit isComparableWith: self unit)ifFalse:[^self error: 'must use same type of unit'].
	
	aCollectionWithIntervalValues := OrderedCollection new.
	
	aStepAmount := aStepMeasure convertedToBaseMeasure amount.
	aStepUnit := aStepMeasure convertedToBaseMeasure unit.
	currentAmount := self convertedToBaseMeasure amount.
	
	aCollectionWithIntervalValues addLast: self convertedToBaseMeasure.
	
	[currentAmount < aMeasure convertedToBaseMeasure amount] whileTrue: [
		aCollectionWithIntervalValues addLast: (Measure withAmount: currentAmount ofUnit: aStepUnit).
		currentAmount := currentAmount + aStepAmount.
	].
	
	^Interval newFrom: aCollectionWithIntervalValues asArray .! !

!Measure methodsFor: 'intervals' stamp: 'C.A. 6/8/2017 18:14:43'!
to: aMeasure by: aStepMeasure do: aBlockClousure
	
	^(self to: aMeasure by: aStepMeasure) do: aBlockClousure! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Measure class' category: #'Measure-Solution'!
Measure class
	instanceVariableNames: ''!

!Measure class methodsFor: 'instance creation' stamp: 'C.A. 6/7/2017 10:40:34'!
withAmount: anAmount ofUnit: aUnit
	
	| aNewMeasure |
	
	(aUnit class = NullUnit) ifTrue: [^anAmount].
	(aUnit convertAmountToBaseUnit: anAmount) isZero ifTrue:[^0].
	
	aNewMeasure := self new.
	
	aNewMeasure initializeWithUnit: aUnit amount: anAmount.
	
	^aNewMeasure ! !


!classDefinition: #MeasureFactory category: #'Measure-Solution'!
Object subclass: #MeasureFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!MeasureFactory methodsFor: 'temperature measures' stamp: 'C.A. 6/8/2017 17:35:57'!
oneCelsius

	^1 * self celsius ! !

!MeasureFactory methodsFor: 'temperature measures' stamp: 'C.A. 6/8/2017 17:36:35'!
thirtyTwoFahrenheits

	^32 * self fahrenheit ! !

!MeasureFactory methodsFor: 'temperature measures' stamp: 'C.A. 6/8/2017 17:36:49'!
twoCelsius

	^2 * self celsius ! !

!MeasureFactory methodsFor: 'temperature measures' stamp: 'C.A. 6/8/2017 17:36:58'!
zeroCelsius

	^0 * self celsius ! !

!MeasureFactory methodsFor: 'temperature measures' stamp: 'C.A. 6/8/2017 17:37:12'!
zeroKelivin

	^0 * self kelvin ! !


!MeasureFactory methodsFor: 'temperature units' stamp: 'C.A. 6/8/2017 17:35:01'!
celsius 

	^NonProportionalDerivedUnit named: 'celsius' withBaseUnit: self kelvin 
				convertionToBase: [:aCelsiusAmount | aCelsiusAmount +(27315/100)]
				convertionFromBase: [:aKelvinAmount | aKelvinAmount - (27315/100)].! !

!MeasureFactory methodsFor: 'temperature units' stamp: 'C.A. 6/8/2017 17:35:20'!
fahrenheit

	^NonProportionalDerivedUnit named: 'fahrenheit' withBaseUnit: self kelvin 
				convertionToBase: [:aFahrenheitAmount | (5/9) * (aFahrenheitAmount - 32) +(27315/100)]
				convertionFromBase: [:aKelvinAmount | (9/5) * (aKelvinAmount - 273) + 32].! !

!MeasureFactory methodsFor: 'temperature units' stamp: 'C.A. 6/8/2017 17:34:36'!
kelvin

	^CanonicalUnit named: 'kelvin'.! !


!MeasureFactory methodsFor: 'distance measures' stamp: 'C.A. 6/8/2017 17:33:48'!
ZeroMeters

	^ 0 * self meter! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'C.A. 6/8/2017 17:30:29'!
minusOneMeter

	^(-1 * self meter)! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'C.A. 6/8/2017 17:31:10'!
oneCentimeter

	^ 1 * self centimeter! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'C.A. 6/8/2017 17:32:49'!
oneHundredCentimeters

	^ 100 * self centimeter! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'C.A. 6/8/2017 17:33:04'!
oneMeter

	^ 1 * self meter! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'C.A. 6/8/2017 17:33:18'!
twoHundredCentimeters

	^ 200 * self centimeter! !

!MeasureFactory methodsFor: 'distance measures' stamp: 'C.A. 6/8/2017 17:33:36'!
twoMeters

	^ 2 * self meter! !


!MeasureFactory methodsFor: 'distance unit creation' stamp: 'C.A. 6/8/2017 17:29:21'!
centimeter

	^ProportionalDerivedUnit named: 'centimeter' withBaseUnit: self meter factor: 1/100.! !

!MeasureFactory methodsFor: 'distance unit creation' stamp: 'C.A. 6/8/2017 17:06:14'!
decameter

	^ProportionalDerivedUnit named: 'decameter' withBaseUnit: self meter factor: 10.! !

!MeasureFactory methodsFor: 'distance unit creation' stamp: 'C.A. 6/8/2017 17:05:26'!
decimeter

	^ProportionalDerivedUnit named: 'decimeter' withBaseUnit: self meter factor: 1/10.! !

!MeasureFactory methodsFor: 'distance unit creation' stamp: 'C.A. 6/8/2017 17:06:49'!
hectometer

	^ProportionalDerivedUnit named: 'hectometer' withBaseUnit: self meter factor: 100.! !

!MeasureFactory methodsFor: 'distance unit creation' stamp: 'C.A. 6/8/2017 17:07:07'!
kilometer
	^ProportionalDerivedUnit named: 'kilometer' withBaseUnit: self meter factor: 1000.! !

!MeasureFactory methodsFor: 'distance unit creation' stamp: 'C.A. 6/8/2017 17:00:29'!
meter

	^CanonicalUnit named: 'meter'.! !

!MeasureFactory methodsFor: 'distance unit creation' stamp: 'C.A. 6/8/2017 17:04:56'!
millimeter

	^ProportionalDerivedUnit named: 'millimeter' withBaseUnit: self meter factor: 1/1000.! !


!MeasureFactory methodsFor: 'operating' stamp: 'C.A. 6/8/2017 18:03:42'!
finalSpeedStartingAt: aStartingSpeed accelerating: anAccelerationAmount during: aTimeLapse

	^ aStartingSpeed + (anAccelerationAmount  * aTimeLapse)
	
	
	"^ (aStartingSpeed *(self meter / self second)) + ((anAccelerationAmount * (self meter /(self second squared))  * (aTimeLapse * (self second))))"! !


!MeasureFactory methodsFor: 'compound measures' stamp: 'C.A. 6/8/2017 17:45:27'!
eightCubicMeters

	^8 * (self meter raisedTo: 3)! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'C.A. 6/8/2017 17:46:47'!
fourSquaredMeters

	^4 * (self meter squared)! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'C.A. 6/8/2017 17:52:06'!
oneHundredTwentyOneMetersPerSecond

	^121 * (self meter / self second)! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'C.A. 6/8/2017 17:52:48'!
oneMeterPerSecond

	^1* (self meter / self second)! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'C.A. 6/8/2017 17:53:14'!
oneSquaredMeter

	^1* (self meter squared)! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'C.A. 6/8/2017 17:53:30'!
oneSquaredSecond

	^1* (self second squared)! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'C.A. 6/8/2017 17:54:38'!
twoMetersBySecond

	^2* (self meter / self second)! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'C.A. 6/8/2017 17:55:06'!
twoMetersPerSquaredSecond

	^2* (self meter / (self second squared))! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'C.A. 6/8/2017 17:55:35'!
twoMetersTimesSecond

	^2* (self meter * self second squared)! !


!MeasureFactory methodsFor: 'time measures' stamp: 'C.A. 6/8/2017 17:40:18'!
oneDay

	^1 * self day! !

!MeasureFactory methodsFor: 'time measures' stamp: 'C.A. 6/8/2017 17:40:28'!
oneHour

	^1 * self hour! !

!MeasureFactory methodsFor: 'time measures' stamp: 'C.A. 6/8/2017 17:40:39'!
oneMinute

	^1 * self minute! !

!MeasureFactory methodsFor: 'time measures' stamp: 'C.A. 6/8/2017 17:40:49'!
oneSecond

	^1 * self second 
	! !

!MeasureFactory methodsFor: 'time measures' stamp: 'C.A. 6/8/2017 17:41:11'!
sixtyMinutes

	^60 * self minute
	! !

!MeasureFactory methodsFor: 'time measures' stamp: 'C.A. 6/8/2017 17:41:26'!
sixtyOneSeconds

	^61 * self second
	! !

!MeasureFactory methodsFor: 'time measures' stamp: 'C.A. 6/8/2017 17:41:36'!
sixtySeconds

	^60 * self second
	! !

!MeasureFactory methodsFor: 'time measures' stamp: 'C.A. 6/8/2017 17:41:55'!
twentyFourHours

	^24 * self hour
	! !

!MeasureFactory methodsFor: 'time measures' stamp: 'C.A. 6/8/2017 17:42:08'!
twoSeconds

	^2 * self second 
	! !

!MeasureFactory methodsFor: 'time measures' stamp: 'C.A. 6/8/2017 17:42:20'!
zeroSeconds

	^0 * self second 
	! !


!MeasureFactory methodsFor: 'time units' stamp: 'C.A. 6/8/2017 17:39:37'!
day

	^ProportionalDerivedUnit named: 'day' withBaseUnit: self second factor: 86400.
! !

!MeasureFactory methodsFor: 'time units' stamp: 'C.A. 6/8/2017 17:39:05'!
hour

	^ProportionalDerivedUnit named: 'hour' withBaseUnit: self second factor: 3600.
! !

!MeasureFactory methodsFor: 'time units' stamp: 'C.A. 6/8/2017 17:38:31'!
minute

	^ProportionalDerivedUnit named: 'minute' withBaseUnit: self second factor: 60.! !

!MeasureFactory methodsFor: 'time units' stamp: 'C.A. 6/8/2017 17:38:08'!
second

	^CanonicalUnit named: 'second'.! !


!classDefinition: #MeasurementBag category: #'Measure-Solution'!
Object subclass: #MeasurementBag
	instanceVariableNames: 'measurements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!MeasurementBag methodsFor: 'adding' stamp: 'C.A. 6/8/2017 13:44:12'!
+ aMeasure 
	
	(aMeasure class = self class) ifTrue:[^aMeasure addMeasurementsBag: self].
	
	((aMeasure isKindOf: Measure)or:[aMeasure isKindOf: Number]) 
				ifFalse:[^self error: 'can only add measures or MeasureBags'].
	
	^self addMeasure: aMeasure.! !

!MeasurementBag methodsFor: 'adding' stamp: 'C.A. 6/8/2017 14:13:29'!
addMeasure: aMeasure
	
	| resultMeasureBag |
	
	resultMeasureBag := MeasurementBag new.
	
	measurements do: [:aContainedMeasure | 
							(aContainedMeasure unit isComparableWith: aMeasure unit)
							ifTrue: [resultMeasureBag addIfNotZero: aContainedMeasure + aMeasure ] 
							ifFalse: [resultMeasureBag add: aContainedMeasure]
						].
	(resultMeasureBag containedMeasures size = 0) ifTrue:[^0].					
	(resultMeasureBag containedMeasures size = 1)	
					ifTrue:[^resultMeasureBag containedMeasures anyOne]
					ifFalse:[^resultMeasureBag]
	
	 ! !

!MeasurementBag methodsFor: 'adding' stamp: 'C.A. 6/8/2017 14:38:44'!
addMeasurementsBag: aMeasurementBag 
	
	| MeasurementsBagWithAddedMeasures |
	
	MeasurementsBagWithAddedMeasures := aMeasurementBag.
	
	measurements do: [:aMeasure | 
		MeasurementsBagWithAddedMeasures := MeasurementsBagWithAddedMeasures + aMeasure].
	
	^MeasurementsBagWithAddedMeasures 
	
	
	
	 ! !


!MeasurementBag methodsFor: 'initializing' stamp: 'C.A. 6/8/2017 14:47:07'!
initialize

	measurements := Bag new.! !

!MeasurementBag methodsFor: 'initializing' stamp: 'C.A. 6/8/2017 14:47:11'!
initializeWith: aMeasure and: anotherMeasure
	
	measurements := Bag new.
	measurements add: aMeasure.
	measurements add: anotherMeasure! !


!MeasurementBag methodsFor: 'associating' stamp: 'C.A. 6/8/2017 14:21:27'!
* aMeasure 
	
	| aNewMeasuremntBag |
	
	(aMeasure class = self class) ifTrue: [^aMeasure multiplyWithMeasurementBag: self].
	
	aNewMeasuremntBag := MeasurementBag new.
	
	measurements do: [:aContainedMeasurement | 
					aNewMeasuremntBag add: aContainedMeasurement * aMeasure].
				
	^aNewMeasuremntBag ! !


!MeasurementBag methodsFor: 'equality' stamp: 'C.A. 6/7/2017 13:51:01'!
= anObject

	(self == anObject) ifTrue: [^true].
	(self class = anObject class) ifFalse: [^false].
	
	^self convertedToBase containedMeasures = anObject convertedToBase containedMeasures.! !

!MeasurementBag methodsFor: 'equality' stamp: 'abern 6/6/2017 20:06:43'!
hash
	
	^measurements hash! !


!MeasurementBag methodsFor: 'accessing' stamp: 'abern 6/6/2017 20:10:52'!
containedMeasures
	
	^measurements ! !


!MeasurementBag methodsFor: 'arithmetic' stamp: 'C.A. 6/7/2017 14:12:08'!
- aMeasure 
	
	^self + aMeasure negated! !

!MeasurementBag methodsFor: 'arithmetic' stamp: 'C.A. 6/7/2017 00:29:29'!
/ aMeasure
	
	^self * (aMeasure raisedTo: -1)! !

!MeasurementBag methodsFor: 'arithmetic' stamp: 'abern 6/6/2017 21:39:41'!
adaptToNumber: aSmallInteger andSend: aSymbol 
	"If no method has been provided for adapting an object to a Integer,
	then it may be adequate to simply adapt it to a number."
	(aSymbol = #/) ifTrue: [^self divideNumberBySelf: aSmallInteger ].
	^ self perform: aSymbol with: aSmallInteger ! !

!MeasurementBag methodsFor: 'arithmetic' stamp: 'C.A. 6/7/2017 10:50:06'!
divideNumberBySelf: aDivisor

	^self raisedTo: -1 * aDivisor 
	
	! !

!MeasurementBag methodsFor: 'arithmetic' stamp: 'abern 6/6/2017 20:49:20'!
multiplyByMeasure: aMeasure 
	
	^self * aMeasure! !

!MeasurementBag methodsFor: 'arithmetic' stamp: 'C.A. 6/8/2017 13:14:45'!
multiplyWithMeasurementBag: aMeasurementBag 
	
	| resultMeasureBag orderedMeasures |
	
	orderedMeasures := measurements asOrderedCollection.
	
	resultMeasureBag := (orderedMeasures at:1) * aMeasurementBag.
	orderedMeasures removeFirst.
	
	orderedMeasures do:[:aMeasure | 
							resultMeasureBag addMeasurementsBag: (aMeasurementBag * aMeasure )].
	
	^resultMeasureBag ! !

!MeasurementBag methodsFor: 'arithmetic' stamp: 'C.A. 6/7/2017 14:33:57'!
negated
	
	^self * -1! !


!MeasurementBag methodsFor: 'converting' stamp: 'C.A. 6/7/2017 13:43:26'!
convertedToBase
	
	| baseMeasurementsBag |
	
	baseMeasurementsBag := MeasurementBag new.
	
	measurements do: [:aMeasure | 
							baseMeasurementsBag addMeasure: aMeasure convertedToBaseMeasure].
	
	^baseMeasurementsBag ! !


!MeasurementBag methodsFor: 'private' stamp: 'C.A. 6/8/2017 14:11:18'!
add: aMeasure 
	
	measurements add:aMeasure ! !

!MeasurementBag methodsFor: 'private' stamp: 'C.A. 6/8/2017 14:15:15'!
addIfNotZero: aMeasure 
	
	(aMeasure amount isZero) ifFalse: [self add: aMeasure].! !


!MeasurementBag methodsFor: 'comparing' stamp: 'C.A. 6/8/2017 16:42:35'!
< aMeasure 
	
	self error: 'Can not compare diferrent types of units'.! !

!MeasurementBag methodsFor: 'comparing' stamp: 'C.A. 6/8/2017 16:43:08'!
<= aMeasure 
	
	^(self > aMeasure)not! !

!MeasurementBag methodsFor: 'comparing' stamp: 'C.A. 6/8/2017 16:41:48'!
> aMeasure 
	
	^self error: 'Can not compare diferrent types of units'! !

!MeasurementBag methodsFor: 'comparing' stamp: 'C.A. 6/8/2017 16:43:57'!
>= aMeasure 
	
	^(self < aMeasure )not! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MeasurementBag class' category: #'Measure-Solution'!
MeasurementBag class
	instanceVariableNames: ''!

!MeasurementBag class methodsFor: 'instance creation' stamp: 'abern 6/6/2017 19:51:09'!
withMeasure: aMeasure and: anotherMeasure
	
	| aNewMeasureBag |
	
	aNewMeasureBag := self new.
	
	aNewMeasureBag initializeWith: aMeasure and: anotherMeasure.
	
	^aNewMeasureBag.! !


!classDefinition: #UnitBehavior category: #'Measure-Solution'!
Object subclass: #UnitBehavior
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!UnitBehavior methodsFor: 'accessing' stamp: 'C.A. 6/6/2017 12:56:01'!
convertAmountToBaseUnit: anAmount
	
	| convertionFactor |
	
	convertionFactor := 1.
	
	self factors do: [:aUnit | convertionFactor := convertionFactor * (aUnit convertAmountToBaseUnit: 1)].
	
	^convertionFactor * anAmount.! !

!UnitBehavior methodsFor: 'accessing' stamp: 'C.A. 6/4/2017 15:45:12'!
unit
	^self! !

!UnitBehavior methodsFor: 'accessing' stamp: 'abern 6/1/2017 18:17:17'!
unitName
	
	^self subclassResponsibility ! !


!UnitBehavior methodsFor: 'converting' stamp: 'C.A. 6/5/2017 09:47:35'!
asMultipliedUnit
	
	^MultipliedUnit newWith: self.! !

!UnitBehavior methodsFor: 'converting' stamp: 'C.A. 6/8/2017 10:34:38'!
convertToBase
	
	^self subclassResponsibility ! !

!UnitBehavior methodsFor: 'converting' stamp: 'C.A. 6/5/2017 20:10:20'!
factors
	
	| unitAsFactors |
	
	unitAsFactors := Bag new.
	unitAsFactors add: self.
	^unitAsFactors ! !

!UnitBehavior methodsFor: 'converting' stamp: 'C.A. 6/4/2017 20:07:05'!
inverse
	
	^DividedUnit newWithNumerator: NullUnit new denominator: self.! !

!UnitBehavior methodsFor: 'converting' stamp: 'C.A. 6/7/2017 00:24:39'!
squared
	
	^self raisedTo: 2.! !


!UnitBehavior methodsFor: 'arithmetic' stamp: 'C.A. 6/4/2017 15:44:14'!
* aMultiplier
	
	(aMultiplier isKindOf: UnitBehavior) ifTrue: [^aMultiplier multiplyWithUnit: self].
	
	^Measure withAmount: aMultiplier amount ofUnit: (aMultiplier unit * self unit)! !

!UnitBehavior methodsFor: 'arithmetic' stamp: 'C.A. 6/8/2017 15:19:36'!
/ aDivisor
	
	(aDivisor isKindOf: UnitBehavior) ifTrue: [^DividedUnit newWithNumerator: self denominator: aDivisor].
	
	((aDivisor isKindOf: Measure) or:[aDivisor isNumber]) ifFalse:[self error: 'can only divide measures or units'].
	
	^DividedUnit newWithNumerator: self denominator: aDivisor.! !

!UnitBehavior methodsFor: 'arithmetic' stamp: 'C.A. 6/4/2017 21:40:56'!
adaptToInteger: rcvr andSend: selector
	"If no method has been provided for adapting an object to a Integer,
	then it may be adequate to simply adapt it to a number."
	^ self perform: selector with: rcvr! !

!UnitBehavior methodsFor: 'arithmetic' stamp: 'C.A. 6/8/2017 15:37:05'!
divideBySelfWithUnits: aDividedUnit 
	
	^DividedUnit newWithNumerator: aDividedUnit numerator
						denominator: aDividedUnit denominator * self! !

!UnitBehavior methodsFor: 'arithmetic' stamp: 'C.A. 6/8/2017 13:01:53'!
multiplyWithDividedUnit: aDividedUnit

	^DividedUnit newWithNumerator: self * (aDividedUnit numerator) 
					denominator: (aDividedUnit denominator) ! !

!UnitBehavior methodsFor: 'arithmetic' stamp: 'C.A. 6/8/2017 16:07:34'!
negated
	^self error: 'cannot negate a unit'! !

!UnitBehavior methodsFor: 'arithmetic' stamp: 'C.A. 6/7/2017 00:21:26'!
raisedTo: aIntegerAmount
	
	| newUnitPowerByAmount power |
	
	(aIntegerAmount isZero) ifTrue: [^NullUnit new].
	(aIntegerAmount = 1) ifTrue: [^self].
	
	newUnitPowerByAmount := self.
	power := aIntegerAmount abs.
	
	(2 to: power) do: [ :count |
				newUnitPowerByAmount := newUnitPowerByAmount*self].
	
	(aIntegerAmount < 0) ifTrue: [^newUnitPowerByAmount inverse] .
	
	^newUnitPowerByAmount.! !


!UnitBehavior methodsFor: 'private' stamp: 'C.A. 6/4/2017 14:51:13'!
multiplyByMeasure: aMeasure

	^Measure withAmount: aMeasure amount ofUnit: (self*aMeasure unit)! !

!UnitBehavior methodsFor: 'private' stamp: 'C.A. 6/3/2017 22:42:05'!
multiplyWithBagOfUnits: aMultipliedUnit 
	
	| multipliedFactors |
	
	multipliedFactors := aMultipliedUnit factors.
	multipliedFactors add: self.
	
	^MultipliedUnit newWithUnits: multipliedFactors.! !

!UnitBehavior methodsFor: 'private' stamp: 'C.A. 6/6/2017 14:23:01'!
multiplyWithUnit: aUnit

	^MultipliedUnit newMultiplicationOfUnit: self byUnit: aUnit.! !


!UnitBehavior methodsFor: 'evaluating' stamp: 'C.A. 6/5/2017 20:33:41'!
isZero
	
	^false! !


!UnitBehavior methodsFor: 'comparing' stamp: 'abern 6/6/2017 18:58:31'!
isComparableWith: aUnit
	
	^self convertToBase = aUnit convertToBase.! !


!UnitBehavior methodsFor: 'equality' stamp: 'C.A. 6/8/2017 17:27:23'!
= anObject

	(self == anObject ) ifTrue:[^true].
	(self class = anObject class) ifFalse: [^false].
	
	^(self unitName = anObject unitName )
	
	! !

!UnitBehavior methodsFor: 'equality' stamp: 'C.A. 6/8/2017 17:14:22'!
hash

	^name hash! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnitBehavior class' category: #'Measure-Solution'!
UnitBehavior class
	instanceVariableNames: ''!

!UnitBehavior class methodsFor: 'accessing' stamp: 'C.A. 6/3/2017 10:51:43'!
named: aUnitName

	^self subclassResponsibility ! !


!classDefinition: #CanonicalUnit category: #'Measure-Solution'!
UnitBehavior subclass: #CanonicalUnit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!CanonicalUnit methodsFor: 'initialization' stamp: 'C.A. 6/3/2017 20:21:03'!
initializeWithName: aUnitName
	
	name := aUnitName.! !


!CanonicalUnit methodsFor: 'accessing' stamp: 'C.A. 6/3/2017 20:21:43'!
convertAmountToBaseUnit: anAmount
	
	^anAmount ! !

!CanonicalUnit methodsFor: 'accessing' stamp: 'abern 6/6/2017 19:02:19'!
convertToBase
	
	^self! !

!CanonicalUnit methodsFor: 'accessing' stamp: 'C.A. 6/3/2017 20:21:52'!
unitName
	
	^name! !


!CanonicalUnit methodsFor: 'as yet unclassified' stamp: 'abern 6/6/2017 18:44:39'!
hasAbsoluteZero
	
	^true! !


!CanonicalUnit methodsFor: 'converting' stamp: 'C.A. 6/8/2017 15:08:26'!
convertFactorsToBase
	
	| asBagOfFactors |
	
	asBagOfFactors := Bag new.
	asBagOfFactors add: self.
	^asBagOfFactors ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CanonicalUnit class' category: #'Measure-Solution'!
CanonicalUnit class
	instanceVariableNames: ''!

!CanonicalUnit class methodsFor: 'instance creation' stamp: 'C.A. 6/3/2017 20:37:02'!
named: aUnitName

	| aNewUnit |
	
	aNewUnit := self new.
	
	aNewUnit initializeWithName: aUnitName.
	
	^aNewUnit ! !


!classDefinition: #DividedUnit category: #'Measure-Solution'!
UnitBehavior subclass: #DividedUnit
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!DividedUnit methodsFor: 'initialization' stamp: 'C.A. 6/4/2017 20:09:21'!
initializeWithNumerator: aUnitorUnits denominator: anotherUnitOrUnits 
	
	numerator := aUnitorUnits.
	denominator := anotherUnitOrUnits.! !


!DividedUnit methodsFor: 'arithmetic' stamp: 'C.A. 6/8/2017 12:44:44'!
* aMultiplier
	
	(aMultiplier isKindOf: UnitBehavior) ifTrue: [^aMultiplier multiplyWithDividedUnit: self].
	
	(aMultiplier isNumber) ifTrue: [^Measure withAmount: aMultiplier amount ofUnit: (aMultiplier unit * self unit)].
	
	^self error: 'Invalid arithmetic operation'! !

!DividedUnit methodsFor: 'arithmetic' stamp: 'C.A. 6/8/2017 15:34:04'!
/ aDivisor

	(aDivisor isKindOf: UnitBehavior) ifTrue: [^aDivisor divideBySelfWithUnits: self.].
	
	(aDivisor isNumber) ifTrue: [^Measure withAmount: (aDivisor amount raisedTo: -1)
												ofUnit: (aDivisor unit inverse * self unit)].
	
	^self error: 'Invalid arithmetic operation' 
	
! !

!DividedUnit methodsFor: 'arithmetic' stamp: 'C.A. 6/8/2017 15:20:57'!
inverse
	
	^DividedUnit newWithNumerator: self denominator
					denominator: self numerator ! !

!DividedUnit methodsFor: 'arithmetic' stamp: 'C.A. 6/6/2017 14:25:57'!
multiplyByMeasure: aMeasure

	^self notYetImplemented ! !

!DividedUnit methodsFor: 'arithmetic' stamp: 'C.A. 6/6/2017 14:32:22'!
multiplyWithUnit: aUnit

	| newNumerator |

	newNumerator := numerator * aUnit.
	
	^DividedUnit newWithNumerator: newNumerator denominator: denominator ! !


!DividedUnit methodsFor: 'converting' stamp: 'abern 6/6/2017 18:20:59'!
convertAmountToBaseUnit: anAmount
	
	| convertionFactor |
	
	convertionFactor := 1.
	numerator factors do: [:aUnit | convertionFactor := convertionFactor  * (aUnit convertAmountToBaseUnit: 1)].
	denominator factors do: [:aUnit | convertionFactor := convertionFactor  / (aUnit convertAmountToBaseUnit: 1)].
	
	^anAmount * convertionFactor 
	
	
	
	! !

!DividedUnit methodsFor: 'converting' stamp: 'abern 6/6/2017 17:26:08'!
convertFactorsToBase
	
	^DividedUnit newWithNumerator: numerator convertToBase 
					 denominator: denominator convertToBase ! !


!DividedUnit methodsFor: 'comparing' stamp: 'C.A. 6/8/2017 15:04:37'!
compareWithDividedUnit: aDividedUnit 
	
	^(self numerator convertFactorsToBase = aDividedUnit numerator convertFactorsToBase) 
		and:[self denominator convertFactorsToBase = aDividedUnit denominator convertFactorsToBase]! !

!DividedUnit methodsFor: 'comparing' stamp: 'C.A. 6/6/2017 15:01:07'!
isComparableWith: aUnit
	
	^aUnit compareWithDividedUnit: self! !


!DividedUnit methodsFor: 'equality' stamp: 'C.A. 6/6/2017 14:36:26'!
= anotherObject

	self == anotherObject ifTrue: [ ^ true ].
	(anotherObject isKindOf: DividedUnit) ifFalse: [^false].
	
	^(numerator = anotherObject numerator) and: [denominator = anotherObject denominator].
	
	! !

!DividedUnit methodsFor: 'equality' stamp: 'C.A. 6/6/2017 14:37:29'!
hash

	^denominator hash + numerator hash.! !


!DividedUnit methodsFor: 'accessing' stamp: 'C.A. 6/6/2017 14:38:37'!
denominator
	
	^denominator ! !

!DividedUnit methodsFor: 'accessing' stamp: 'C.A. 6/6/2017 14:38:18'!
numerator
	
	^numerator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DividedUnit class' category: #'Measure-Solution'!
DividedUnit class
	instanceVariableNames: ''!

!DividedUnit class methodsFor: 'instance creation' stamp: 'C.A. 6/6/2017 14:16:34'!
newWithNumerator: aUnitOrUnits denominator: anotherUnitOrUnits
	
	| aNewDividedUnit numeratorFactors denominatorFactors simplifiedNumerator simplifiedDenominator |
	
	(aUnitOrUnits isKindOf: UnitBehavior) ifFalse: [^self error: 'numerator must be a unit'].
	(anotherUnitOrUnits isKindOf: UnitBehavior) ifFalse: [^self error: 'denominator must be a unit'].
	
	numeratorFactors := aUnitOrUnits asMultipliedUnit factors select: [:aUnit | aUnit class ~= NullUnit].
	denominatorFactors := anotherUnitOrUnits asMultipliedUnit factors select: [:aUnit | aUnit class ~= NullUnit].
	
	simplifiedNumerator := numeratorFactors.
	simplifiedDenominator := Bag new.
	
	denominatorFactors do: [:aUnit | simplifiedNumerator remove: aUnit ifAbsent: [simplifiedDenominator add:aUnit]].
	
	(simplifiedNumerator isEmpty) ifTrue: [simplifiedNumerator add: NullUnit new].
	(simplifiedDenominator isEmpty) ifTrue: [^MultipliedUnit newWithUnits: numeratorFactors].
	
	aNewDividedUnit := self new.
	aNewDividedUnit initializeWithNumerator: (MultipliedUnit newWithUnits: simplifiedNumerator) 
								denominator: (MultipliedUnit newWithUnits: simplifiedDenominator).
	^aNewDividedUnit.
	
	! !


!classDefinition: #MultipliedUnit category: #'Measure-Solution'!
UnitBehavior subclass: #MultipliedUnit
	instanceVariableNames: 'factors'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!MultipliedUnit methodsFor: 'initialization' stamp: 'C.A. 6/3/2017 15:59:22'!
initializeWith: aBagOfUnits
	
	factors := aBagOfUnits.! !

!MultipliedUnit methodsFor: 'initialization' stamp: 'C.A. 6/5/2017 09:51:19'!
initializeWithUnit: aUnit 

	factors := Bag new.
	factors add: aUnit.! !

!MultipliedUnit methodsFor: 'initialization' stamp: 'C.A. 6/3/2017 18:34:23'!
initializeWithUnits: aCollectionOfUnits

	
	factors := Bag new.
	factors addAll: aCollectionOfUnits.! !


!MultipliedUnit methodsFor: 'arithmetic' stamp: 'C.A. 6/5/2017 20:50:07'!
* aMultiplier
	
	(aMultiplier isKindOf: UnitBehavior) ifTrue: [^aMultiplier multiplyWithBagOfUnits: self.].
	
	(aMultiplier isNumber) ifTrue: [^Measure withAmount: aMultiplier amount ofUnit: (aMultiplier unit * self unit)].
	
	^self error: 'Invalid arithmetic operation'
	
! !

!MultipliedUnit methodsFor: 'arithmetic' stamp: 'C.A. 6/4/2017 14:36:57'!
multiplyWithBagOfUnits: aMultipliedUnit 
	
	| newMultipliedFactors|
	
	newMultipliedFactors := factors.
	newMultipliedFactors addAll: aMultipliedUnit factors.
	
	^MultipliedUnit newWithUnits: newMultipliedFactors ! !

!MultipliedUnit methodsFor: 'arithmetic' stamp: 'C.A. 6/8/2017 14:30:19'!
multiplyWithUnit: aUnit

	| aNewMultipliedUnit factorsWithAddedUnit |
	
	factorsWithAddedUnit := factors.
	factorsWithAddedUnit  add: aUnit .
	
	aNewMultipliedUnit := MultipliedUnit newWithUnits: factorsWithAddedUnit.
	
	^aNewMultipliedUnit.! !

!MultipliedUnit methodsFor: 'arithmetic' stamp: 'C.A. 6/7/2017 00:25:41'!
raisedTo: aIntegerAmount
	
	| newFactors newMultipliedUnit power |
	
	(aIntegerAmount isZero) ifTrue: [^NullUnit new].
	(aIntegerAmount = 1) ifTrue: [^self].
	
	newFactors := Bag new.
	power := aIntegerAmount abs.
	newFactors addAll: factors.
	(2 to: power) do: [ :count |
				newFactors addAll: factors].
	
	newMultipliedUnit := MultipliedUnit newWithUnits: newFactors.
	(aIntegerAmount > 0) ifFalse: [^newMultipliedUnit inverse] .
	
	^newMultipliedUnit.! !

!MultipliedUnit methodsFor: 'arithmetic' stamp: 'C.A. 6/7/2017 00:24:35'!
squared
	
	^self raisedTo: 2! !


!MultipliedUnit methodsFor: 'converting' stamp: 'C.A. 6/5/2017 17:38:28'!
asMultipliedUnit
	
	^self.! !

!MultipliedUnit methodsFor: 'converting' stamp: 'abern 6/6/2017 18:58:39'!
convertFactorsToBase
	
	| convertedFactors |
	
	convertedFactors := Bag new.
	
	factors do: [:aUnit | convertedFactors add: (aUnit convertToBase)].
	
	^convertedFactors ! !

!MultipliedUnit methodsFor: 'converting' stamp: 'abern 6/6/2017 17:04:05'!
convertToBase

	^MultipliedUnit newWithUnits: self convertFactorsToBase.! !


!MultipliedUnit methodsFor: 'accessing' stamp: 'C.A. 6/3/2017 17:55:44'!
factors

	^factors! !


!MultipliedUnit methodsFor: 'equality' stamp: 'C.A. 6/5/2017 20:08:49'!
= anotherObject

	self == anotherObject ifTrue: [ ^ true ].
	(anotherObject isKindOf: UnitBehavior) ifFalse: [^false] 
	ifTrue: [^self factors = anotherObject  factors].
	
	! !

!MultipliedUnit methodsFor: 'equality' stamp: 'C.A. 6/3/2017 17:57:03'!
hash

	^factors hash.! !


!MultipliedUnit methodsFor: 'comparing' stamp: 'C.A. 6/8/2017 15:29:17'!
compareWithDividedUnit: aDividedUnit 
	
	^false! !

!MultipliedUnit methodsFor: 'comparing' stamp: 'C.A. 6/5/2017 22:32:14'!
isComparableWith: aMultipliedUnit 
	
	^self convertFactorsToBase = aMultipliedUnit convertFactorsToBase.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MultipliedUnit class' category: #'Measure-Solution'!
MultipliedUnit class
	instanceVariableNames: ''!

!MultipliedUnit class methodsFor: 'instance creation' stamp: 'C.A. 6/3/2017 15:57:19'!
newMultiplicationOfUnit: aUnit byUnit: anotherUnit 
	
	| aNewCompoundUnit aBagOfUnits |
	
	aNewCompoundUnit := self new.
	
	aBagOfUnits := Bag new.
	aBagOfUnits add: aUnit.
	aBagOfUnits add: anotherUnit.
	
	aNewCompoundUnit initializeWith: aBagOfUnits.
	
	^aNewCompoundUnit.! !

!MultipliedUnit class methodsFor: 'instance creation' stamp: 'C.A. 6/5/2017 09:50:07'!
newWith: aUnit 
	
	| aNewMultipliedUnit |
	
	aNewMultipliedUnit := self new.
	
	aNewMultipliedUnit initializeWithUnit: aUnit.
	
	^aNewMultipliedUnit.! !

!MultipliedUnit class methodsFor: 'instance creation' stamp: 'C.A. 6/8/2017 15:01:20'!
newWithUnits: aCollectionOfUnits
	
	| aNewMultipliedUnit |
	
"	(aCollectionOfUnits size = 1 and: [aCollectionOfUnits includes: (NullUnit new)]) ifTrue: [^NullUnit new] ."
	(aCollectionOfUnits size = 1) ifTrue:[^aCollectionOfUnits anyOne].
	
	aNewMultipliedUnit := self new.
	
	aNewMultipliedUnit initializeWithUnits: aCollectionOfUnits.
	
	^aNewMultipliedUnit.! !


!classDefinition: #NonProportionalDerivedUnit category: #'Measure-Solution'!
UnitBehavior subclass: #NonProportionalDerivedUnit
	instanceVariableNames: 'baseUnit convertionFromBaseFormula convertionToBaseFormula'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!NonProportionalDerivedUnit methodsFor: 'initialization' stamp: 'C.A. 6/8/2017 10:26:42'!
initializeWithName: aUnitName baseUnit: aCanonicalUnit convertionToBase: aToBaseConvertionClosure convertionFromBase: aFromBaseConvertionClosure

	name := aUnitName.
	baseUnit := aCanonicalUnit.
	convertionFromBaseFormula := aFromBaseConvertionClosure.
	convertionToBaseFormula := aToBaseConvertionClosure.! !


!NonProportionalDerivedUnit methodsFor: 'accessing' stamp: 'C.A. 6/8/2017 10:27:01'!
convertAmountToBaseUnit: anAmount
	
	^convertionToBaseFormula value: anAmount! !

!NonProportionalDerivedUnit methodsFor: 'accessing' stamp: 'C.A. 6/8/2017 10:27:15'!
unitName
	
	^name! !


!NonProportionalDerivedUnit methodsFor: 'converting' stamp: 'C.A. 6/8/2017 15:38:09'!
convertFactorsToBase
	
	| asBagOfFactors |
	
	asBagOfFactors := Bag new.
	asBagOfFactors add: baseUnit.
	^asBagOfFactors ! !

!NonProportionalDerivedUnit methodsFor: 'converting' stamp: 'C.A. 6/8/2017 10:35:18'!
convertToBase
	
	^baseUnit ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonProportionalDerivedUnit class' category: #'Measure-Solution'!
NonProportionalDerivedUnit class
	instanceVariableNames: ''!

!NonProportionalDerivedUnit class methodsFor: 'instance creation' stamp: 'C.A. 6/8/2017 10:29:01'!
named: aUnitName withBaseUnit: aCanonicalUnit convertionToBase: aToBaseAmountClosure convertionFromBase: aFromBaseAmountClosure
	
	| aNewNoNProportionalUnit |
	
	aNewNoNProportionalUnit := self new.
	
	aNewNoNProportionalUnit initializeWithName: aUnitName baseUnit: aCanonicalUnit 
								convertionToBase: aToBaseAmountClosure 
								convertionFromBase: aFromBaseAmountClosure.
								
	^aNewNoNProportionalUnit ! !


!classDefinition: #NullUnit category: #'Measure-Solution'!
UnitBehavior subclass: #NullUnit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!NullUnit methodsFor: 'arithmetic' stamp: 'C.A. 6/4/2017 15:48:10'!
* aMultiplier
	
	^aMultiplier! !


!NullUnit methodsFor: 'private' stamp: 'C.A. 6/5/2017 20:11:25'!
multiplyWithBagOfUnits: aMultipliedUnit 
	
	^aMultipliedUnit! !

!NullUnit methodsFor: 'private' stamp: 'C.A. 6/4/2017 22:09:15'!
multiplyWithUnit: aUnit

	^aUnit ! !


!NullUnit methodsFor: 'converting' stamp: 'abern 6/6/2017 17:50:13'!
convertFactorsToBase
	
	| asBagOfFactors |
	
	asBagOfFactors := Bag new.
	asBagOfFactors add: self.
	^asBagOfFactors ! !

!NullUnit methodsFor: 'converting' stamp: 'abern 6/6/2017 19:03:18'!
convertToBase
	
	^self! !

!NullUnit methodsFor: 'converting' stamp: 'C.A. 6/5/2017 20:12:00'!
inverse
	
	^self! !


!NullUnit methodsFor: 'accessing' stamp: 'C.A. 6/6/2017 13:06:39'!
convertAmountToBaseUnit: anAmount
	
	^anAmount ! !


!NullUnit methodsFor: 'equality' stamp: 'abern 6/6/2017 16:58:36'!
= anotherObject

	self == anotherObject ifTrue: [ ^ true ].
	^anotherObject class = self class.
	! !

!NullUnit methodsFor: 'equality' stamp: 'abern 6/6/2017 16:58:54'!
hash

	^0 hash.! !


!classDefinition: #ProportionalDerivedUnit category: #'Measure-Solution'!
UnitBehavior subclass: #ProportionalDerivedUnit
	instanceVariableNames: 'baseUnit factor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!ProportionalDerivedUnit methodsFor: 'initialization' stamp: 'C.A. 6/3/2017 22:09:33'!
initializeWithName: aUnitName baseUnit: aCanonicalUnit factor: aConvertionFactor
	
	name := aUnitName .
	baseUnit :=aCanonicalUnit.
	factor := aConvertionFactor.! !


!ProportionalDerivedUnit methodsFor: 'accessing' stamp: 'C.A. 6/3/2017 22:10:47'!
convertAmountToBaseUnit: anAmount
	
	^anAmount * factor ! !

!ProportionalDerivedUnit methodsFor: 'accessing' stamp: 'C.A. 6/3/2017 22:10:57'!
unitName
	
	^name! !


!ProportionalDerivedUnit methodsFor: 'converting' stamp: 'C.A. 6/8/2017 15:07:38'!
convertFactorsToBase
	
	| asBagOfFactors |
	
	asBagOfFactors := Bag new.
	asBagOfFactors add: baseUnit.
	^asBagOfFactors ! !

!ProportionalDerivedUnit methodsFor: 'converting' stamp: 'abern 6/6/2017 19:03:40'!
convertToBase
	
	^baseUnit ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ProportionalDerivedUnit class' category: #'Measure-Solution'!
ProportionalDerivedUnit class
	instanceVariableNames: ''!

!ProportionalDerivedUnit class methodsFor: 'instance creation' stamp: 'C.A. 6/3/2017 22:11:07'!
named: aUnitName withBaseUnit: aCanonicalUnit factor: aConvertionFactor

	| aNewDerivedUnit |
	
	(aCanonicalUnit class == CanonicalUnit) ifFalse: [^self error: 'must use a canonical unit as base unit']. 
	aNewDerivedUnit := self new.
	
	aNewDerivedUnit initializeWithName: aUnitName baseUnit: aCanonicalUnit factor: aConvertionFactor.
	
	^aNewDerivedUnit.! !
