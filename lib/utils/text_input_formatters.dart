import 'package:flutter/services.dart';

class NumberTextInputFormatter extends TextInputFormatter {
  NumberTextInputFormatter({
    required this.decimalRange
  }) : assert(decimalRange > 0, 'decimalRange must be > 0');

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final _newValue = sanitize(newValue);
    final text = _newValue.text;

    if (text == ',' || text == '.') {
      return TextEditingValue(
        text: '0.',
        selection: _newValue.selection.copyWith(baseOffset: 2, extentOffset: 2),
        composing: TextRange.empty,
      );
    }

    return isValid(text) ? _newValue : oldValue;
  }

  bool isValid(String text) {
    final dots = '.'.allMatches(text).length;

    if (dots == 0) {
      return true;
    }

    if (dots > 1) {
      return false;
    }

    return text.substring(text.indexOf('.') + 1).length <= decimalRange;
  }

  TextEditingValue sanitize(TextEditingValue value) {
    final tempText = value.text.replaceAll(',', '.');

    if (false == tempText.contains('-')) {
      return value.copyWith(text: tempText);
    }

    final text = '-${tempText.replaceAll('-', '')}';

    return TextEditingValue(text: text, selection: value.selection, composing: TextRange.empty);
  }
}