class Isogram {
  bool isIsogram(String word) {
    word = word.toLowerCase().replaceAll(new RegExp(r'\W'), '');
    return word.split('').toSet().join('') == word;
  }
}
