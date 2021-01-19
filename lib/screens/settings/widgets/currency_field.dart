import 'package:cryptotool/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dartx/dartx.dart';

class CurrencyField extends StatelessWidget {
  final Function(double value) onSaved;
  final double initialValue;
  final FocusNode focusNode;

  const CurrencyField({
    @required this.onSaved,
    this.initialValue,
    this.focusNode
  });
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue?.toString() ?? "",
      focusNode: focusNode,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[\\-|\\ ]')), NumberTextInputFormatter(decimalRange: 2)],
      decoration: InputDecoration(
        labelText: "Курс *",
      ),
      validator: (value) {
        double currency = value.toDoubleOrNull();
        if (currency == null || currency < 0) {
          return "Некорректное значение";
        }
        return null;
      },
      onSaved: (value) => onSaved?.call(value.toDoubleOrNull()),
    );
  }
}