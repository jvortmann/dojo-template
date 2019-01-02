from unittest import TestCase
from src import run


class TestSomething(TestCase):

    def test_something(self):
        result = run()
        self.assertTrue(result)
