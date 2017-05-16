!classDefinition: #GOLTest category: #GOL!
TestCase subclass: #GOLTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GOLTest methodsFor: 'Testing' stamp: 'HAW 5/11/2017 21:14:07'!
test01AliveCellWithLessThanTwoAliveNeighDies

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { 1@1 }  withSize: 3@3.
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'Testing' stamp: 'C.A. 5/14/2017 09:05:30'!
test02AliveCellWithTwoAliveNeighStaysAlive

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { 1@1. 2@0. 1@0. }  withSize: 3@3.
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isAliveAt: 1@1) ! !

!GOLTest methodsFor: 'Testing' stamp: 'C.A. 5/14/2017 09:09:17'!
test03AliveCellWithThreeAliveNeighStaysAlive

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { 1@1. 2@0. 1@0. 1@2. }  withSize: 3@3.
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isAliveAt: 1@1) ! !

!GOLTest methodsFor: 'Testing' stamp: 'HAW 5/11/2017 21:14:25'!
test04AliveCellWithMoreThanThreeAliveNeighDies

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { 1@1. 2@0. 1@0. 1@2. 0@1 } withSize: 3@3.
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'Testing' stamp: 'C.A. 5/14/2017 09:09:37'!
test05DeadCellWithThreeAliveNeighResurects

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { 2@0. 1@0. 0@0 } withSize: 3@3.
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isAliveAt: 1@1) ! !

!GOLTest methodsFor: 'Testing' stamp: 'C.A. 5/14/2017 10:06:40'!
test06CreatingACellWithXCoordinateGreaterThanTheBoardsXCoordinateRaisesAnError

	self 
		should: [ GameOfLife withLiveCells: { 4@1 } withSize: 3@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !

!GOLTest methodsFor: 'Testing' stamp: 'C.A. 5/14/2017 10:06:48'!
test07CreatingACellWithYCoordinateGreaterThanTheBoardsYCoordinateRaisesAnError

	self 
		should: [ GameOfLife withLiveCells: { 1@4 } withSize: 3@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !

!GOLTest methodsFor: 'Testing' stamp: 'C.A. 5/14/2017 10:07:56'!
test08CreatingACellWithXCoordinateBelowCeroRaisesAnError

	self 
		should: [ GameOfLife withLiveCells: { -1@1 } withSize: 3@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !

!GOLTest methodsFor: 'Testing' stamp: 'C.A. 5/14/2017 10:08:27'!
test09CreatingACellWithYCoordinateBelowCeroRaisesAnError

	self 
		should: [ GameOfLife withLiveCells: { 1@-1 } withSize: 3@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !

!GOLTest methodsFor: 'Testing' stamp: 'C.A. 5/14/2017 11:34:40'!
test10GameDoesNotContainMultipleCellsPerBoardPosition

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { 1@1. 1@1. 2@2. 1@1. 2@2. } withSize: 3@3.
	
	self assert: (gameOfLife aliveCells size = 2) ! !

!GOLTest methodsFor: 'Testing' stamp: 'C.A. 5/15/2017 22:21:02'!
test11CellsOutsideOfBoardBoundsCannotBeRevived

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { 2@0. 2@1. 2@2.} withSize: 2@2.
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife aliveCells allSatisfy: [:aCellPosition | gameOfLife isValidCellPosition: aCellPosition])! !


!classDefinition: #GameOfLife category: #GOL!
Object subclass: #GameOfLife
	instanceVariableNames: 'aliveCells boardSize validCellsInBoard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GameOfLife methodsFor: 'private' stamp: 'C.A. 5/14/2017 11:40:16'!
aliveCells
	^aliveCells! !

!GameOfLife methodsFor: 'private' stamp: 'C.A. 5/15/2017 22:26:24'!
deadCells
	
	^validCellsInBoard copyWithoutAll: aliveCells.! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/11/2017 21:11:17'!
hasToResurrect: aCell

	^(self numberOfAliveNeighboursOf: aCell) = 3! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/11/2017 19:57:05'!
hasToSurvive: aCell
	
	| numberOfAliveNeighbours|
	
	numberOfAliveNeighbours := self numberOfAliveNeighboursOf: aCell.
	
	^numberOfAliveNeighbours = 2 or:  [numberOfAliveNeighbours = 3]! !

!GameOfLife methodsFor: 'private' stamp: 'C.A. 5/15/2017 22:21:44'!
initializeWith: aCollectionOfAliveCells withSize: aSize

	boardSize := aSize.
	validCellsInBoard  := Set new.
	0 to: boardSize x do: [ :i |
		0 to: boardSize y do: [ :j |
			validCellsInBoard add: i@j.] ].
	aliveCells := aCollectionOfAliveCells.
	! !

!GameOfLife methodsFor: 'private' stamp: 'C.A. 5/14/2017 09:22:32'!
isAliveAt: aCellPosition
	^aliveCells includes: aCellPosition! !

!GameOfLife methodsFor: 'private' stamp: 'C.A. 5/14/2017 09:22:44'!
isDeadAt: aCellPosition

	^(self isAliveAt: aCellPosition) not! !

!GameOfLife methodsFor: 'private' stamp: 'C.A. 5/15/2017 22:00:24'!
isValidCellPosition: aCell
	^validCellsInBoard includes: aCell.! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/10/2017 10:29:35'!
numberOfAliveNeighboursOf: aCell

	^(aCell eightNeighbors intersection: aliveCells) size! !


!GameOfLife methodsFor: 'accessing' stamp: 'C.A. 5/15/2017 22:19:39'!
nextGeneration
	
	| resurrectedCells |
	
	resurrectedCells := (self deadCells select: [ :aDeadCell | self hasToResurrect: aDeadCell ]) intersection: 
									validCellsInBoard.
		
	aliveCells := (aliveCells select: [ :aCell | self hasToSurvive: aCell ]) union: resurrectedCells.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOfLife class' category: #GOL!
GameOfLife class
	instanceVariableNames: ''!

!GameOfLife class methodsFor: 'instance creation' stamp: 'C.A. 5/14/2017 11:42:03'!
withLiveCells: aCollectionOfAliveCells withSize: aSize 
	
	(aCollectionOfAliveCells allSatisfy: [:aCell |
		(aCell x between: 0 and: aSize x) and: [ aCell y between: 0 and: aSize y]]) ifFalse: [ self error: 'celda fuera de rango' ].
	^self new initializeWith: aCollectionOfAliveCells asSet withSize: aSize ! !
