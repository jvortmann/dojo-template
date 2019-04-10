from unittest import TestCase
from dojo import divide_coins, divide_coins_by_n


class TestCoinsDivision(TestCase):

    def test_coins_division_should_result_0(self):
        input = [2, 2]
        result = divide_coins(input)
        self.assertEqual(result, 0)

    def test_coins_division_should_result_1(self):
        input = [1, 2, 2]
        result = divide_coins(input)
        self.assertEqual(result, 1)

    def test_2_coins_division_should_result_1(self):
        input = [1, 2, 4, 6]
        result = divide_coins(input)
        self.assertEqual(result, 1)

    def test_coins_division_should_result_10(self):
        input = [20, 30, 50, 10, 60, 100]
        result = divide_coins(input)
        self.assertEqual(result, 10)

    def test_coins_division_should_result_2(self):
        input = [45, 25, 24, 6]
        result = divide_coins(input)
        self.assertEqual(result, 2)

    def test_coins_division_by_3_should_result_0(self):
        input = [3, 3, 3]
        result = divide_coins_by_n(input, 3)
        self.assertEqual(result, 0)

    def test_coins_division_by_4_should_result_0(self):
        input = []
        result = divide_coins_by_n(input, 4)
        self.assertEqual(result, 0)

    def test_coins_division_by_4_should_result_0(self):
        input = []
        result = divide_coins_by_n(input, 4)
        self.assertEqual(result, 0)

    def test_coins_division_by_4_should_result_3(self):
        input = [3, 3, 3]
        result = divide_coins_by_n(input, 4)
        self.assertEqual(result, 3)

    def test_coins_division_by_3_should_result_2(self):
        input = [2, 3, 4]
        result = divide_coins_by_n(input, 3)
        self.assertEqual(result, 2)

    def test_2_coins_division_by_3_should_result_2(self):
        input = [4, 2, 2]
        result = divide_coins_by_n(input, 3)
        self.assertEqual(result, 2)
