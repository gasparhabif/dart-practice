import 'dart:math';

class DifferenceOfSquares {
  List<int> _generateListToN(int n) =>
      List<int>.generate(n, (index) => index + 1);

  int _sumOfNumbersToN(int n) =>
      _generateListToN(n).fold(0, (total, value) => total += value);

  int squareOfSum(int n) => pow(_sumOfNumbersToN(n), 2).toInt();

  int sumOfSquares(int n) => _generateListToN(n)
      .fold(0, (total, value) => total += pow(value, 2).toInt());

  int differenceOfSquares(int n) => squareOfSum(n) - sumOfSquares(n);
}
