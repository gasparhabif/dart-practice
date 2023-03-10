class NthPrime {
  int prime(int n) {
    if (n == 0) throw ArgumentError("There is no zeroth prime");

    var number = 1;
    var primes = [2, 3, 5, 7, 11];
    while (n > 0) {
      number++;
      if (primes.every((p) => number % p != 0 || number == p)) {
        n--;
        primes.add(number);
      }
    }
    return number;
  }
}
