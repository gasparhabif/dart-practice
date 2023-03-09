class Leap {
  // Put your code here
  bool shortLeapYear(int year) =>
      (year % 4 == 0 && year % 100 != 0) ||
      (year % 100 == 0 && year % 400 == 0);

  bool leapYear(int year) {
    bool evenlyDivisibleBy4() => year % 4 == 0;
    bool evenlyDivisibleBy100() => year % 100 == 0;
    bool evenlyDivisibleBy400() => year % 400 == 0;

    return evenlyDivisibleBy4() && !evenlyDivisibleBy100() ||
        evenlyDivisibleBy100() && evenlyDivisibleBy400();
  }
}
