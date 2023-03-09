Map<int, String> factorValues = {3: "Pling", 5: "Plang", 7: "Plong"};

class Raindrops {
  String convert(int n) {
    String result = "";
    factorValues.forEach((key, value) {
      if (n % key == 0) result += value;
    });
    return result == "" ? n.toString() : result;
  }
}
