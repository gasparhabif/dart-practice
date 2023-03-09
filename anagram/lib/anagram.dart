class Anagram {
  List<String> findAnagrams(String word, List<String> candidates) => candidates
      .where((candidate) =>
          candidate.toLowerCase() != word.toLowerCase() &&
          _containsExactSameLetters(word, candidate))
      .toList();

  bool _containsExactSameLetters(String word, String candidate) {
    List<String> wordChars = word.toLowerCase().split('')..sort();
    List<String> candidateChars = candidate.toLowerCase().split('')..sort();
    return wordChars.join() == candidateChars.join();
  }
}
