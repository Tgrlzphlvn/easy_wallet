class AmountValidator {
  static String amountValidator(String? value) {
    if (value != null) {
      if (value.length == 4) {
        return _amountValidatorHelper(value, 0, 1, 1, 4);
      } else if (value.length == 5) {
        return _amountValidatorHelper(value, 0, 2, 2, 5);
      } else if (value.length == 6) {
        return _amountValidatorHelper(value, 0, 3, 3, 6);
      } else if (value.length == 7) {
        return _amountValidatorHelper(value, 0, 1, 1, 4, n: 4, k: 7);
      } else if (value.length == 8) {
        return _amountValidatorHelper(value, 0, 2, 2, 5, n: 5, k: 8);
      } else if (value.length == 9) {
        return _amountValidatorHelper(value, 0, 3, 3, 6, n: 6, k: 9);
      }
    }
    return value ?? '';
  }

  static String _amountValidatorHelper(String value, int x, int y, int z, int i,
      {int? n, int? k}) {
    String helper = '';
    String helper1 = '';
    String helper2 = '';
    String helper3 = '';

    helper = value.substring(x, y);
    helper1 = value.substring(z, i);
    if (n != null || k != null) helper2 = value.substring(n!, k!);
    helper3 =
        n != null || k != null ? '$helper,$helper1,$helper2' : '$helper,$helper1';

    return helper3;
  }
}
