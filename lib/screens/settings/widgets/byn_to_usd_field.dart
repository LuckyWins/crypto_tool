import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';

class BynToUsdField extends StatelessWidget {
  final TextEditingController controller;
  final Function() onTap;

  const BynToUsdField({
    required this.controller,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    onTap: onTap.call,
    readOnly: true,
    decoration: const InputDecoration(
      labelText: 'BYN -> USD',
      suffixIcon: Padding(
          padding: EdgeInsets.only(top: 16, left: 10),
          child: Icon(
            Icons.expand_more,
            color: AppStyles.mainColor,
            size: 35,
          )
      )
    ),
  );
}