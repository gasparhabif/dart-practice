import 'dart:math';

const Map<String, double> orbitPerPlanet = {
  "Mercury": 0.2408467,
  "Venus": 0.61519726,
  "Earth": 1,
  "Mars": 1.8808158,
  "Jupiter": 11.862615,
  "Saturn": 29.447498,
  "Uranus": 84.016846,
  "Neptune": 164.79132
};

const earthYearInSeconds = 31557600;

class SpaceAge {
  double age({String planet = "Earth", int seconds = 0}) =>
      _roundDouble(seconds / (earthYearInSeconds * orbitPerPlanet[planet]!), 2);

  double _roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
}
