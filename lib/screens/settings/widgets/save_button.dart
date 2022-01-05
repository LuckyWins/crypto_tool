import 'package:cryptotool/styles.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function() onPressed;

  const SaveButton({
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: onPressed.call,
    child: const Text(
      'Сохранить',
      style: TextStyle(
        color: AppStyles.mainColor,
        // fontSize: 16,
        fontWeight: FontWeight.w400
      ),
    ),
  );
}