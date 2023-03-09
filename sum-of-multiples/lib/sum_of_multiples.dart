class SumOfMultiples {
  int sum(List<int> multiplesOf, int upTo) {
    Set<int> allMultiples = {};
    multiplesOf.forEach((n) => allMultiples.addAll(_findMultiplesOfN(n, upTo)));
    return allMultiples.fold(0, (total, n) => total += n);
  }

  List<int> _findMultiplesOfN(int n, int upTo) {
    List<int> result = [];
    for (int i = 1; i < upTo; i++) {
      var multiply = i * n;
      if (multiply < upTo)
        result.add(multiply);
      else
        return result;
    }
    return result;
  }
}
