*** Settings ***
Documentation     I want to move my character. If they attempt to move past a boundary, the move results in no change in position.
Test Template     Move character
Library           MoveLibrary.py

*** Test Cases ***                  StartingX     StartingY     StartingMoveCount     Direction     EndingX     EndingY     EndingMoveCount
Move in the middle of the board     3             2             1                     NORTH         3           3           2
Move from corner                    0             0             3                     NORTH         0           1           4
Move on the edge of the board       0             0             5                     SOUTH         0           0           6
SW Corner move N                    0             0             6                     NORTH         0           1           7
SW Corner move S                    0             0             7                     SOUTH         0           0           8
SW Corner move E                    0             0             10                    EAST          1           0           11
SW Corner move W                    0             0             3                     WEST          0           0           4
NW Corner move N                    0             9             5                     NORTH         0           9           6
NW Corner move S                    0             9             2                     SOUTH         0           8           3
NW Corner move E                    0             9             5                     EAST          1           9           6
NW Corner move W                    0             9             8                     WEST          0           9           9
NE Corner move N                    9             9             19                    NORTH         9           9           20
NE Corner move S                    9             9             1                     SOUTH         9           8           2
NE Corner move E                    9             9             0                     EAST          9           9           1
NE Corner move W                    9             9             12                    WEST          8           9           13
SE Corner move N                    9             0             29                    NORTH         9           1           30
SE Corner move S                    9             0             9                     SOUTH         9           0           10
SE Corner move E                    9             0             21                    EAST          9           0           22
SE Corner move W                    9             0             4                     WEST          8           0           5
Middle of board move N              5             5             14                    NORTH         5           6           15
Middle of board move S              5             5             17                    SOUTH         5           4           18
Middle of board move E              5             5             43                    EAST          6           5           44
Middle of board move W              5             5             32                    WEST          4           5           33

*** Keywords ***
Move character
    [Arguments]    ${startingX}    ${startingY}    ${startingMoveCount}    ${direction}    ${endingX}    ${endingY}    ${endingMoveCount}
    Initialize character xposition with  ${startingX}
    Initialize character yposition with  ${startingY}
    Initialize character moveCount with  ${startingMoveCount}
    Move in direction                    ${direction}
    Character xposition should be        ${endingX}
    Character yposition should be        ${endingY}
    Character moveCount should be        ${endingMoveCount}