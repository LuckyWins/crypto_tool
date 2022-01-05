import 'dart:math';

extension DoubleExtension on double {

  double roundFixed() {
    final mod = pow(10.0, 2).toDouble(); 
    return (isNaN || isInfinite) ? 0 : (this * mod).round().toDouble() / mod; 
  }
}