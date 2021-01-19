import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final Function() onPressed;

  const SettingsButton({
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed?.call(),
      icon: Icon(Icons.settings),
    );
  }
}