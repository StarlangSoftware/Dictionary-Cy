from Language.TurkishLanguage cimport TurkishLanguage
from Syllibification.Syllable cimport Syllable


cdef class SyllableList:

    cdef list __syllables

    def __init__(self, word: str):
        """
         A constructor of SyllableList class which takes a String word as an input. First it creates a syllable
         list and a sbSyllable. Then it loops i times, where i ranges from 0 to length of given word, first
         it gets the ith character of given word and checks whether it is a vowel and the last character of the word.

         If it is a vowel it appends it to the sbSyllable and if it is the last vowel it also appends the next character
         to the sbSyllable. Then, it adds the sbSyllable to the syllables list.

         If it is not a vowel, and the sbSyllable's length is 1 also the previous character is a consonant it gets the
         last item of syllables list since there cannot be a Turkish word which starts with two consonants. However, if
         it is two last characters of word, then it adds it to the syllablelist. At the end, it updates the syllables
         list.

        PARAMETERS
        ----------
        word : str
            String input.
        """
        cdef int i, last_pos
        cdef str sbSyllable, c, temp_syllable, string
        cdef bint is_vowel, is_last_char
        self.__syllables = []
        sbSyllable = ""
        i = 0
        while i < len(word):
            c = word[i]
            is_vowel = TurkishLanguage.isVowel(c)
            is_last_char = (i == len(word) - 1)
            if is_vowel:
                sbSyllable += c
                # If it is the last vowel.
                if i == len(word) - 2:
                    sbSyllable += word[i + 1]
                    i = i + 1
                self.__syllables.append(Syllable(sbSyllable))
                sbSyllable = ""
            else:
                # A syllable should not start with two consonants.
                temp_syllable = sbSyllable
                if len(temp_syllable) == 1:
                    # The previous character was also a consonant.
                    if not TurkishLanguage.isVowel(temp_syllable[0]):
                        if len(self.__syllables) == 0:
                            sbSyllable += c
                            i = i + 1
                            continue
                        last_pos = len(self.__syllables) - 1
                        string = self.__syllables[last_pos].getText()
                        string = string + temp_syllable
                        if is_last_char:
                            # If the last char is also a consonant, add it to latest syllable. Ex: 'park'.
                            string = string + c
                        # Update previous syllable.
                        self.__syllables[last_pos] = Syllable(string)
                        sbSyllable = ""
                sbSyllable += c
            i = i + 1

    cpdef list getSyllables(self):
        """
        The getSyllables method creates a new list syllables and loops through the globally defined syllables
        list and adds each item to the newly created syllables list.

        RETURNS
        -------
        list
            list syllables.
        """
        cdef Syllable syllable
        syllables = []
        for syllable in self.__syllables:
            syllables.append(syllable.getText())
        return syllables

    def __repr__(self):
        return f"{self.__syllables}"
