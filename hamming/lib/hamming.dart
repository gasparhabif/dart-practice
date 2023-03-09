final mustEqual = ArgumentError('strands must be of equal length');

class Hamming {
  int distance(String strand1, String strand2) {
    var counter = 0;

    if (strand1.length != strand2.length) throw mustEqual;

    for (int i = 0; i < strand1.length; i++)
      counter += strand1[i] == strand2[i] ? 0 : 1;

    return counter;
  }
}
