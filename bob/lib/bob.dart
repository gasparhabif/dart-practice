class Bob {
  String response(String text) {
    if (text.replaceAll(RegExp("[\r\n\t\f\v ]"), "") == "")
      return "Fine. Be that way!";
    if (RegExp(".*\\?+ *").stringMatch(text) == text)
      return _isYelling(text) ? "Calm down, I know what I'm doing!" : "Sure.";
    if (_isYelling(text)) return "Whoa, chill out!";
    return "Whatever.";
  }

  bool _isYelling(String text) =>
      text.contains(RegExp("[a-zA-Z]")) && text.toUpperCase() == text;
}
