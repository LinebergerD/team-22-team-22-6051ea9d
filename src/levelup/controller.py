import logging
from dataclasses import dataclass
from enum import Enum

#TODO: ADD THINGS YOU NEED FOR STATUS
@dataclass
class GameStatus:
    character_name: str = "Character"
    move_count: int = 0
    running: bool = False
    current_position: tuple = (-100, -100)
    def set_character_position(self, xycoordinates:tuple) -> None:
        print("Set character postion state for testing")
        # ToDo: Implement This
class Direction(Enum):
    NORTH = "n"
    SOUTH = "s"
    EAST = "e"
    WEST = "w"

class CharacterNotFoundException(Exception):
    pass

class InvalidMoveException(Exception):
    pass

class GameController:
    status: GameStatus

    def __init__(self):
        self.status = GameStatus()

    def start_game(self):
        pass

    def create_character(self, character_name: str) -> None:
        pass

    def move(self, direction: Direction) -> None:
        pass
