from levelup.position import Position
from typing import Tuple
from levelup.direction import Direction

class Map ():

    starting_position = Position(0,0)
    positions = []
    size: Tuple[int, int] = (10, 10)

    def __init__(self):
        self.create_positions()

    def create_positions(self) -> None:
        temp_pos = []
        for x in range(self.size[0]):
            y_range = []
            for y in range(self.size[1]):
                new_pos = Position(x,y)
                y_range.append(new_pos)
            temp_pos.append(y_range)
        self.positions = temp_pos

    def is_position_valid(self, position :Position):
        if position.x >= 0 and position.x < self.size[0] and position.y >= 0 and position.y < self.size[1]:
            return True
        else:
            return False

    def calculate_new_position(self, current_position: Position, direction: Direction) -> Position:
        if direction == Direction.NORTH:
            new_position = Position(current_position.x, current_position.y + 1)
        elif direction == Direction.SOUTH:
            new_position = Position(current_position.x, current_position.y - 1)
        elif direction == Direction.EAST:
            new_position = Position(current_position.x + 1, current_position.y)
        elif direction == Direction.WEST:
            new_position = Position(current_position.x - 1, current_position.y)
        else:
            pass

        if self.is_position_valid(new_position) == True:
            return new_position
        else:
            return current_position

class Position ():

    x = -100
    y = -100

    def __init__(self, x: int, y: int):
        self.x = x
        self.y = y

    def __eq__(self, obj):
        if self.x == obj.x and self.y == obj.y:
            return True
        else:
            return False


import logging
from typing import Callable
from levelup.controller import GameController, InvalidMoveException
from levelup.direction import Direction

VALID_DIRECTIONS = [x.value for x in Direction]

class GameApp:

    controller: GameController
    starting_pos = (-100,-100)

    def __init__(self):
        self.controller = GameController()

    def prompt(self, menu: str, validation_fn: Callable[[str], bool]) -> str:
        while True:
            response = input(f"\n{menu}\n> ")
            if validation_fn(response):
                break
        return response

    def create_character(self):
        character = self.prompt("Enter character name", lambda x: len(x) > 0)
        self.controller.create_character(character)
        print(f"Welcome, {self.controller.status.character_name}")

    def move_loop(self):
        while True:
            response = self.prompt(
                f"Where would you like to go? {VALID_DIRECTIONS}\n(or ctrl+c to quit)",
                lambda x: x in VALID_DIRECTIONS,
            )
            direction = Direction(response)
            self.controller.move(direction)
            print(f"You moved {direction.name}")
            print(self.controller.status)

    def start(self):
        self.create_character()
        self.controller.start_game()
        self.starting_pos = self.controller.status.current_position
        self.move_loop()

    def quit(self):
        print(f"\n\n{self.controller.status}")
        print(f"{self.controller.status.character_name} started on {self.starting_pos}, ended on {self.controller.status.current_position} and moved {self.controller.status.move_count} times.")
 20 changes: 20 additions & 0 deletions20  
tests/fake_character.py
@@ -0,0 +1,20 @@
from levelup.map import Map
from levelup.character import Character
from levelup.controller import Direction
from levelup.position import Position

class FakeCharacter (Character):

    is_move_called = False
    is_enter_map_called = False
    last_move_direction = None

    def __init__(self, character_name):
        self.current_position = Position(5,5)

    def move(self, direction: Direction) -> None:
        self.is_move_called = True
        self.last_move_direction = direction

    def enter_map(self, map: Map) -> None:
        self.is_enter_map_called = True