from Dictionary.Word cimport Word


cdef class Dictionary:

    def __init__(self, comparator=None):
        """
        An empty constructor of Dictionary class.
        """
        self.words = []
        self.filename = ""
        if comparator is None:
            self.comparator = Dictionary.turkishLowerCaseComparator
        else:
            self.comparator = comparator

    @staticmethod
    def turkishLowerCaseComparator(wordA: Word, wordB: Word):
        """
        Compares two words in a case-sensitive manner.
        :param wordA: First word to compare.
        :param wordB: Second word to compare.
        :return: the value 0 if the wordA is equal to the wordB; a value less than 0 if this wordA is
        lexicographically less than wordB; and a value greater than 1 if this wordA is lexicographically greater
        than wordB.
        """
        cdef int i, first, second
        cdef str first_char, second_char
        LOWERCASE_LETTERS = "abcçdefgğhıijklmnoöprsştuüvyz"
        for i in range(min(len(wordA.getName()), len(wordB.getName()))):
            first_char = wordA.getName()[i:i + 1]
            second_char = wordB.getName()[i:i + 1]
            if first_char != second_char:
                if first_char in LOWERCASE_LETTERS and second_char not in LOWERCASE_LETTERS:
                    return -1
                elif first_char not in LOWERCASE_LETTERS and second_char in LOWERCASE_LETTERS:
                    return 1
                elif first_char in LOWERCASE_LETTERS and second_char in LOWERCASE_LETTERS:
                    first = LOWERCASE_LETTERS.index(first_char)
                    second = LOWERCASE_LETTERS.index(second_char)
                    if first < second:
                        return -1
                    elif first > second:
                        return 1
        if len(wordA.getName()) < len(wordB.getName()):
            return -1
        elif len(wordA.getName()) > len(wordB.getName()):
            return 1
        else:
            return 0

    @staticmethod
    def turkishIgnoreCaseComparator(wordA: Word, wordB: Word):
        """
        Compares two words in a case-insensitive manner.
        :param wordA: First word to compare.
        :param wordB: Second word to compare.
        :return: the value 0 if the wordA is equal to the wordB; a value less than 0 if this wordA is
        lexicographically less than wordB; and a value greater than 1 if this wordA is lexicographically greater
        than wordB.
        """
        cdef int i, first, second
        cdef str first_char, second_char
        IGNORE_CASE_LETTERS = "aAbBcCçÇdDeEfFgGğĞhHıIiİjJkKlLmMnNoOöÖpPrRsSşŞtTuUüÜvVyYzZ"
        for i in range(min(len(wordA.getName()), len(wordB.getName()))):
            first_char = wordA.getName()[i:i + 1]
            second_char = wordB.getName()[i:i + 1]
            if first_char != second_char:
                if first_char in IGNORE_CASE_LETTERS and second_char not in IGNORE_CASE_LETTERS:
                    return -1
                elif first_char not in IGNORE_CASE_LETTERS and second_char in IGNORE_CASE_LETTERS:
                    return 1
                elif first_char in IGNORE_CASE_LETTERS and second_char in IGNORE_CASE_LETTERS:
                    first = IGNORE_CASE_LETTERS.index(first_char)
                    second = IGNORE_CASE_LETTERS.index(second_char)
                    if first < second:
                        return -1
                    elif first > second:
                        return 1
        if len(wordA.getName()) < len(wordB.getName()):
            return -1
        elif len(wordA.getName()) > len(wordB.getName()):
            return 1
        else:
            return 0

    cpdef Word getWord(self, str name):
        """
        The getWord method takes a String name as an input and performs binary search within words list and assigns the
        result to integer variable middle. If the middle is greater than 0, it returns the item at index middle of words
        list, None otherwise.

        PARAMETERS
        ----------
        name : str
            String input.

        RETURNS
        -------
        Word
            the item at found index of words {@link ArrayList}, null if cannot be found.
        """
        cdef Word word
        cdef int middle
        word = Word(name)
        middle = self.__getPosition(word)
        if middle >= 0:
            return self.words[middle]
        return None

    cpdef int getWordIndex(self, str name):
        """
        The getWordIndex method takes a String name as an input and performs binary search within words list and assigns
        the result to integer variable middle. If the middle is greater than 0, it returns the index middle, -1
        otherwise.

        PARAMETERS
        ----------
        name : str
            String input.

        RETURNS
        -------
        int
            found index of words list, -1 if cannot be found.
        """
        cdef Word word
        cdef int middle
        word = Word(name)
        middle = self.__getPosition(word)
        if middle >= 0:
            return middle
        return -1

    cpdef removeWord(self, str name):
        """
        RemoveWord removes a word with the given name

        PARAMETERS
        ----------
        name : str
            Name of the word to be removed.
        """
        cdef int index
        index = self.getWordIndex(name)
        if index != -1:
            self.words.pop(index)

    cpdef int size(self):
        """
        The size method returns the size of the words list.

        RETURNS
        -------
        int
            The size of the words list.
        """
        return len(self.words)

    cpdef Word getWordWithIndex(self, int index):
        """
        The getWordWithIndex method which takes an index as an input and returns the value at given index of words list.

        PARAMETERS
        ----------
        index : int
            index to get the value.

        RETURNS
        -------
        Word
            The value at given index of words list.
        """
        return self.words[index]

    cpdef int longestWordSize(self):
        """
        The longestWordSize method loops through the words list and returns the item with the maximum word length.

        RETURNS
        -------
        int
            The item with the maximum word length.
        """
        cdef int max_length
        max_length = 0
        for word in self.words:
            if len(word.getName()) > max_length:
                max_length = len(word.getName())
        return max_length

    cpdef int __getPosition(self, Word word):
        """
        Checks if a given word exists in the dictionary by performing a binary search on the words array.
        :param word: Searched word
        :return: the index of the search word, if it is contained in the words array; otherwise,
        (-(insertion point) - 1). The insertion point is defined as the point at which the word would be inserted into
        the words array.
        """
        cdef int lo, hi, mid
        lo = 0
        hi = len(self.words) - 1
        while lo <= hi:
            mid = (lo + hi) // 2
            if self.comparator(self.words[mid], word) < 0:
                lo = mid + 1
            elif self.comparator(self.words[mid], word) > 0:
                hi = mid - 1
            else:
                return mid
        return -(lo + 1)

    cpdef int getWordStartingWith(self, str _hash):
        """
        The getWordStartingWith method takes a String hash as an input and performs binary search within words list and
        assigns the result to integer variable middle. If the middle is greater than 0, it returns the index middle,
        -middle-1 otherwise.

        PARAMETERS
        ----------
        _hash : str
            String input.

        RETURNS
        -------
        int
            Found index of words list, -middle-1 if cannot be found.
        """
        cdef Word word
        cdef int middle
        word = Word(_hash)
        middle = self.__getPosition(word)
        if middle < 0:
            return -middle - 1
        else:
            return middle

    def __repr__(self):
        return f"{self.words}"
