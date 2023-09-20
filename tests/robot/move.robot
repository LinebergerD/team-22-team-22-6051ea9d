*** Settings ***    
Documentation    I want to move my character.  If they attempt to move past a boundary, the move results in a no change in position.
Test Template    Move Character
Library          MoveLibrary.py

*** Test Case ***       StartingX   StartingY   Direction   MoveCount   EndingX EndingY MoveCount
Move in middle of board 0           0           NORTH   33       0       1  34
SW Corner move S   0           0           SOUTH    22       0       0  23
SW Corner move E   0           0           EAST 18       1       0  19
SW Corner move W   0           0           WEST 0       0       0   0
NW Corner move N   0           9           NORTH    0       0       9   1
NW Corner move S   0           9           SOUTH    0       0       8   1
NW Corner move E   0           9           EAST 0       1       9   1
NW Corner move W   0           9           WEST 0       0       9   1
NE Corner move N   9           9           NORTH 0       9       9   1
NE Corner move S   9           9           SOUTH 0       9       8   1
NE Corner move E   9           9           EAST 0       9       9   1
NE Corner move W   9           9           WEST 0       8       9   1
SE Corner move N   9           0           NORTH 0       9       1   1
SE Corner move S   9           0           SOUTH 0       9       0   1
SE Corner move E   9           0           EAST 0       9       0   1
SE Corner move W   9           0           WEST 0       8       0   1
Middle of board move N   5           5           NORTH 0       5       6   1
Middle of board move S   5           5           SOUTH 0       5       4   1
Middle of board move E   5           5           EAST 0       6       5   1
Middle of board move W   5           5           WEST 0       4       5   1

*** Keywords ***
Move Character
[Arguments]  ${startingX}       ${StartingY}     ${Direction}       ${endingX}  ${endingY}
Initialize character xposition with     ${StartingX}
Initialize character yposition with     ${StartingY}
Move in direction                       ${direction}
Character xposition should be           ${endingX}
Character yposition should be           ${endingY}