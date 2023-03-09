class CollatzConjecture {
  int steps(int n) {
    if (n <= 0) throw ArgumentError('Only positive integers are allowed');
    int stepCounter = 0;
    while (n != 1) {
      n = (n.isEven ? n / 2 : n * 3 + 1).toInt();
      stepCounter++;
    }
    return stepCounter;
  }
}
