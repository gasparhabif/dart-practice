class WordCount {
  Map<String, int> countWords(String phrase) {
    Map<String, int> result = {};

    RegExp(r"(\w+('\w+)?)").allMatches(phrase.toLowerCase()).forEach((match) {
      String word = match.group(0)!;
      result[word] = (result[word] ?? 0) + 1;
    });

    return result;
  }
}
