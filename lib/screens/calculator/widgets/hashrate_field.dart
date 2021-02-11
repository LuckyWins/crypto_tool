import 'package:cryptotool/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HashrateField extends StatelessWidget {
  final TextEditingController controller;

  const HashrateField({
    @required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Ваш хэшрейт",
          style: TextStyle(
            fontSize: 16
          ),
        ),
        SizedBox(width: 8),
        SizedBox(
          width: 100,
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[\\-|\\ ]')),
              NumberTextInputFormatter(decimalRange: 2)
            ],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(width: 8),
        Text(
          "MH",
          style: TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}