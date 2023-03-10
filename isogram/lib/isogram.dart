class Isogram {
  bool isIsogram(String word) {
    word = word.toLowerCase().replaceAll('-', '').replaceAll(' ', '');
    return word.split('').toSet().join('') == word;
  }
}
