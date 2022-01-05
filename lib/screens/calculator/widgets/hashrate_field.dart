import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HashrateField extends StatelessWidget {
  final TextEditingController controller;

  const HashrateField({
    required this.controller
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        'Ваш хэшрейт',
        style: TextStyle(
          fontSize: 16
        ),
      ),
      const SizedBox(width: 8),
      SizedBox(
        width: 100,
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            // ignore: use_raw_strings
            FilteringTextInputFormatter.deny(RegExp('[\\-|\\ |\\,|\\.]'))
          ],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      const SizedBox(width: 8),
      const Text(
        'MH',
        style: TextStyle(
          fontSize: 16,
          // fontWeight: FontWeight.bold
        ),
      )
    ],
  );
}