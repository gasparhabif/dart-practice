class ArmstrongNumbers {
  // Put your code here
  bool isArmstrongNumber(String number) {
    var power = number.length;

    var value = number.split('').fold(BigInt.from(0),
        (total, digit) => total += BigInt.parse(digit).pow(power));

    print('The total is $value');

    return value.toString() == number;
  }
}
