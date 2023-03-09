const Map<String, int> resistors = {
  "black": 0,
  "brown": 1,
  "red": 2,
  "orange": 3,
  "yellow": 4,
  "green": 5,
  "blue": 6,
  "violet": 7,
  "grey": 8,
  "white": 9
};

class ResistorColorDuo {
  int value(List<String> bands) => int.parse(
      bands.sublist(0, 2).map((key) => resistors[key]!.toString()).join(''));
}
