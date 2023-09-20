from levelup.controller import GameController
from levelup.controller import Direction

class MoveLibrary:
    start_x: int
    start_y: int

    controller = GameController()


    def initialize_character_xposition_with(self, x_position):
        self.start_x = x_position


    def initialize_character_yposition_with(self, y_position):
        self.start_y = y_position

    def move_in_direction(self, direction):
        self.controller.set_character_position((self.start_x, self.start_y))
        self.controller.move(Direction[direction])
        