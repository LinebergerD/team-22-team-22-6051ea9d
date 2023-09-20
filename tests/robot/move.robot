# *** Settings ***    
# Documentation    I want to move my character.  If they attempt to move past a boundary, the move results in a no change in position.
# Test Template    Move Character
# Library          MoveLibrary.py
*** Test Case ***       StartingX   StartingY   Direction   EndingX EndingY
Move in middle of board 0           0           NORTH       0       1
Move on edge of board   0           0           SOUTH       0       0

*** Keywords ***
Move Character
[Arguments]  ${startingX}       ${StartingY}     ${Direction}       ${endingX}  ${endingY}
Initialize character xposition with     ${StartingX}
Initialize character yposition with     ${StartingY}
Move in direction                       ${direction}
Character xposition should be           ${endingX}
Character yposition should be           ${endingY}