from unittest import TestCase
from src.abntify import abntify_name


class TestAbntify(TestCase):

    def test_it_returns_uppercased_single_name(self):
        result = abntify_name("Jeão")
        self.assertEqual(result, "JEÃO")

    def test_it_returns_uppercased_last_name_when_two_names(self):
        result = abntify_name("Jeão Pinzão")
        self.assertEqual(result, "PINZÃO, Jeão")

    def test_it_returns_uppercased_last_name_when_three_names(self):
        result = abntify_name("Jeão Pinzão Silvão")
        self.assertEqual(result, "SILVÃO, Jeão Pinzão")

    def test_it_returns_uppercased_last_name_with_special_name_as_only_last_name(self):
        result = abntify_name("Jeão Neto")
        self.assertEqual(result, "NETO, Jeão")

    def test_it_returns_uppercased_last_name_with_special_name_with_more_last_names(self):
        result = abntify_name("Jeão Silva Neto")
        self.assertEqual(result, "SILVA NETO, Jeão")
