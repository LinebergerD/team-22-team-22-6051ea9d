*** Settings ***    
Documentation  I want to move my character.  If they attempt to move past a boundary, the move results in a no change in position.
Test Template  Move Character
Library        MoveLibrary.py
