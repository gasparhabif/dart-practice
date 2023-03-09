const dnaComplements = {"G": "C", "C": "G", "T": "A", "A": "U"};

class RnaTranscription {
  String toRna(String dna) => dna.runes
      .map((letter) => dnaComplements[String.fromCharCode(letter)])
      .join('');
}
