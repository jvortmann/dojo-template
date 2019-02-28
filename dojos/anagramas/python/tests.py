import unittest
from dojo import anagrama

class TestStringMethods(unittest.TestCase):

    def test_one_char(self):
        data = ['a']
        result = anagrama('a')
        self.assertEqual(result, data)

    def test_two_chars(self):
        data = sorted(['ab', 'ba'])
        result = anagrama('ab')
        self.assertEqual(result, data)

        data = sorted(['ac', 'ca'])
        result = anagrama('ac')
        self.assertEqual(result, data)

        data = sorted(['ad', 'da'])
        result = anagrama('ad')
        self.assertEqual(result, data)

        data = sorted(['ad', 'da'])
        result = anagrama('da')
        self.assertEqual(result, data)

        data = ['aa']
        result = anagrama('aa')
        self.assertEqual(result, data)

    def test_three_chars(self):
        data = sorted(['abc', 'acb', 'bca', 'bac', 'cab', 'cba'])
        result = anagrama('abc')
        self.assertEqual(result, data)

if __name__ == '__main__':
    unittest.main()
