import 'package:flutter/material.dart';

class OnlinerButton extends StatelessWidget {
  final Function() onPressed;

  const OnlinerButton({
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed?.call(),
      icon: Icon(Icons.store),
    );
  }
}