class Luhn {
  bool valid(String input) {
    input = input.replaceAll(' ', '');
    if (input.length < 2 || input.contains(RegExp('[^0-9]'))) return false;
    List<int> charsInput = input.split('').map((e) => int.parse(e)).toList();
    for (int i = charsInput.length - 1; i >= 0; i--) {
      if ((charsInput.length - 1 - i) % 2 == 1) {
        var dup = charsInput[i] * 2;
        charsInput[i] = dup > 9 ? dup - 9 : dup;
      }
    }
    return charsInput.fold(0, (total, e) => total += e) % 10 == 0;
  }
}
