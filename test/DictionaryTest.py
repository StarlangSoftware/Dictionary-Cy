import unittest

from Dictionary.TxtDictionary import TxtDictionary
from Dictionary.TxtWord import TxtWord


class DictionaryTest(unittest.TestCase):
    dictionary: TxtDictionary
    lowerCaseDictionary: TxtDictionary
    mixedCaseDictionary: TxtDictionary

    def setUp(self) -> None:
        self.dictionary = TxtDictionary()
        self.lowerCaseDictionary = TxtDictionary("../lowercase.txt")
        self.mixedCaseDictionary = TxtDictionary("../mixedcase.txt", "../Dictionary/data/turkish_misspellings.txt", TxtDictionary.turkishIgnoreCaseComparator)

    def test_GetWordIndex(self):
        self.assertEqual(0, self.lowerCaseDictionary.getWordIndex("a"))
        self.assertEqual(3, self.lowerCaseDictionary.getWordIndex("ç"))
        self.assertEqual(8, self.lowerCaseDictionary.getWordIndex("ğ"))
        self.assertEqual(10, self.lowerCaseDictionary.getWordIndex("ı"))
        self.assertEqual(18, self.lowerCaseDictionary.getWordIndex("ö"))
        self.assertEqual(22, self.lowerCaseDictionary.getWordIndex("ş"))
        self.assertEqual(25, self.lowerCaseDictionary.getWordIndex("ü"))
        self.assertEqual(28, self.lowerCaseDictionary.getWordIndex("z"))
        self.assertTrue(self.mixedCaseDictionary.getWordIndex("A") == 0 or self.mixedCaseDictionary.getWordIndex("A") == 1)
        self.assertTrue(self.mixedCaseDictionary.getWordIndex("Ç") == 6 or self.mixedCaseDictionary.getWordIndex("Ç") == 7)
        self.assertTrue(self.mixedCaseDictionary.getWordIndex("Ğ") == 16 or self.mixedCaseDictionary.getWordIndex("Ğ") == 17)
        self.assertTrue(self.mixedCaseDictionary.getWordIndex("I") == 20 or self.mixedCaseDictionary.getWordIndex("I") == 21)
        self.assertTrue(self.mixedCaseDictionary.getWordIndex("İ") == 22 or self.mixedCaseDictionary.getWordIndex("İ") == 23)
        self.assertTrue(self.mixedCaseDictionary.getWordIndex("Ş") == 44 or self.mixedCaseDictionary.getWordIndex("Ş") == 45)
        self.assertTrue(self.mixedCaseDictionary.getWordIndex("Ü") == 50 or self.mixedCaseDictionary.getWordIndex("Ü") == 51)
        self.assertTrue(self.mixedCaseDictionary.getWordIndex("Z") == 56 or self.mixedCaseDictionary.getWordIndex("Z") == 57)

    def test_Size(self):
        self.assertEqual(29, self.lowerCaseDictionary.size())
        self.assertEqual(58, self.mixedCaseDictionary.size())
        self.assertEqual(62120, self.dictionary.size())

    def test_GetWord(self):
        self.assertEqual(TxtWord("a"), self.lowerCaseDictionary.getWordWithIndex(0))
        self.assertEqual(TxtWord("ç"), self.lowerCaseDictionary.getWordWithIndex(3))
        self.assertEqual(TxtWord("ğ"), self.lowerCaseDictionary.getWordWithIndex(8))
        self.assertEqual(TxtWord("ı"), self.lowerCaseDictionary.getWordWithIndex(10))
        self.assertEqual(TxtWord("ö"), self.lowerCaseDictionary.getWordWithIndex(18))
        self.assertEqual(TxtWord("ş"), self.lowerCaseDictionary.getWordWithIndex(22))
        self.assertEqual(TxtWord("ü"), self.lowerCaseDictionary.getWordWithIndex(25))
        self.assertEqual(TxtWord("z"), self.lowerCaseDictionary.getWordWithIndex(28))
        for i in range(self.dictionary.size()):
            self.assertIsNotNone(self.dictionary.getWordWithIndex(i))

    def test_LongestWordSize(self):
        self.assertEqual(1, self.lowerCaseDictionary.longestWordSize())
        self.assertEqual(1, self.mixedCaseDictionary.longestWordSize())
        self.assertEqual(21, self.dictionary.longestWordSize())

    def test_GetWordStartingWith(self):
        self.assertEqual(0, self.lowerCaseDictionary.getWordStartingWith("a"))
        self.assertEqual(1, self.lowerCaseDictionary.getWordStartingWith("b"))
        self.assertEqual(20, self.lowerCaseDictionary.getWordStartingWith("pırasa"))
        self.assertEqual(27, self.lowerCaseDictionary.getWordStartingWith("veli"))
        self.assertEqual(40, self.mixedCaseDictionary.getWordStartingWith("Pırasa"))
        self.assertEqual(54, self.mixedCaseDictionary.getWordStartingWith("Veli"))


if __name__ == '__main__':
    unittest.main()
