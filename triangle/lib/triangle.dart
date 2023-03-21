class Triangle {
  bool equilateral(num s1, num s2, num s3) =>
      _requiredSidesEqual([s1, s2, s3], 1);
  bool isosceles(num s1, num s2, num s3) =>
      _requiredSidesEqual([s1, s2, s3], 2) || equilateral(s1, s2, s3);
  bool scalene(num s1, num s2, num s3) => _requiredSidesEqual([s1, s2, s3], 3);

  bool _requiredSidesEqual(List<num> sides, int equals) =>
      _validTriangle(sides) && sides.toSet().length == equals;

  bool _validTriangle(List<num> sides) => sides.every((side) =>
      side > 0 &&
      side <= sides.fold(0.0, (total, nSide) => total += nSide) - side);
}
