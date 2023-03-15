class Acronym {
  String abbreviate(String input) => input
      .toUpperCase()
      .replaceAll(RegExp("[-_]"), ' ')
      .split(' ')
      .map((word) => word.isEmpty ? '' : word.substring(0, 1))
      .join('');
}
