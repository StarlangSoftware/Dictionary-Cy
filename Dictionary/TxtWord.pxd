from Dictionary.Word cimport Word


cdef class TxtWord(Word):

    cdef list __flags
    cdef str morphology

    cpdef addFlag(self, str flag)
    cpdef removeFlag(self, str flag)
    cpdef str getMorphology(self)
    cpdef setMorphology(self, str morphology)
    cpdef str verbType(self)
    cpdef bint samePos(self, TxtWord word)
    cpdef bint isNominal(self)
    cpdef bint isPassive(self)
    cpdef bint isAbbreviation(self)
    cpdef bint isInterjection(self)
    cpdef bint isDuplicate(self)
    cpdef bint isCode(self)
    cpdef bint isMetric(self)
    cpdef bint isHeader(self)
    cpdef bint isAdjective(self)
    cpdef bint isPureAdjective(self)
    cpdef bint isPronoun(self)
    cpdef bint isQuestion(self)
    cpdef bint isVerb(self)
    cpdef bint isPortmanteau(self)
    cpdef bint isDeterminer(self)
    cpdef bint isConjunction(self)
    cpdef bint isAdverb(self)
    cpdef bint isPostP(self)
    cpdef bint isPortmanteauEndingWithSI(self)
    cpdef bint isPortmanteauFacedVowelEllipsis(self)
    cpdef bint isPortmanteauFacedSoftening(self)
    cpdef bint isSuffix(self)
    cpdef bint isProperNoun(self)
    cpdef bint isPlural(self)
    cpdef bint isNumeral(self)
    cpdef bint isReal(self)
    cpdef bint isFraction(self)
    cpdef bint isTime(self)
    cpdef bint isDate(self)
    cpdef bint isPercent(self)
    cpdef bint isRange(self)
    cpdef bint isOrdinal(self)
    cpdef bint notObeysVowelHarmonyDuringAgglutination(self)
    cpdef bint obeysAndNotObeysVowelHarmonyDuringAgglutination(self)
    cpdef bint rootSoftenDuringSuffixation(self)
    cpdef bint rootSoftenAndNotSoftenDuringSuffixation(self)
    cpdef bint verbSoftenDuringSuffixation(self)
    cpdef bint nounSoftenDuringSuffixation(self)
    cpdef bint endingKChangesIntoG(self)
    cpdef bint isExceptional(self)
    cpdef bint duplicatesDuringSuffixation(self)
    cpdef bint duplicatesAndNotDuplicatesDuringSuffixation(self)
    cpdef bint lastIdropsDuringSuffixation(self)
    cpdef bint lastIDropsAndNotDropDuringSuffixation(self)
    cpdef bint takesRelativeSuffixKi(self)
    cpdef bint takesRelativeSuffixKu(self)
    cpdef bint consonantSMayInsertedDuringPossesiveSuffixation(self)
    cpdef bint lastIdropsDuringPassiveSuffixation(self)
    cpdef bint vowelAChangesToIDuringYSuffixation(self)
    cpdef bint vowelEChangesToIDuringYSuffixation(self)
    cpdef bint takesSuffixIRAsAorist(self)
    cpdef bint takesSuffixDIRAsFactitive(self)
    cpdef bint showsSuRegularities(self)
    cpdef bint containsFlag(self, str flag)
