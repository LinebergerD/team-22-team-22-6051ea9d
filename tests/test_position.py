from unittest import TestCase
from levelup.position import Position

class TestPositionInitWithCoordinates(TestCase):
    def test_init(self):
        xCoordinates = 1
        yCoordinates = 5
        testobj = Position(xCoordinates, yCoordinates)
        self.assertEqual(xCoordinates, testobj.x)
        self.assertEqual(yCoordinates, testobj.y)

    def test_equal(self):
        xCoordinates = 1
        yCoordinates = 5
        testobj = Position(xCoordinates, yCoordinates)
        testobj2 = Position(xCoordinates, yCoordinates)
        self.assertTrue(testobj == testobj2)

    def test_notEqual(self):
        xCoordinates = 1
        yCoordinates = 5
        testobj = Position(xCoordinates, yCoordinates)
        testobj2 = Position(xCoordinates, yCoordinates + 1)
        self.assertTrue(testobj != testobj2)
        