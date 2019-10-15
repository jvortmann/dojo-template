from unittest import TestCase
from src.statistics import build_statistics


class TestStatistics(TestCase):

    def test_it_find_the_min_values(self):
        input = [0, 1, -1, 5]
        result = build_statistics(input)
        self.assertEqual(result['min'], -1)

    def test_it_find_the_min_values_only_with_positives(self):
        input = [2, 1, 3, 5]
        result = build_statistics(input)
        self.assertEqual(result['min'], 1)

    def test_it_find_the_max_values(self):
        input = [0, 1, -1, 5]
        result = build_statistics(input)
        self.assertEqual(result['max'], 5)

    def test_it_find_the_min_values_only_with_negatives(self):
        input = [-2, -1, -3, -5]
        result = build_statistics(input)
        self.assertEqual(result['max'], -1)

    def test_it_find_sequence_length(self):
        input = [1, 2, 3, 4, 5, 5, 5, 6]
        result = build_statistics(input)
        self.assertEqual(result['length'], 8)

    def test_it_find_average_value(self):
        input = [2, 3, 7]
        result = build_statistics(input)
        self.assertEqual(result['average'], 4)

    def test_it_find_average_float_value(self):
        input = [4, 1]
        result = build_statistics(input)
        self.assertEqual(result['average'], 2.5)

    def test_it_raise_value_error_on_empty_list(self):
        input = []
        with self.assertRaises(ValueError):
            build_statistics(input)

    def test_it_raise_type_error_on_non_list(self):
        input = {}
        with self.assertRaises(TypeError):
            build_statistics(input)

    def test_it_raise_type_error_on_non_numerical_list(self):
        input = ["a", "b"]
        with self.assertRaises(TypeError):
            build_statistics(input)
