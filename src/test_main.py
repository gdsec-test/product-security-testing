import unittest
from .main import sus


class MainTest(unittest.TestCase):
    def test_sus(self):
        self.assertEqual(sus(True), "suspicious")

    def test_not_sus(self):
        self.assertEqual(sus(), "not suspicious")

    def test_something(self):
        self.assertEqual(sus(), "hello")
