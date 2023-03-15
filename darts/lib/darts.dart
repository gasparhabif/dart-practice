import 'dart:math';

// Key: Points, Value: Radius
const pointsPerRadius = {
  1: 10,
  5: 5,
  10: 1,
};

class Darts {
  int score(num x, num y) => pointsPerRadius.keys.fold(
      0,
      (finalValue, points) => finalValue =
          distanceToOrigin(x, y) <= pointsPerRadius[points]!
              ? points
              : finalValue);

  num distanceToOrigin(num x, num y) => sqrt(pow(0 - x, 2) + pow(0 - y, 2));
}
