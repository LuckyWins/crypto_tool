import 'package:cryptotool/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dartx/dartx.dart';

class MoneyField extends StatelessWidget {
  final Function(double value) onSaved;
  final double? initialValue;
  final FocusNode? focusNode;
  final String? label;
  final bool mandatory;
  final int decimalRange;

  const MoneyField({
    required this.onSaved,
    this.initialValue,
    this.focusNode,
    this.label,
    this.mandatory = false,
    this.decimalRange = 2
  });
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue?.toString() ?? '',
      focusNode: focusNode,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp('[\\-|\\ ]')),
        NumberTextInputFormatter(decimalRange: decimalRange)
      ],
      decoration: InputDecoration(
        labelText: label
      ),
      validator: (value) {
        if (mandatory && (value?.isEmpty ?? true)) {
          return 'Поле обязательно для заполнения';
        }
        double? currency = value?.toDoubleOrNull();
        if (currency == null || currency < 0) {
          return 'Некорректное значение';
        }
        return null;
      },
      onSaved: (value) => onSaved.call(value!.toDouble()),
    );
  }
}