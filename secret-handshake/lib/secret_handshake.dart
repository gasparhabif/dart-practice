const Map<int, String> values = {
  16: "reverse",
  8: "jump",
  4: "close your eyes",
  2: "double blink",
  1: "wink",
};

class SecretHandshake {
  List<String> commands(int n) {
    List<String> res = [];
    bool reverse = false;

    values.forEach((key, value) {
      if (n - key >= 0) {
        if (key == 16)
          reverse = true;
        else
          res.add(value);
        n -= key;
      }
    });

    return reverse ? res : res.reversed.toList();
  }
}
