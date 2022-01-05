import 'dart:math';

extension DoubleExtension on double {

  double roundFixed() {
    double mod = pow(10.0, 2).toDouble(); 
    return (this.isNaN || this.isInfinite) ? 0 : (this * mod).round().toDouble() / mod; 
  }
}