class PhoneNumber {
  String clean(String input) {
    _checkInvalidChars(input, "[A-Za-z]", "letters not permitted");
    _checkInvalidChars(input, "[@:!]", "punctuations not permitted");
    input = input.replaceAll(RegExp("[(),.\\-\\ +]"), '');
    var len = input.length;
    if (len < 10) throw FormatException("incorrect number of digits");
    if (len > 11) throw FormatException("more than 11 digits");
    if (len == 11) {
      _checkInvalidChars(input, "^[^1]", "11 digits must start with 1");
      input = input.substring(1);
    }
    _checkInvalidChars(input, "^0", "area code cannot start with zero");
    _checkInvalidChars(input, "^1", "area code cannot start with one");
    _checkInvalidChars(
        input.substring(3), "^0", "exchange code cannot start with zero");
    _checkInvalidChars(
        input.substring(3), "^1", "exchange code cannot start with one");

    return input;
  }

  void _checkInvalidChars(String input, String exp, String error) {
    if (input.contains(RegExp(exp))) throw FormatException(error);
  }
}
