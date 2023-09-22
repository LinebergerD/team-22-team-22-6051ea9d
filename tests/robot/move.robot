*** Settings ***    
Documentation    I want to move my character.  If they attempt to move past a boundary, the move results in a no change in position.
Test Template    Move Character
Library          MoveLibrary.py
*** Test Case ***       StartingX   StartingY   Direction   EndingX EndingY
Move in middle of board 0           0           NORTH       0       1
SW Corner move S   0           0           SOUTH       0       0
SW Corner move E   0           0           EAST       1       0
SW Corner move W   0           0           WEST       0       0
NW Corner move N   0           9           NORTH       0       9
NW Corner move S   0           9           SOUTH       0       8
NW Corner move E   0           9           EAST       1       9
NW Corner move W   0           9           WEST       0       9
NE Corner move N   9           9           NORTH       9       9
NE Corner move S   9           9           SOUTH       9       8
NE Corner move E   9           9           EAST       9       9
NE Corner move W   9           9           WEST       8       9
SE Corner move N   9           0           NORTH       9       1
SE Corner move S   9           0           SOUTH       9       0
SE Corner move E   9           0           EAST       9       0
SE Corner move W   9           0           WEST       8       0
Middle of board move N   5           5           NORTH       5       6
Middle of board move S   5           5           SOUTH       5       4
Middle of board move E   5           5           EAST       6       5
Middle of board move W   5           5           WEST       4       5

*** Keywords ***
Move Character
[Arguments]  ${startingX}       ${StartingY}     ${Direction}       ${endingX}  ${endingY}
Initialize character xposition with     ${StartingX}
Initialize character yposition with     ${StartingY}
Move in direction                       ${direction}
Character xposition should be           ${endingX}
Character yposition should be           ${endingY}