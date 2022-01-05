import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';

class SortOptionField extends StatelessWidget {
  final TextEditingController controller;
  final Function() onTap;

  const SortOptionField({
    required this.controller,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    onTap: onTap.call,
    readOnly: true,
    decoration: const InputDecoration(
      labelText: 'Сортировка при запуске',
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