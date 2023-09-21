from unittest import TestCase
from levelup.position import Position

class TestPositionInitWithCoordinates(TestCase):
    def test_init(self):
        xCoordinates = 1
        yCoordinates = 5
        testobj = Position(xCoordinates, yCoordinates)
        self.assertIsNotNone(testobj)