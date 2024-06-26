cdef class TxtWord(Word):

    def __init__(self,
                 name: str,
                 flag=None):
        """
        Another constructor of TxtWord class which takes a String name and a flag as inputs and calls its super class
        Word with given name. Then, creates a new list as flags and calls addFlag method with given flag.

        PARAMETERS
        ----------
        name : str
            String input.
        flag : str
            String input.
        """
        super().__init__(name)
        self.__flags = []
        self.morphology = ""
        if flag is not None:
            self.addFlag(flag)

    cpdef addFlag(self, str flag):
        """
        The addFlag method takes a String flag as an input and adds given flag to the flags list.

        PARAMETERS
        ----------
        flag : str
            String input to add.
        """
        self.__flags.append(flag)

    cpdef removeFlag(self, str flag):
        """
        The removeFlag method takes a String flag as an input and removes given flag from the flags list.

        PARAMETERS
        ----------
        flag : str
            String input to remove.
        """
        self.__flags.remove(flag)

    cpdef str getMorphology(self):
        """
        Accessor for the inner morphology of the word.
        :return: Inner morphology of the word.
        """
        return self.morphology

    cpdef setMorphology(self, morphology: str):
        """
        Mutator for the inner morphology of the word.
        :param morphology: New inner morphology of the word.
        """
        self.morphology = morphology

    cpdef str verbType(self):
        """
        The verbType method checks flags list and returns the corresponding cases.

        RETURNS
        -------
        str
            the corresponding cases.
        """
        if "F1P1-NO-REF" in self.__flags:
            """
            There is no example in the Turkish dictionary.
            """
            return "F1P1-NO-REF"
        if "F2P1-NO-REF" in self.__flags:
            """
            F2P1-NO-REF: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn 
            suffix, can take PassiveHl suffix, can take CausativeT suffix. e.g. Doğ, göç, için
            """
            return "F2P1-NO-REF"
        if "F3P1-NO-REF" in self.__flags:
            """
            F3P1-NO-REF: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn 
            suffix, can take Passive Hl suffix, can take CausativeT suffix. e.g. Ak
            """
            return "F3P1-NO-REF"
        if "F4P1-NO-REF" in self.__flags:
            """
            F4P1-NO-REF: The bare-form is a verb and depending on this attribute, the verb can't take PassiveHn 
            suffix, can take CausativeT suffix. e.g. Aksa
            """
            return "F4P1-NO-REF"
        if "F4PR-NO-REF" in self.__flags:
            """
            F4PR-NO-REF: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn 
            suffix, can take PassiveHl suffix, can take CausativeT suffix. e.g. Çevir, göster
            """
            return "F4PR-NO-REF"
        if "F4PL-NO-REF" in self.__flags:
            """
            F4PL-NO-REF: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn 
            suffix, can take CausativeT suffix. e.g. Azal, çoğal
            """
            return "F4PL-NO-REF"
        if "F4PW-NO-REF" in self.__flags:
            """
            F4PW-NO-REF: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn 
            suffix, can take PassiveN suffix, can take CausativeT suffix. e.g. Birle, boya
            """
            return "F4PW-NO-REF"
        if "F5PL-NO-REF" in self.__flags:
            """
            F5PL-NO-REF: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn 
            suffix, can take CausativeDHr suffix. e.g. Çal, kal
            """
            return "F5PL-NO-REF"
        if "F5PR-NO-REF" in self.__flags:
            """
            F5PR-NO-REF: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn 
            suffix, can take PassiveHl suffix, can take CausativeDHr suffix. e.g. Birleş, çöz
            """
            return "F5PR-NO-REF"
        if "F5PW-NO-REF" in self.__flags:
            """
            F5PW-NO-REF: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn 
            suffix, can take PassiveHl suffix, can take CausativeDHr suffix. e.g. Ye
            """
            return "F5PW-NO-REF"
        if "F1P1" in self.__flags:
            """
            F1P1: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn suffix, can 
            take PassiveHl suffix, can take CausativeAr suffix, can take ReciprocalHs suffix. e.g. Çık, kop
            """
            return "F1P1"
        if "F2P1" in self.__flags:
            """
            F2P1: The bare-form is a verb and depending on this attribute, the verb can can not PassiveHn suffix, can 
            take CausativeHr suffix, can take CausativeDHr suffix, can take ReciprocalHs suffix. e.g. Bit, doy, düş
            """
            return "F2P1"
        if "F2PL" in self.__flags:
            """
            F2PL: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn suffix, can 
            take CausativeHr suffix, can take CausativeDHr suffix, can take ReciprocalHs suffix. e.g. Art, çök
            """
            return "F2PL"
        if "F3P1" in self.__flags:
            """
            F3P1: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn suffix, can 
            take PassiveHl suffix, can take CausativeHl suffix, can take ReciprocalHs suffix. e.g. Kok, sark
            """
            return "F3P1"
        if "F4P1" in self.__flags:
            """
            F4P1: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn suffix,
            can take CausativeT suffix, can take ReciprocalHs suffix. e.g. Anla
            """
            return "F4P1"
        if "F4PR" in self.__flags:
            """
            F4PR: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn suffix, can 
            take PassiveHl suffix, can take CausativeT suffix, can take ReciprocalHs suffix. e.g. Bitir, çağır
            """
            return "F4PR"
        if "F4PL" in self.__flags:
            """
            F4PL: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn suffix, can 
            take PassiveN suffix, can take CausativeT suffix, can take ReciprocalHs suffix. e.g. Bolal, çömel
            """
            return "F4PL"
        if "F4PW" in self.__flags:
            """
            F4PW: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn suffix, can 
            take PassiveN suffix, can take CausativeT suffix, can take ReciprocalHs suffix. e.g. Boyla, çağla
            """
            return "F4PW"
        if "F5P1" in self.__flags:
            """
            F5P1: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn suffix, can 
            take PassiveHl suffix, can take CausativeDHr suffix, can take ReciprocalHs suffix, can take ReflexiveHn 
            suffix. e.g. Giy
            """
            return "F5P1"
        if "F5PL" in self.__flags:
            """
            F5PL: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn suffix, can 
            take PassiveHl suffix, can take CausativeDHr suffix, can take ReciprocalHs suffix. e.g. Böl, dal
            """
            return "F5PL"
        if "F5PR" in self.__flags:
            """
            F5PR: The bare-form is a verb and depending on this attribute, the verb can take NominalVerb suffixes 
            "-sHm, -SHn, -yHz, SHnHz, -lAr", can take NominalVerb1 suffixes, "-yDH, -ysA", can take NominalVerb2 suffix,
            "-ymHs", can take AdjectiveRoot suffix, "-SH", can take Adjective suffix, "-ŞAr" e.g. Bilin, çalış
            """
            return "F5PR"
        if "F5PW" in self.__flags:
            """
            F5PW: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn suffix,
            can take CausativeDHr suffix, can take ReciprocalHs suffix. e.g. Boşver, cezbet
            """
            return "F5PW"
        if "F6P1" in self.__flags:
            """
            F6P1: The bare-form is a verb and depending on this attribute, the verb can not take PassiveHn suffix, 
            can take PassiveN suffix, can take ReciprocalHs suffix, can take ReflexiveHn suffix. e.g. Gizle, hazırla, 
            kaşı
            """
            return "F6P1"
        return ""

    cpdef bint samePos(self, TxtWord word):
        """
        The samePos method takes TxtWord as input and returns true if;

        flags list contains CL_ISIM
        CL_ISIM: The bare-form of the word is a noun. e.g. Abla

        flags list contains CL_FIIL
        CL_FIIL: The bare-form of the word is a verb. e.g. Affet

        flags list contains IS_ADJ
        IS_ADJ: The bare-form of the word is a adjective. e.g. Acayip

        flags list contains IS_ZM
        IS_ZM: The bare-form of the word is a pronoun. e.g. Başkası

        flags list contains IS_ADVERB
        IS_ADVERB: The bare-form of the word is a adverb. e.g. Tekrar, açıktan, adeta

        PARAMETERS
        ----------
        word : TxtWord
            TxtWord type input.

        RETURNS
        -------
        bool
            true if given word is nominal, verb, adjective, pronoun or adverb, false otherwise.
        """
        if self.isNominal() and word.isNominal():
            return True
        if self.isVerb() and word.isVerb():
            return True
        if self.isAdjective() and word.isAdjective():
            return True
        if self.isPronoun() and word.isPronoun():
            return True
        if self.isAdverb() and word.isAdverb():
            return True
        return False

    cpdef bint isNominal(self):
        """
        The isNominal method returns true if flags list contains CL_ISIM.

        RETURNS
        -------
        bool
            true if flags list contains CL_ISIM.
        """
        return "CL_ISIM" in self.__flags

    cpdef bint isPassive(self):
        """
        The isPassive method returns true if flags list contains PASSIVE-HN.

        RETURNS
        -------
        bool
            true if flags list contains PASSIVE-HN.
        """
        return "PASSIVE-HN" in self.__flags

    cpdef bint isAbbreviation(self):
        """
        The isAbbreviation method returns true if flags list contains IS_KIS.

        RETURNS
        -------
        bool
            true if flags list contains IS_KIS.
        """
        return "IS_KIS" in self.__flags

    cpdef bint isInterjection(self):
        """
        The isInterjection method returns true if flags list contains IS_INTERJ.

        RETURNS
        -------
        bool
            true if flags list contains IS_INTERJ.
        """
        return "IS_INTERJ" in self.__flags

    cpdef bint isDuplicate(self):
        """
        The isDuplicate method returns true if flags list contains IS_DUP.

        RETURNS
        -------
        bool
            true if flags list contains IS_DUP.
        """
        return "IS_DUP" in self.__flags

    cpdef bint isCode(self):
        """
        The isCode method returns true if flags list contains IS_CODE.

        RETURNS
        -------
        bool
            true if flags list contains IS_CODE.
        """
        return "IS_CODE" in self.__flags

    cpdef bint isMetric(self):
        """
        The isMetric method returns true if flags list contains IS_METRIC.

        RETURNS
        -------
        bool
            true if flags list contains IS_METRIC.
        """
        return "IS_METRIC" in self.__flags

    cpdef bint isHeader(self):
        """
        The isHeader method returns true if flags list contains IS_HEADER.

        RETURNS
        -------
        bool
            true if flags list contains IS_HEADER.
        """
        return "IS_HEADER" in self.__flags

    cpdef bint isAdjective(self):
        """
        The isAdjective method returns true if flags list contains IS_ADJ.

        RETURNS
        -------
        bool
            true if flags list contains IS_ADJ.
        """
        return "IS_ADJ" in self.__flags

    cpdef bint isPureAdjective(self):
        """
        The isPureAdjective method returns true if flags list contains IS_PUREADJ.

        RETURNS
        -------
        bool
            true if flags list contains IS_PUREADJ.
        """
        return "IS_PUREADJ" in self.__flags

    cpdef bint isPronoun(self):
        """
        The isPronoun method returns true if flags list contains IS_ZM.
        IS_ZM: The bare-form of the word is a pronoun. e.g. Hangi, hep, hiçbiri

        RETURNS
        -------
        bool
            true if flags list contains IS_ZM.
        """
        return "IS_ZM" in self.__flags

    cpdef bint isQuestion(self):
        """
        The isQuestion method returns true if flags list contains IS_QUES.
        IS_QUES: The bare-form of the word is a question. e.g. Mi, mu, mü

        RETURNS
        -------
        bool
            true if flags list contains IS_QUES.
        """
        return "IS_QUES" in self.__flags

    cpdef bint isVerb(self):
        """
        The isVerb method returns true if flags list contains CL_FIIL.

        RETURNS
        -------
        bool
            true if flags list contains CL_FIIL.
        """
        return "CL_FIIL" in self.__flags

    cpdef bint isPortmanteau(self):
        """
        The isPortmanteau method returns true if flags list contains IS_BILEŞ.
        IS_BILEŞ: The bare-form is a portmanteau word in affixed form. e.g. gelinçiçeği

        RETURNS
        -------
        bool
            true if flags list contains IS_BILEŞ.
        """
        return "IS_BILEŞ" in self.__flags

    cpdef bint isDeterminer(self):
        """
        The isDeterminer method returns true if flags list contains IS_DET.
        IS_DET: The bare-form of the word is a determiner. e.g. Bazı, bir

        RETURNS
        -------
        bool
            true if flags list contains IS_DET.
        """
        return "IS_DET" in self.__flags

    cpdef bint isConjunction(self):
        """
        The isConjunction method returns true if flags list contains IS_CONJ.
        IS_CONJ: The bare-form of the word is a conjunction. e.g. Gerek, halbuki

        RETURNS
        -------
        bool
            true if flags list contains IS_CONJ.
        """
        return "IS_CONJ" in self.__flags

    cpdef bint isAdverb(self):
        """
        The isAdverb method returns true if flags list contains IS_ADVERB.

        RETURNS
        -------
        bool
            true if flags list contains IS_ADVERB.
        """
        return "IS_ADVERB" in self.__flags

    cpdef bint isPostP(self):
        """
        The isPostP method returns true if flags list contains IS_POSTP.
        IS_POSTP: The bare-form of the word is a postposition. e.g. Önce, takdirde, üzere

        RETURNS
        -------
        bool
            true if flags list contains IS_POSTP.
        """
        return "IS_POSTP" in self.__flags

    cpdef bint isPortmanteauEndingWithSI(self):
        """
        The isPortmanteauEndingWithSI method returns true if flags list contains IS_B_SI.
        IS_B_SI: The bare-form is a portmanteau word ending with "sı". e.g. Giritlalesi

        RETURNS
        -------
        bool
            true if flags list contains IS_B_SI.
        """
        return "IS_B_SI" in self.__flags

    cpdef bint isPortmanteauFacedVowelEllipsis(self):
        """
        The isPortmanteauFacedVowelEllipsis method returns true if flags list contains IS_B_UD.
        IS_B_UD: The bare-form of the word includes vowel epenthesis,
        therefore the last inserted vowel drops during suffixation. e.g. İnsanoğlu

        RETURNS
        -------
        bool
            true if flags list contains IS_B_UD.
        """
        return "IS_B_UD" in self.__flags

    cpdef bint isPortmanteauFacedSoftening(self):
        """
        The isPortmanteauFacedSoftening method returns true if flags list contains IS_B_SD.
        IS_B_SD: The bare-form of the word includes softening. e.g. Çançiçeği

        RETURNS
        -------
        bool
            true if flags list contains IS_B_SD.
        """
        return "IS_B_SD" in self.__flags

    cpdef bint isSuffix(self):
        """
        The isSuffix method returns true if flags list contains EK.
        EK: This tag indicates complementary verbs. e.g. İdi, iken, imiş.

        RETURNS
        -------
        bool
            true if flags list contains EK.
        """
        return "EK" in self.__flags

    cpdef bint isProperNoun(self):
        """
        The isProperNoun method returns true if flags list contains IS_OA.
        IS_OA: The bare-form of the word is a proper noun. e.g. Abant, Beşiktaş

        RETURNS
        -------
        bool
            true if flags list contains IS_OA.
        """
        return "IS_OA" in self.__flags

    cpdef bint isPlural(self):
        """
        The isPlural method returns true if flags list contains IS_CA.
        IS_CA: The bare-form of the word is already in a plural form,
        therefore can not take plural suffixes such as "ler" or "lar". e.g. Buğdaygiller

        RETURNS
        -------
        bool
            true if flags list contains IS_CA.
        """
        return "IS_CA" in self.__flags

    cpdef bint isNumeral(self):
        """
        The isNumeral method returns true if flags list contains IS_SAYI.
        IS_SAYI: The word is a number. e.g. Dört

        RETURNS
        -------
        bool
            true if flags list contains IS_SAYI.
        """
        return "IS_SAYI" in self.__flags

    cpdef bint isReal(self):
        """
        The isReal method returns true if flags list contains IS_REELSAYI.

        RETURNS
        -------
        bool
            true if flags list contains IS_REELSAYI.
        """
        return "IS_REELSAYI" in self.__flags

    cpdef bint isFraction(self):
        """
        The isFraction method returns true if flags list contains IS_KESIR.

        RETURNS
        -------
        bool
            true if flags list contains IS_KESIR.
        """
        return "IS_KESIR" in self.__flags

    cpdef bint isTime(self):
        """
        The isTime method returns true if flags list contains IS_ZAMAN.

        RETURNS
        -------
        bool
            true if flags list contains IS_ZAMAN.
        """
        return "IS_ZAMAN" in self.__flags

    cpdef bint isDate(self):
        """
        The isDate method returns true if flags list contains IS_DATE.

        RETURNS
        -------
        bool
            true if flags list contains IS_DATE.
        """
        return "IS_DATE" in self.__flags

    cpdef bint isPercent(self):
        """
        The isPercent method returns true if flags list contains IS_PERCENT.

        RETURNS
        -------
        bool
            true if flags list contains IS_PERCENT.
        """
        return "IS_PERCENT" in self.__flags

    cpdef bint isRange(self):
        """
        The isRange method returns true if flags list contains IS_RANGE.

        RETURNS
        -------
        bool
            true if flags list contains IS_RANGE.
        """
        return "IS_RANGE" in self.__flags

    cpdef bint isOrdinal(self):
        """
        The isOrdinal method returns true if flags list contains IS_ORD.
        IS_ORD: The bare-form of the word can take suffixes and these suffixes define a ranking. e.g. Birinci

        RETURNS
        -------
        bool
            true if flags list contains IS_ORD.
        """
        return "IS_ORD" in self.__flags

    cpdef bint notObeysVowelHarmonyDuringAgglutination(self):
        """
        The notObeysVowelHarmonyDuringAgglutination method returns true if flags list contains IS_UU.
        IS_UU: The bare-form does not obey vowel harmony while taking suffixes. e.g. Dikkat

        RETURNS
        -------
        bool
            true if flags list contains IS_UU.
        """
        return "IS_UU" in self.__flags

    cpdef bint obeysAndNotObeysVowelHarmonyDuringAgglutination(self):
        """
        The obeysAndNotObeysVowelHarmonyDuringAgglutination method returns true if flags list contains IS_UUU.
        IS_UUU: The bare-form does not obey vowel harmony while taking suffixes. e.g. Bol, kalp

        RETURNS
        -------
        bool
            true if flags list contains IS_UUU.
        """
        return "IS_UUU" in self.__flags

    cpdef bint rootSoftenDuringSuffixation(self):
        """
        The rootSoftenDuringSuffixation method returns true if flags list contains IS_SD, F_SD.

        RETURNS
        -------
        bool
            true if flags list contains IS_SD, F_SD.
        """
        return "IS_SD" in self.__flags or "F_SD" in self.__flags

    cpdef bint rootSoftenAndNotSoftenDuringSuffixation(self):
        """
        The rootSoftenAndNotSoftenDuringSuffixation method returns true if flags list contains IS_SDD.
        IS_SDD: The bare-form final consonant can (or can not) get devoiced during vowel-initial suffixation. e.g. Kalp

        RETURNS
        -------
        bool
            true if flags list contains IS_SDD.
        """
        return "IS_SDD" in self.__flags

    cpdef bint verbSoftenDuringSuffixation(self):
        """
        The verbSoftenDuringSuffixation method returns true if flags list contains F_SD.
        F_SD: The bare-form final consonant gets devoiced during vowel-initial suffixation. e.g. Cezbet

        RETURNS
        -------
        bool
            true if flags list contains F_SD.
        """
        return "F_SD" in self.__flags

    cpdef bint nounSoftenDuringSuffixation(self):
        """
        The nounSoftenDuringSuffixation method returns true if flags list contains IS_SD.
        IS_SD: The bare-form final consonant already has an accusative suffix. e.g. Kabağı

        RETURNS
        -------
        bool
            true if flags list contains IS_SD.
        """
        return "IS_SD" in self.__flags

    cpdef bint endingKChangesIntoG(self):
        """
        The endingKChangesIntoG method returns true if flags list contains IS_KG.
        IS_KG: The bare-form includes vowel epenthesis, therefore the last inserted vowel drope
        during suffixation. e.g. Çelenk

        RETURNS
        -------
        bool
            true if flags list contains IS_KG.
        """
        return "IS_KG" in self.__flags

    cpdef bint isExceptional(self):
        """
        The isExceptional method returns true if flags list contains IS_EX.
        IS_EX: This tag defines exception words. e.g. Delikanlı

        RETURNS
        -------
        bool
            true if flags list contains IS_EX.
        """
        return "IS_EX" in self.__flags

    cpdef bint duplicatesDuringSuffixation(self):
        """
        The duplicatesDuringSuffixation method returns true if flags list contains IS_ST.
        IS_ST: The second consonant of the bare-form undergoes a resyllabification. e.g. His

        RETURNS
        -------
        bool
            true if flags list contains IS_ST.
        """
        return "IS_ST" in self.__flags

    cpdef bint duplicatesAndNotDuplicatesDuringSuffixation(self):
        """
        The duplicatesAndNotDuplicatesDuringSuffixation method returns true if flags list contains IS_STT.
        IS_STT: The second consonant of the bare-form undergoes a resyllabification. e.g. His

        RETURNS
        -------
        bool
            true if flags list contains IS_STT.
        """
        return "IS_STT" in self.__flags

    cpdef bint lastIdropsDuringSuffixation(self):
        """
        The lastIdropsDuringSuffixation method returns true if flags list contains IS_UD.
        IS_UD: The bare-form includes vowel epenthesis, therefore the last inserted vowel drops during suffixation.
        e.g. Boyun

        RETURNS
        -------
        bool
            true if flags list contains IS_UD.
        """
        return "IS_UD" in self.__flags

    cpdef bint lastIDropsAndNotDropDuringSuffixation(self):
        """
        The lastIDropsAndNotDropDuringSuffixation method returns true if flags list contains IS_UDD.
        IS_UDD: The bare-form includes vowel epenthesis, therefore the last inserted vowel can (or can not) drop during
        suffixation. e.g. Kadir

        RETURNS
        -------
        bool
            true if flags list contains IS_UDD.
        """
        return "IS_UDD" in self.__flags

    cpdef bint takesRelativeSuffixKi(self):
        """
        The takesRelativeSuffixKi method returns true if flags list contains IS_KI.
        IS_KI: The word can take a suffix such as "ki". e.g. Önce

        RETURNS
        -------
        bool
            true if flags list contains IS_KI.
        """
        return "IS_KI" in self.__flags

    cpdef bint takesRelativeSuffixKu(self):
        """
        The takesRelativeSuffixKu method returns true if flags list contains IS_KU.
        IS_KU: The word can take a suffix such as "kü". e.g. Bugün

        RETURNS
        -------
        bool
            true if flags list contains IS_KU.
        """
        return "IS_KU" in self.__flags

    cpdef bint consonantSMayInsertedDuringPossesiveSuffixation(self):
        """
        The consonantSMayInsertedDuringPossesiveSuffixation method returns true if flags list contains IS_SII.

        RETURNS
        -------
        bool
            true if flags list contains IS_SII.
        """
        return "IS_SII" in self.__flags

    cpdef bint lastIdropsDuringPassiveSuffixation(self):
        """
        The lastIdropsDuringPassiveSuffixation method returns true if flags list contains F_UD.
        F_UD: The bare-form includes vowel epenthesis, therefore the last "ı"
        drops during passive suffixation. e.g. Çağır

        RETURNS
        -------
        bool
            true if flags list contains F_UD.
        """
        return "F_UD" in self.__flags

    cpdef bint vowelAChangesToIDuringYSuffixation(self):
        """
        The vowelAChangesToIDuringYSuffixation method returns true if flags list contains F_GUD.
        F_GUD: The verb bare-form includes vowel reduction, the last vowel "a" of the bare-form is replaced with "ı"
        e.g. Buzağıla

        RETURNS
        -------
        bool
            true if flags list contains F_GUD.
        """
        return "F_GUD" in self.__flags

    cpdef bint vowelEChangesToIDuringYSuffixation(self):
        """
        The vowelEChangesToIDuringYSuffixation method returns true if flags list contains F_GUDO.
        F_GUDO: The verb bare-form includes viwel reduction, the last vowel "e" of the
        bare-form is replaced with "i". e.g. Ye

        RETURNS
        -------
        bool
            true if flags list contains F_GUDO.
        """
        return "F_GUDO" in self.__flags

    cpdef bint takesSuffixIRAsAorist(self):
        """
        The takesSuffixIRAsAorist method returns true if flags list contains F_GIR.
        F_GIR: The bare-form of the word takes "ir" suffix. e.g. Geç

        RETURNS
        -------
        bool
            true if flags list contains F_GIR.
        """
        return "F_GIR" not in self.__flags

    cpdef bint takesSuffixDIRAsFactitive(self):
        """
        The takesSuffixDIRAsFactitive method returns true if flags list contains F_DIR.
        F_DIR: The bare-form of the word takes "tır" suffix. e.g. Daral

        RETURNS
        -------
        bool
            true if flags list contains F_DIR.
        """
        return "F_DIR" not in self.__flags

    cpdef bint showsSuRegularities(self):
        """
        The showsSuRegularities method returns true if flags list contains IS_SU.

        RETURNS
        -------
        bool
            true if flags list contains IS_SU.
        """
        return "IS_SU" in self.__flags

    cpdef bint containsFlag(self, str flag):
        """
        The containsFlag method returns true if flags list contains flag.

        RETURNS
        -------
        bool
            true if flags list contains flag.
        """
        return flag in self.__flags

    def __str__(self) -> str:
        result = super().__str__()
        for flag in self.__flags:
            result = result + " " + flag
        return result

    def __repr__(self):
        return f"{self.name} {self.__flags} {self.morphology}"
