cdef class TrieNode:

    def __init__(self):
        """
        A constructor of TrieNode class which creates a new children.
        """
        self.__children = {}
        self.__words = set()

    cpdef addWord(self,
                  str word,
                  Word root,
                  int index=0):
        """
        The addWord method takes a String word, an index, and a Word root as inputs. First it creates a TrieNode child
        and it directly adds it to the set when the given index is equal to the length of given word.

        Then, it extracts the character at given index of given word and if children dictionary contains a mapping for
        the extracted character, it assigns it to the TrieNode child, else it creates a new TrieNode and assigns it to
        the child. At the end, it recursively calls the addWord method with the next index of child and puts the
        character with the child into the children dictionary.

        PARAMETERS
        ----------
        word : str
            String input.
        index : int
            Integer index.
        root : Word
            Word input to add.
        """
        cdef char ch
        cdef TrieNode child
        if index == len(word):
            self.__words.add(root)
            return
        ch = word[index]
        if ch in self.__children:
            child = self.__children[ch]
        else:
            child = TrieNode()
        child.addWord(word, root, index + 1)
        self.__children[ch] = child

    cpdef TrieNode getChild(self, char ch):
        """
        The getChild method takes a character and gets its corresponding value from children dictionary.

        PARAMETERS
        ----------
        ch : chr
            Character input.

        RETURNS
        -------
        TreeNode
            the value from children dictionary.
        """
        return self.__children.get(ch)

    cpdef set getWords(self):
        """
        The getWords method returns the words set.

        RETURNS
        -------
        set
            the words set.
        """
        return self.__words
