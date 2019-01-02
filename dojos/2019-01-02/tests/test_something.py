from unittest import TestCase
from src import dot_product


class TestDotProduct(TestCase):

    def test_dot_product(self):
        result = dot_product([1, 2], [1, 2])
        self.assertEqual(5, result)

        result = dot_product([2, 2], [2, 2])
        self.assertEqual(8, result)

    def test_should_raise_value_error_when_a_longer_than_b(self):
        with self.assertRaises(ValueError) as error:
            dot_product([1], [1, 2])
        self.assertEqual(str(error.exception), 'length of arrays mismatch')

    def test_should_raise_value_error_when_b_longer_than_a(self):
        with self.assertRaises(ValueError) as error:
            dot_product([1, 2], [1])
        self.assertEqual(str(error.exception), 'length of arrays mismatch')

    def test_empty_vectors(self):
        with self.assertRaises(ValueError) as error:
            dot_product([], [])
        self.assertEqual(str(error.exception), 'arrays can not be empty')

    def test_should_raise_type_error_when_arrays_contain_non_numbers(self):
        with self.assertRaises(TypeError) as error:
            dot_product(['a'], ['b'])
        self.assertEqual(str(error.exception), "can't multiply sequence by non-int of type 'str'")

    def test_should_raise_type_error_when_multiplying_string_by_numbers(self):
        with self.assertRaises(TypeError) as error:
            dot_product(['a'], [2])
        self.assertEqual(str(error.exception), "unsupported operand type(s) for +: 'int' and 'str'")
