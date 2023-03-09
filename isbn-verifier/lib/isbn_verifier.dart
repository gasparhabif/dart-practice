bool isValid(String code) {
  code = code.replaceAll('-', '');
  int isbnLength = 10;
  if (code.length != isbnLength || code.contains(RegExp("[^0-9X-]")))
    return false;
  if (code.contains('X') && code[isbnLength - 1] != 'X') return false;

  int sum = code.replaceAll('-', '').split('').fold(0, (total, digit) {
    total += (digit == 'X' ? 10 : int.parse(digit)) * isbnLength;
    isbnLength--;
    return total;
  });
  return sum % 11 == 0;
}
