from unittest import TestCase
from dojo import cycle_length, max_cycle_length, max_cycle_length_by_user_input


class TestCollatz(TestCase):

    def test_should_cycle_length_be_correct(self):
        result = cycle_length(22)
        self.assertEqual(result, 16)

        result = cycle_length(3)
        self.assertEqual(result, 8)

    def test_should_max_cycle_leght_be_correct(self):
        result = max_cycle_length(1, 10)
        self.assertEqual(result, 20)

        result = max_cycle_length(100, 200)
        self.assertEqual(result, 125)

        result = max_cycle_length(201, 210)
        self.assertEqual(result, 89)

        result = max_cycle_length(900, 1000)
        self.assertEqual(result, 174)

    def test_shold_cycle_length_by_user_input_result_correct_output(self):
        user_input = '1 10'
        correct_output = '1 10 20'

        output = max_cycle_length_by_user_input(user_input)

        self.assertEqual(output, correct_output)
