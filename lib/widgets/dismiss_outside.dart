import 'package:flutter/material.dart';

/// tap outside to to dismiss focus
class DismissOutside extends StatelessWidget {
  final Widget child;

  const DismissOutside({
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: child,
    );
  }
}