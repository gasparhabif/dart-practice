const Map<String, int> allergens = {
  "cats": 128,
  "pollen": 64,
  "chocolate": 32,
  "tomatoes": 16,
  "strawberries": 8,
  "shellfish": 4,
  "peanuts": 2,
  "eggs": 1,
};

class Allergies {
  bool allergicTo(String allergen, int value) => list(value).contains(allergen);
  List<String> list(int value) {
    List<String> res = [];
    while (value > 256) value -= 256;
    if (value >= 256) value -= (value >> 1);
    allergens.forEach((key, val) {
      if (value - val >= 0) {
        res.add(key);
        value = value - val;
      }
    });
    return res.reversed.toList();
  }
}

void main() {
  Allergies allergies = Allergies();
  print(allergies.list(509));
}
