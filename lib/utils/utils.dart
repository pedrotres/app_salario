import 'dart:math';

class Utils {
  static final Utils functions = Utils._();
  Utils._();

  double roundDown(double value, int precision) {
    final isNegative = value.isNegative;
    final mod = pow(10.0, precision);
    final roundDown = (((value.abs() * mod).floor()) / mod);
    return isNegative ? -roundDown : roundDown;
  }
}
